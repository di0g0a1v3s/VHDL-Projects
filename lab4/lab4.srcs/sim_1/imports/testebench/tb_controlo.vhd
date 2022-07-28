----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/14/2016 06:56:46 PM
-- Design Name: 
-- Module Name: tb_controlo - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_controlo is
--  Port ( );
end tb_controlo;

architecture Behavioral of tb_controlo is
    component controlo 
        Port ( 
            I  : in STD_LOGIC_VECTOR (3 downto 0);
            RZ : in STD_LOGIC;
            
            
            rz_ce  : out STD_LOGIC;
			ra_op  : out STD_LOGIC_VECTOR (2 downto 0);
   		    rb_op  : out STD_LOGIC_VECTOR (2 downto 0);
            alu_op : out STD_LOGIC_VECTOR (1 downto 0)
			);
    end component;
	
	signal I : STD_LOGIC_VECTOR (3 downto 0):= "0000";
	signal RZ : STD_LOGIC:= '0';
	
	    -- outs
    signal rz_ce : STD_LOGIC;  
	signal ra_op, rb_op : STD_LOGIC_VECTOR(2 downto 0);
	signal alu_op : STD_LOGIC_VECTOR(1 downto 0) ;
    
	
begin
     --- Controlo       
     CTRL : controlo port map ( 
          I => I, RZ => RZ,
          rz_ce => rz_ce, 
          ra_op => ra_op, rb_op => rb_op,
		  alu_op => alu_op);

	
	-- first test process that increments A every 25ns
    -- to be able to use this '+', it is necessary to add "use IEEE.STD_LOGIC_UNSIGNED.ALL;" in line 24 of this test
    -- if this library is not included, it will show the error and the simulation will not run
    process begin
        wait for 10 ns;
        RZ <= '1';
        wait for 10 ns;
        RZ <= '0';
    end process;
    
    -- second test process that increments B every 4*25ns (in parallel with A)
    process begin
        wait for 20 ns;
        I <= I + 1;
    end process;
	
	
	


end Behavioral;
