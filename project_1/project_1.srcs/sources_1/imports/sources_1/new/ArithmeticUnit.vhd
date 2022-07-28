library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ArithmeticUnit is
    Port ( A : in std_logic_vector (15 downto 0);
           B : in std_logic_vector (15 downto 0);
           FS : in std_logic_vector (1 downto 0);
           D : out std_logic_vector (15 downto 0);
           CO : out std_logic;
           OV : out std_logic);
end ArithmeticUnit;

architecture structural of ArithmeticUnit is
component ArithmeticUnitI is
    Port ( Ai : in std_logic;
       Bi : in std_logic;
       FS : in std_logic_vector(1 downto 0);
       CI : in std_logic;
       Di : out std_logic;
       CO : out std_logic);
end component;

--adiçao do componente detect_low
component Detect_low is
	port(A: in std_logic_vector(15 downto 0);
		 B: in std_logic_vector(15 downto 0);
		 small_number: out std_logic);
end component;


signal Yn : std_logic;
signal Z : std_logic_vector (15 downto 0);
signal C : std_logic_vector (16 downto 0);
--adiçao de sinais internos à arithmetic unit
signal small_number : std_logic;
signal A_inter, B_inter, D_inter: std_logic_vector(15 downto 0);

begin
    
    --logica que transforma os bits de maior peso em 0 caso small_number = 1
    A_inter <= ( A(15 downto 8) and (7 downto 0 => not(small_number))) & A(7 downto 0); 
    B_inter <= ( B(15 downto 8) and (7 downto 0 => not(small_number))) & B(7 downto 0);   
    
    
    C(0) <= FS(0);
    
    --alteração das entradas dos somadores
    aritGen: for I in 15 downto 0 generate
        AUi: ArithmeticUnitI port map (Ai=>A_inter(I), Bi=>B_inter(I), FS=>FS, CI=>C(I), Di=>D_inter(I), CO=>C(I+1));
    end generate aritGen;
    
    --mapeamento das entradas e saídas do componente detect_low
    D_Low: Detect_low port map( A=>A, B=>B, small_number=>small_number);
    
    --sign extend
    with small_number select
    Z <= D_inter when '0',
         (7 downto 0 => D_inter(7)) & D_inter(7 downto 0) when '1',
         (others => 'X') when others;
    
    D <= Z;
    
    
     --carry
     CO <= C(16);
           
   
    -- overflow
    Yn <= (B(15) and not FS(1)) or (not B(15) and FS(1));
    OV <= (A(15) and Yn and not Z(15)) or (not A(15) and not Yn and Z(15));
    
    
    
end structural;