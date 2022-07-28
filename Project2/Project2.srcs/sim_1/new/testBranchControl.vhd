library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity testBranchControl is

end testBranchControl;

architecture Behavioral of testBranchControl is

Component branchcontrol is
    Port ( PL : in STD_LOGIC;
           BC : in STD_LOGIC_VECTOR(3 downto 0);
           PC : in STD_LOGIC_VECTOR (31 downto 0);
           AD : in STD_LOGIC_VECTOR (31 downto 0);
           Flags : in STD_LOGIC_VECTOR(3 downto 0);
           PCLoad : out STD_LOGIC;
           PCValue : out STD_LOGIC_VECTOR (31 downto 0));
end component;

signal PL,PCLoad:std_logic ;
signal PCValue,PC, AD:std_logic_vector(31 downto 0);
signal Flags, BC : STD_LOGIC_VECTOR(3 downto 0);


  
begin
Processor: branchcontrol port map(PL=>PL, PC=>PC, AD=>AD, PCValue=>PCValue,BC=>BC, Flags=>Flags, PCLoad=>PCLoad );

process
begin
PC<="00000000000000000000000000000001";
PL<='0';--não faz branch
AD<="00000000000000000000000000000111";
Flags<="1111";
BC<="1111";
wait for 5 ns;


PC<="00000000000000000000000000000001";
PL<='1';
AD<="00000000000000000000000000000111";
Flags<="1111";
BC<="0001";--Faz salto independentemente das flags
wait for 5 ns;

PC<="00000000000000000000000000000001";
PL<='1';
AD<="00000000000000000000000000000111";
Flags<="1010";
BC<="0010";
wait for 5 ns;

PC<="00000000000000000000000000000001";
PL<='1';
AD<="00000000000000000000000000000111";
Flags<="1011";
BC<="0011";
wait for 5 ns;

PC<="00000000000000000000000000000001";
PL<='1';
AD<="00000000000000000000000000000111";
Flags<="0110";
BC<="0100";
wait for 5 ns;

PC<="00000000000000000000000000000001";
PL<='1';
AD<="00000000000000000000000000000111";
Flags<="0000";
BC<="0101";
wait for 5 ns;

PC<="00000000000000000000000000000001";
PL<='1';
AD<="00000000000000000000000000000111";
Flags<="1010";
BC<="0110";
wait for 5 ns;

PC<="00000000000000000000000000000001";
PL<='1';
AD<="00000000000000000000000000000111";
Flags<="0100";
BC<="0111";
wait for 5 ns;

end process;
end Behavioral;