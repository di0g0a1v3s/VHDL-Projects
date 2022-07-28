----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2016 07:01:05 PM
-- Design Name: 
-- Module Name: m21 - Behavioral
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

entity m21 is
    Port ( s : in STD_LOGIC;
           d0 : in STD_LOGIC;
           d1 : in STD_LOGIC;
           y : out STD_LOGIC);
end m21;

architecture Behavioral of m21 is
begin
    y <= d0 when s='0' else d1;
end Behavioral;
