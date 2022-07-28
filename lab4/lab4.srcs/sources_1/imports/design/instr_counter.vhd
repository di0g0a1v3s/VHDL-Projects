----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.11.2016 21:54:30
-- Design Name: 
-- Module Name: instr_counter - Behavioral
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

entity instr_counter is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;
		   ld 	     : in STD_LOGIC;
           LD_I 	 : in STD_LOGIC_VECTOR (3 downto 0);
		   
           I     : out STD_LOGIC_VECTOR (3 downto 0);
           hold 	 : out STD_LOGIC;
           load_args : out STD_LOGIC);
end instr_counter;

architecture Behavioral of instr_counter is

    component ctr_16 
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               ce : in STD_LOGIC;
               ld : in STD_LOGIC;
               d  : in STD_LOGIC_VECTOR (3 downto 0);
               q  : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    component ctr_control 
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               start : in STD_LOGIC;
               instr : in STD_LOGIC_VECTOR (3 downto 0);
			   
               hold  : out STD_LOGIC;
               load_args : out STD_LOGIC);
    end component;
    
     --declaracao dos sinais internos

     signal instr_intern : STD_LOGIC_VECTOR (3 downto 0);
     signal cntr_en, hold_intern, ld_intern, load_args_intern  : STD_LOGIC;       
    
begin


    -- Componentes internos
    CNTR_CTRL: ctr_control port map (
        clk => clk, reset => reset,    
        start => start, instr => instr_intern,
        hold => hold_intern, load_args => load_args_intern                 
    );
    
    cntr_en  <= not hold_intern;
    -- load only if counter is not on hold
    ld_intern <= ld and cntr_en;  
         
    --  contador 4 bits que conta a instrução 
    CNTR : ctr_16 port map (
        clk => clk, reset => reset, 
		ce => cntr_en, ld => ld_intern,
		
        d => ld_i, q => instr_intern
    );

	-- atribuição das saídas
    load_args <= load_args_intern;
    hold 	  <= hold_intern;
    I 	  <= instr_intern;

end Behavioral;
