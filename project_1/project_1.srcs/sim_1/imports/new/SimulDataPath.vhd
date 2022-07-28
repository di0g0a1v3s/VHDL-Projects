library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity SimulDataPath is
end SimulDataPath;

architecture Behavioral of SimulDataPath is

function to_LVU(arg, size : natural) return std_logic_vector is
begin
    return std_logic_vector(to_unsigned(arg, size));
end;

component DataPath is
    Port (
       AA : in std_logic_vector (3 downto 0);
       BA : in std_logic_vector (3 downto 0);
       DA : in std_logic_vector (3 downto 0);
       WR : in std_logic;
       MA, MB : in std_logic;
       KNS : in std_logic_vector (15 downto 0);
       CLK : in std_logic;
       MW : in std_logic;
       FS : in std_logic_vector (3 downto 0);
       MD : in std_logic;
       D : out std_logic_vector (15 downto 0);
       FL : out std_logic_vector (3 downto 0);
       MMA : in std_logic;
       MMB : in std_logic);
       
end component;

signal  AA : std_logic_vector (3 downto 0);
signal  BA : std_logic_vector (3 downto 0);
signal  DA : std_logic_vector (3 downto 0);
signal  WR : std_logic;
signal  MA, MB : std_logic;
signal  KNS : std_logic_vector (15 downto 0);
signal  clock : std_logic := '0';
signal  MW : std_logic;
signal  FS : std_logic_vector (3 downto 0);
signal  MD : std_logic;
signal  D : std_logic_vector (15 downto 0);
signal FL : std_logic_vector (3 downto 0);
signal MMA : std_logic;
signal MMB : std_logic;

begin
    process
    begin
        wait for 50 ns;
        clock <= not clock;
    end process;
    
    process
    begin
        wait until clock'event and clock='0';
        
        --semana 2(unidade artimetica)
        -- R1 <- 38h
        AA<="0000" ; BA<="0000"; DA<="0001"; WR<='1'; MA<='1'; MB<='1'; KNS<=x"0038"; MW<='0'; FS<="0100"; MD<='0'; MMB<='0'; MMA<='0';
        wait until clock'event and clock='0';
        -- R2 <- FFC4h
        AA<="0001" ; BA<="0000"; DA<="0010"; WR<='1'; MA<='1'; MB<='1'; KNS<=x"FFC4"; MW<='0'; FS<="0100"; MD<='0'; MMB<='0'; MMA<='0';
        wait until clock'event and clock='0';
        -- R3 <- R1 + R2
        AA<="0001" ; BA<="0010"; DA<="0011"; WR<='1'; MA<='0'; MB<='0'; KNS<=x"0000"; MW<='0'; FS<="0000"; MD<='0'; MMB<='0'; MMA<='0';
        wait until clock'event and clock='0';
        -- R4 <- R1 - R2
        AA<="0001" ; BA<="0010"; DA<="0100"; WR<='1'; MA<='0'; MB<='0'; KNS<=x"0000"; MW<='0'; FS<="0011"; MD<='0'; MMB<='0'; MMA<='0';



--        --semana 2 (memorias)
--        -- R1 <- 38h
--        AA<="0000" ; BA<="0000"; DA<="0001"; WR<='1'; MA<='1'; MB<='1'; KNS<=x"0038"; MW<='0'; FS<="0100"; MD<='0'; MMB<='0'; MMA<='0';
--        wait until clock'event and clock='0';
--        -- R2 <- 62h
--        AA<="0001" ; BA<="0000"; DA<="0010"; WR<='1'; MA<='1'; MB<='1'; KNS<=x"0062"; MW<='0'; FS<="0100"; MD<='0'; MMB<='0'; MMA<='0';
--        wait until clock'event and clock='0';
--        -- M[4Ch + R1] <- R2
--        AA<="0010" ; BA<="0001"; DA<="0000"; WR<='0'; MA<='1'; MB<='0'; KNS<=x"004C"; MW<='1'; FS<="0000"; MD<='1'; MMB<='1'; MMA<='0';
--        wait until clock'event and clock='0';
--        -- R1 <- R1 + 1
--        AA<="0001" ; BA<="0000"; DA<="0001"; WR<='1'; MA<='0'; MB<='1'; KNS<=x"0001"; MW<='0'; FS<="0000"; MD<='0'; MMB<='0'; MMA<='0';
--        wait until clock'event and clock='0';
--        -- R3 <- M[4Bh + R1]
--        AA<="0001" ; BA<="0000"; DA<="0011"; WR<='1'; MA<='0'; MB<='1'; KNS<=x"004B"; MW<='0'; FS<="0000"; MD<='1'; MMB<='1'; MMA<='0';
        
--        --semana 1
--        -- R1 <- 3
--        AA<="0000" ; BA<="0000"; DA<="0001"; WR<='1'; MA<='1'; MB<='1'; KNS<="0000000000000011"; MW<='0'; FS<="0100"; MD<='0';
--        wait until clock'event and clock='0';
--        -- R2 <- 15
--        AA<="0000" ; BA<="0000"; DA<="0010"; WR<='1'; MA<='1'; MB<='1'; KNS<="0001101111100000"; MW<='0'; FS<="0100"; MD<='0';
--        wait until clock'event and clock='0';
--        -- R3 <- 31
--        AA<="0000" ; BA<="0000"; DA<="0011"; WR<='1'; MA<='1'; MB<='1'; KNS<="0001101101000100"; MW<='0'; FS<="0100"; MD<='0';
--        wait until clock'event and clock='0';
--        -- R4 <- ROR(R3)
--        AA<="0000" ; BA<="0011"; DA<="0100"; WR<='1'; MA<='0'; MB<='0'; KNS<="0000000000000000"; MW<='0'; FS<="1111"; MD<='0';
--        wait until clock'event and clock='0';
--        -- R4 <- R4 + 10
--        AA<="0100" ; BA<="0000"; DA<="0100"; WR<='1'; MA<='0'; MB<='1'; KNS<="0000000000001010"; MW<='0'; FS<="0000"; MD<='0';
--        wait until clock'event and clock='0';
--        -- R4 <- R4 XOR R1
--        AA<="0100" ; BA<="0001"; DA<="0100"; WR<='1'; MA<='0'; MB<='0'; KNS<="0000000000000000"; MW<='0'; FS<="1000"; MD<='0';
--        wait until clock'event and clock='0';
--        -- R3 <- R1 + 7
--        AA<="0001" ; BA<="0000"; DA<="0011"; WR<='1'; MA<='0'; MB<='1'; KNS<="0000000000000111"; MW<='0'; FS<="0000"; MD<='0';
                                                
    end process;
    
    DP0: DataPath port map (
        AA=>AA, BA=>BA, DA=>DA, WR=>WR, MA=>MA, MB=>MB, KNS=>KNS, MW=>MW, FS=>FS, MD=>MD, D=>D, FL=>FL, CLK=>clock, MMA=>MMA, MMB=>MMB
        );
    
end Behavioral;
