----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/14/2016 12:37:35 AM
-- Design Name: 
-- Module Name: tb_float_add - Behavioral
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

entity tb_float_add is
--  Port ( );
end tb_float_add;

architecture Behavioral of tb_float_add is
    component float_add
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           OutA : out STD_LOGIC_VECTOR (7 downto 0);
           OutB : out STD_LOGIC_VECTOR (7 downto 0);
           I : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    --inputs
     signal clk, reset, start: STD_LOGIC := '0';
    signal A, B : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    -- ouptuts 
    signal A_out, B_out : STD_LOGIC_VECTOR (7 downto 0); 
    signal mA, mB : STD_LOGIC_VECTOR (4 downto 0); 
    signal eA, eB : STD_LOGIC_VECTOR (2 downto 0);
    signal I_out        : STD_LOGIC_VECTOR (3 downto 0);  
begin

-- instancia do componente (unidade de teste) 
    test_unit : float_add port map (
     clk => clk, reset => reset,
     start => start, 
     A => A, B => B,
     OutA => A_out, OutB => B_out, I => I_out);
       
    -- helper signals to split mantissa and exp, can be done in waves, but here is faster
    mA <= A_out(7 downto 3);
    mB <= B_out(7 downto 3);   
    eA <= A_out(2 downto 0);
    eB <= B_out(2 downto 0);   
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
           -- sart 
           A    <= "01010010"; -- 10
           B    <= "11000000"; -- 4
           start    <= '1';
           wait for 2*50 ns;
           start    <= '0';
           wait for 20*50 ns;
           
           -- set inputs, counter is on hold, should not do anything
           A    <= "00111101"; -- + 7*2^5
           B    <= "11100100"; -- -4*2^4
           wait for 100 ns;
           -- start the system
           start    <= '1';
           wait for 100 ns;
           start    <= '0';
             wait for 20*50 ns;
                    
                 -- set inputs, counter is on hold, should not do anything
                    A    <= "01111010"; -- + 15*2^2
                    B    <= "01100001"; -- + 12*2^1
                    wait for 100 ns;
                           -- start the system
                    start    <= '1';
                    wait for 100 ns;
                    start    <= '0';
           
           
           wait; -- forever 
       end process;
 
end Behavioral;
