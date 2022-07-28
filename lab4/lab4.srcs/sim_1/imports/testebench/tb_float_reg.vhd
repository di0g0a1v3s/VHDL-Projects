----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2016 10:19:20
-- Design Name: 
-- Module Name: tb_float_reg_53 - Behavioral
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

entity tb_float_reg is
--  Port ( );
end tb_float_reg;

architecture Behavioral of tb_float_reg is

    component float_reg 
    Port ( clk           : in STD_LOGIC;
           reset         : in STD_LOGIC;
           op            : in STD_LOGIC_VECTOR  (2 downto 0);
           arithmetic_in : in STD_LOGIC_VECTOR  (4 downto 0);
           num_in        : in STD_LOGIC_VECTOR  (7 downto 0);
           num           : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    -- sinais internos 
    --signal mux_out : STD_LOGIC_VECTOR (7 downto 0);
    signal clk, reset: STD_LOGIC := '0';
    signal op : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal num_in : STD_LOGIC_VECTOR (7 downto 0) := "01010110";
    signal arithmetic_in : STD_LOGIC_VECTOR (4 downto 0) := "10101";

    signal num : STD_LOGIC_VECTOR (7 downto 0);
    signal exp_val : STD_LOGIC_VECTOR (2 downto 0);
    signal mant_val : STD_LOGIC_VECTOR (4 downto 0);
    

begin

    mant_val <= num(7 downto 3);
    exp_val <= num(2 downto 0);

 -- instancia do componente (unidade de teste) 
    test_unit : float_reg port map (
     clk => clk, reset => reset, 
     op => op, 
     --mux_out => mux_out,
     arithmetic_in => arithmetic_in, num_in => num_in, 
     num => num 
     );
       
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
               -- load from num_in
               op    <= "101";
               wait for 50 ns;
               -- load from exp arithmetic_in and SRA mant
               op    <= "001";
               wait for 50 ns;
               -- load from num_in
               op    <= "010";
			   wait for 50 ns;
               -- hold
               op    <= "011";
               wait for 50 ns;
               -- hold mantissa and load exp
               op    <= "100";
               wait for 50 ns;
               -- hold exp and load mantissa
               op    <= "110";
               wait for 50 ns;
               op <= "111";
               wait for 50 ns;
               op    <= "000";
               wait; -- forever 
           end process;
end Behavioral;
