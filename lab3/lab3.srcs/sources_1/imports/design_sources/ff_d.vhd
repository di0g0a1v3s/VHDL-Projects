----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2016 06:28:19 PM
-- Design Name: 
-- Module Name: ff_dr - Behavioral
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

entity ff_d is
    Port ( din : in STD_LOGIC;
           clk : in STD_LOGIC;
           set : in STD_LOGIC;
           reset : in STD_LOGIC;
           dout : out STD_LOGIC);
end ff_d;

architecture Behavioral of ff_d is
begin
    dout <= '0' when reset='1' else 
            '1' when set='1' else
            din when rising_edge(clk);
end Behavioral;
