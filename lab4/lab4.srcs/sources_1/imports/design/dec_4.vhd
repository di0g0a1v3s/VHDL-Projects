----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/13/2016 11:51:39 PM
-- Design Name: 
-- Module Name: dec_4 - Behavioral
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

entity dec_4 is
    Port ( s : in STD_LOGIC_VECTOR (3 downto 0);
           d : out STD_LOGIC_VECTOR (15 downto 0));
end dec_4;

-- decoder with 4 bit selection and 16 negated outputs
architecture Behavioral of dec_4 is
    signal ns : STD_LOGIC_VECTOR (3 downto 0);
begin
	ns <= not (s);	
	
	-- maxterm based decoder
	d(0)  <=   s(0) or  s(1)   or  s(2) or s(3);
	d(1)  <=  ns(0) or  s(1)   or  s(2) or s(3);
	d(2)  <=   s(0) or ns(1)   or  s(2) or s(3);
	d(3)  <=  ns(0) or ns(1)   or  s(2) or s(3);
	d(4)  <=   s(0) or  s(1)   or ns(2) or s(3);
	d(5)  <=  ns(0) or  s(1)   or ns(2) or s(3);
	d(6)  <=   s(0) or ns(1)   or ns(2) or s(3);
	d(7)  <=  ns(0) or ns(1)   or ns(2) or s(3);
	
	d(8)  <=   s(0) or  s(1)   or  s(2) or ns(3);
	d(9)  <=  ns(0) or  s(1)   or  s(2) or ns(3);
	d(10)  <=   s(0) or ns(1)   or  s(2) or ns(3);
	d(11)  <=  ns(0) or ns(1)   or  s(2) or ns(3);
	d(12)  <=   s(0) or  s(1)   or ns(2) or ns(3);
	d(13)  <=  ns(0) or  s(1)   or ns(2) or ns(3);
	d(14)  <=   s(0) or ns(1)   or ns(2) or ns(3);
	d(15)  <=  ns(0) or ns(1)   or ns(2) or ns(3);
	
end Behavioral;
