library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Zero is
    port(   Data : in std_logic_vector (15 downto 0);
            D : out std_logic);
end Zero;

architecture Behavioral of Zero is
begin
    D <= ((not Data(0) and not Data(1) and not Data(2) and not Data(3)) and (not Data(4) and not Data(5) and not Data(6) and not Data(7))) and 
        ((not Data(8) and not Data(9) and not Data(10) and not Data(11)) and (not Data(12) and not Data(13) and not Data(14) and not Data(15)));
end Behavioral;
