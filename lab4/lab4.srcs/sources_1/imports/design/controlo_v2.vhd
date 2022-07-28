----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2016 16:52:28
-- Design Name: 
-- Module Name: controlo - Behavioral
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

entity controlo is
Port (
    I : in STD_LOGIC_VECTOR (3 downto 0);
    RZ : in STD_LOGIC;
    
    ctr_ld : out std_logic;
    ld_i : out std_logic_vector (3 downto 0);    
    rz_ce   : out STD_LOGIC;
	ra_op  : out STD_LOGIC_VECTOR (2 downto 0);
    rb_op  : out STD_LOGIC_VECTOR (2 downto 0);
	alu_op : out STD_LOGIC_VECTOR (1 downto 0));
	
end controlo;

architecture Behavioral of controlo is
    component dec_4 
        Port ( s : in STD_LOGIC_VECTOR (3 downto 0);
              d : out STD_LOGIC_VECTOR (15 downto 0));
    end component;

    signal d : STD_LOGIC_VECTOR (15 downto 0);
    signal nZ_SRAmDECe : STD_LOGIC;
    
begin
    --  decoder com saidas negadas
    decoder : dec_4 port map (
        s => I, d => d 
    );

    -- instrucitons that are (nZ_SRAmDECe)
   nZ_SRAmDECe <=  not(d(2));


    rz_ce <= (not(RZ) and nZ_SRAmDECe) or --  instructions that depend on RZ  (nZ_SRAmDECe)
             not( d(1) and d(4)); -- minterms that do not depedend on RZ 
    
    ra_op(2) <= '0';
    ra_op(1) <= '0';    
    ra_op(0) <= not (d(4));
    
    
    rb_op(2) <= (not(RZ) and nZ_SRAmDECe) or --  instructions that depend on RZ  (nZ_SRAmDECe)
                not(d(1)); -- minterms that do not depedend on RZ                                   
    rb_op(1) <= (not(RZ) and nZ_SRAmDECe); 
    rb_op(0) <= (not(RZ) and nZ_SRAmDECe); 
                         
    ctr_ld <= not(d(3)) and not(RZ);  
    ld_i(3 downto 0) <= "0010";

    alu_op(1) <=  nZ_SRAmDECe;
    alu_op(0) <=  not( d(1));  

    




end Behavioral;
