----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2016 11:10:04 PM
-- Design Name: 
-- Module Name: tb_cntr_control - Behavioral
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

entity tb_ctr_control is
--  Port ( );
end tb_ctr_control;

architecture Behavioral of tb_ctr_control is
    component ctr_control 
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               start : in STD_LOGIC;
               instr : in STD_LOGIC_VECTOR (3 downto 0);
               hold : out STD_LOGIC;
               load_args : out STD_LOGIC);
    end component;
	
	    -- sinais internos 
        signal clk, reset, start, hold, load_args : STD_LOGIC := '0';
        signal instr : STD_LOGIC_VECTOR (3 downto 0):= "0101";
		
begin

	--- instancia do componente (unidade de teste) 
    test_unit : ctr_control port map (
     clk => clk, reset => reset, 
     start => start, instr => instr, 
     hold => hold, load_args => load_args);
       
	-- process that will non-stop generate the clock signal
	-- '0' for 25ns, followed by '1' for another 25 ns (and so on...)
	process begin
	  clk <= '0';
	  wait for 25 ns;
	  clk <= '1';
	  wait for 25 ns;
	end process;

	 -- process to test the circuit 
	process begin
	   -- hold reset for the first 2 clock cycles 2x(2*25)
	   reset <= '1';
	   wait for 2*50 ns;
	   reset <= '0';
	   wait for 2*50 ns;
	   -- sart counter
	   instr     <= "0000";
	   start    <= '1';
	   wait for 50 ns;
	   start    <= '0';
	   wait for 50 ns;
	   instr     <= "0001";
	   wait for 50 ns;
	   start    <= '1';
	   wait for 100 ns;
	   start    <= '0';
	   wait; -- forever 
	end process;

end Behavioral;
