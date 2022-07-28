----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2016 11:11:34 PM
-- Design Name: 
-- Module Name: tb_inst_counter - Behavioral
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

entity tb_instr_counter is
--  Port ( );
end tb_instr_counter;

architecture Behavioral of tb_instr_counter is
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
    
    
    -- sinais internos 
        signal clk, reset, ld, start, hold, load_args : STD_LOGIC := '0';
        signal ld_i : STD_LOGIC_VECTOR (3 downto 0) := "0101";
        signal I : STD_LOGIC_VECTOR (3 downto 0);
    
begin

-- instancia do componente (unidade de teste) 
    test_unit : instr_counter port map (
     clk => clk, reset => reset,
     ld => ld, LD_I => ld_i, 
     start => start, I => I, 
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
               -- sart counter (test start enable for 4 cycle to make sure it only starts once)
               start    <= '1';
               wait for 4*50 ns;
               start    <= '0';
               wait for 20*50 ns;
               
               -- set ld, but counter is on hold, should not do anything
               ld    <= '1';
               wait for 100 ns;
               -- start the counter, inst should pass from 0 to 5 
               start    <= '1';
               wait for 100 ns;
               ld    <= '0';
               wait; -- forever 
           end process;
 




end Behavioral;
