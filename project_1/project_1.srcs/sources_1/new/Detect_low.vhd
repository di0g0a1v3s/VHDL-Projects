library ieee;
use ieee.std_logic_1164.all;

entity Detect_low is
	port(A: in std_logic_vector(15 downto 0);
		 B: in std_logic_vector(15 downto 0);
		 small_number: out std_logic);
end Detect_low;

architecture structural of Detect_low is
	signal small_numberA:  std_logic;
	signal small_numberB:  std_logic;
begin
    
    --lógica que deteta se um numero é small_number
    small_numberA <= ( A(15) and A(14) and A(13) and A(12) and A(11) and A(10) and A(9)and A(8) and A(7) ) or ( not A(15) and not A(14) and not A(13) and not A(12) and not A(11) and not A(10) and not A(9)and not A(8) and not A(7) );
    small_numberB <= ( B(15) and B(14) and B(13) and B(12) and B(11) and B(10) and B(9)and B(8) and B(7) ) or ( not B(15) and not B(14) and not B(13) and not B(12) and not B(11) and not B(10) and not B(9)and not B(8) and not B(7) );
    small_number <= small_numberA and small_numberB;   
     
end structural;
