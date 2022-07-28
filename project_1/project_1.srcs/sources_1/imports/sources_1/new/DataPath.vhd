library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DataPath is
    Port (
       AA : in std_logic_vector (3 downto 0);
       BA : in std_logic_vector (3 downto 0);
       DA : in std_logic_vector (3 downto 0);
       WR : in std_logic;
       MA : in std_logic;
       MB : in std_logic;
       KNS : in std_logic_vector (15 downto 0);
       CLK : in std_logic;
       MW : in std_logic;
       FS : in std_logic_vector (3 downto 0);
       MD : in std_logic;
       D : out std_logic_vector (15 downto 0);
       FL : out std_logic_vector (3 downto 0);
       --adição de entradas da memoria
       MMA : in std_logic;
       MMB : in std_logic);
end DataPath;

architecture structural of DataPath is
component RegisterFile is
    Port ( CLK : in std_logic;
           Data : in std_logic_vector (15 downto 0);
           WR : in std_logic;
           DA : in std_logic_vector (3 downto 0);
           AA : in std_logic_vector (3 downto 0);
           BA : in std_logic_vector (3 downto 0);
           A : out std_logic_vector (15 downto 0);
           B : out std_logic_vector (15 downto 0));
end component;

component FunctionalUnit is
    Port ( A : in std_logic_vector (15 downto 0);
           B : in std_logic_vector (15 downto 0);
           FS : in std_logic_vector (3 downto 0);
           D : out std_logic_vector (15 downto 0);
           FL : out std_logic_vector (3 downto 0));
end component;

component DataMemory is
    Port ( Address : in std_logic_vector (15 downto 0);
           Data : in std_logic_vector (15 downto 0);
           WR : in std_logic;
           CLK : in std_logic;
           DataOut : out std_logic_vector (15 downto 0));
end component;

signal A, B, AK, BK, DM, DF, DI: std_logic_vector (15 downto 0);
--adição de sinais internos para as entradas de memória
signal DataK, AddressK: std_logic_vector (15 downto 0);

begin
    RF1 : RegisterFile port map (CLK => CLK, DATA=> DI, WR=>WR, DA=>DA, AA=>AA, BA=>BA, A=>A, B=>B);
    AK <= A when MA='0' else
          KNS when MA='1' else (others => 'X');
    BK <= B when MB='0' else
          KNS when MB='1' else (others => 'X');
    FU1 : FunctionalUnit port map (A=>AK, B=>BK, FS=>FS, D=>DF, FL=>FL);
    --alteração ligações à memoria
    DM1 : DataMemory port map (Address=>AddressK, Data=>DataK, WR=>MW, CLK=>CLK, DataOut=>DM);
     
    DI <= DF when MD='0' else
          DM when MD='1' else (others => 'X');
    D <= DI;
    --multiplexers que ligam às entradas de memória
    AddressK <= BK when MMB='0' else
                DF when MMB='1' else (others => 'X');
    DataK <= A when MMA='0' else
             KNS when MMA='1' else (others => 'X');
             
end structural;