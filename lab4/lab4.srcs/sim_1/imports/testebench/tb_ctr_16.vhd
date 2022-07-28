----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2016 22:36:06
-- Design Name: 
-- Module Name: tb_ctr16 - Behavioral
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

entity tb_ctr_16 is

end tb_ctr_16;

architecture Behavioral of tb_ctr_16 is
    component ctr_16 
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               ce : in STD_LOGIC;
               ld : in STD_LOGIC;
               d : in STD_LOGIC_VECTOR (3 downto 0);
               q : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    -- sinais internos 
    signal clk, reset, ld, ce : STD_LOGIC := '0';
    signal d : STD_LOGIC_VECTOR (3 downto 0) := "0101";
    signal q : STD_LOGIC_VECTOR (3 downto 0);

begin
 -- instancia do componente (unidade de teste) 
    test_unit : ctr_16 port map (
     clk => clk, reset => reset, ce => ce, ld => ld,
     d => d, q => q);
       
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
               -- hold CE to sart counter
               ce    <= '1';
               wait for 8*50 ns;
               ce    <= '0';
               wait for 2*50 ns;
               ce    <= '1';
               wait for 10*50 ns;
               ld    <= '1';
               wait for 50 ns;
               ld    <= '0';
               wait; -- forever 
           end process;
          
end Behavioral;
