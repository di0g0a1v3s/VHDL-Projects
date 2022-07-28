----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2016 10:47:20
-- Design Name: 
-- Module Name: float_add - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity float_add is
    Port ( clk   : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           OutA : out STD_LOGIC_VECTOR (7 downto 0);
           OutB : out STD_LOGIC_VECTOR (7 downto 0);
           I : out STD_LOGIC_VECTOR (3 downto 0));
end float_add;

architecture Behavioral of float_add is
--componentes
    component float_reg 
    Port ( clk           : in STD_LOGIC;
              reset         : in STD_LOGIC;
              op            : in STD_LOGIC_VECTOR  (2 downto 0);
              arithmetic_in : in STD_LOGIC_VECTOR  (4 downto 0);
              num_in        : in STD_LOGIC_VECTOR  (7 downto 0);
              num           : out STD_LOGIC_VECTOR (7 downto 0));
    end component ;
    
    component ff_de 
        Port ( din : in STD_LOGIC;
               clk : in STD_LOGIC;
               ce : in STD_LOGIC;
               reset : in STD_LOGIC;
               dout : out STD_LOGIC);
    end component ;
    
    component alu 
     Port ( op   : in STD_LOGIC_VECTOR (1 downto 0);
            A    : in STD_LOGIC_VECTOR (7 downto 0);
            B    : in STD_LOGIC_VECTOR (7 downto 0);
            S   : out STD_LOGIC_VECTOR (4 downto 0);
            Z    : out STD_LOGIC);
    end component ;

    component instr_counter 
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           ld : in STD_LOGIC;
           LD_I : in STD_LOGIC_VECTOR (3 downto 0);
           start : in STD_LOGIC;
           I : out STD_LOGIC_VECTOR (3 downto 0);
           hold : out STD_LOGIC;
           load_args : out STD_LOGIC);
    end component;
    
    component controlo 
        Port ( 
            I  : in STD_LOGIC_VECTOR (3 downto 0);
            RZ : in STD_LOGIC;
            
            ctr_ld : out std_logic;
            ld_i : out std_logic_vector (3 downto 0); 
            rz_ce   : out STD_LOGIC;
			ra_op  : out STD_LOGIC_VECTOR (2 downto 0);
   		    rb_op  : out STD_LOGIC_VECTOR (2 downto 0);
            alu_op : out STD_LOGIC_VECTOR (1 downto 0)
			);
    end component;
    
    -- sinais
    -- instruction counter
    signal ictr_hold : STD_LOGIC;
    signal ictr_load_args : STD_LOGIC;
    signal ictr_ld : STD_LOGIC;
    signal ictr_LD_I : STD_LOGIC_VECTOR (3 downto 0);
    signal ictr_I : STD_LOGIC_VECTOR (3 downto 0);
    
    -- registers
    signal ra_op, ra_op_mux, ra_op_intern : STD_LOGIC_VECTOR(2 downto 0);
    signal ra_out : STD_LOGIC_VECTOR(7 downto 0); 
     
    signal rb_op, rb_op_mux, rb_op_intern : STD_LOGIC_VECTOR(2 downto 0);    
    signal rb_out : STD_LOGIC_VECTOR(7 downto 0);  
    
    -- aritmetic unit
    signal alu_op : STD_LOGIC_VECTOR(1 downto 0);
    signal alu_s: STD_LOGIC_VECTOR(4 downto 0); 
    signal alu_z  : STD_LOGIC; 
    
    -- flags register
    signal rz_out  : STD_LOGIC;
    signal rz_ce, rz_ce_intern : STD_LOGIC;  
    
   

begin
    --  contador
    ICTR : instr_counter port map (
            clk => clk, reset => reset, 
            ld => ictr_ld, LD_I => ictr_LD_I,
            start => start, 
            I => ictr_I, hold => ictr_hold, load_args => ictr_load_args
        );
	--ictr_LD_I <= "0000";
	--ictr_ld     <= '0';
	
		
    --  registos
    -- quando o contador de instruçoes está em hold, o resistos ficam tambem em hold op 000 
    -- quando é dado o sinal de carregar  os argumentos, carrega  A and B registos op = 101
    ra_op_intern <= (2 downto 0 => not ictr_hold) and ra_op;
    ra_op_mux <= "101" when ictr_load_args='1' else ra_op_intern;
    
    rb_op_intern <= (2 downto 0 => not ictr_hold) and rb_op;
    rb_op_mux <= "101" when ictr_load_args='1' else rb_op_intern;
    
     RA: float_reg port map (
          clk => clk, reset => reset, 
          op => ra_op_mux,
          arithmetic_in => alu_s, num_in => A, 
          num => ra_out
      ); 

     RB: float_reg port map (
          clk => clk, reset => reset, 
          op => rb_op_mux,
          arithmetic_in => alu_s, num_in => B, 
          num => rb_out
           ); 


    rz_ce_intern <= (not ictr_hold) and rz_ce;
     RZ: ff_de port map (
               clk => clk, reset => reset, ce => rz_ce,
               din   => alu_z, dout => rz_out 
           );
            
     --- ALU 
     ALU1 : alu port map (
            op => alu_op,
            A => ra_out, B => rb_out,
            S => alu_s, Z => alu_z
            );
     --- Controlo       
     CTRL : controlo port map ( 
          I  => ictr_I, RZ => rz_out,
          ctr_ld => ictr_ld,
          ld_i => ictr_LD_I,
          rz_ce => rz_ce, 
          ra_op => ra_op, rb_op => rb_op,
		  alu_op => alu_op);       
            
     --- Saida 
    OutA <= ra_out;
    OutB <= rb_out;
    I <= ictr_I;
           
end Behavioral;
