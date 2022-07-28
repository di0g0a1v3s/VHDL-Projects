library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegisterFile is
    Port ( CLK : in std_logic;
           Data : in std_logic_vector (15 downto 0);
           WR : in std_logic;
           DA : in std_logic_vector (3 downto 0);
           AA : in std_logic_vector (3 downto 0);
           BA : in std_logic_vector (3 downto 0);
           A : out std_logic_vector (15 downto 0);
           B : out std_logic_vector (15 downto 0));
end RegisterFile;

architecture structural of RegisterFile is
component Register16 is
	port(	D: in std_logic_vector(15 downto 0);
			Load: in std_logic;
			CLK: in std_logic;
			Q: out std_logic_vector(15 downto 0):=(others => '0')
			);
end component;

component mux16to1_16 is
    Port ( S : in std_logic_vector (3 downto 0);
           I0 : in std_logic_vector (15 downto 0);
           I1 : in std_logic_vector (15 downto 0);
           I2 : in std_logic_vector (15 downto 0);
           I3 : in std_logic_vector (15 downto 0);
           I4 : in std_logic_vector (15 downto 0);
           I5 : in std_logic_vector (15 downto 0);
           I6 : in std_logic_vector (15 downto 0);
           I7 : in std_logic_vector (15 downto 0);
           I8 : in std_logic_vector (15 downto 0);
           I9 : in std_logic_vector (15 downto 0);
           I10 : in std_logic_vector (15 downto 0);
           I11 : in std_logic_vector (15 downto 0);
           I12 : in std_logic_vector (15 downto 0);
           I13 : in std_logic_vector (15 downto 0);
           I14 : in std_logic_vector (15 downto 0);
           I15 : in std_logic_vector (15 downto 0);
           O : out std_logic_vector (15 downto 0));
end component;

component Decoder is
    Port ( A : in std_logic_vector (3 downto 0);
           D0 : out std_logic;
           D1 : out std_logic;
           D2 : out std_logic;
           D3 : out std_logic;
           D4 : out std_logic;
           D5 : out std_logic;
           D6 : out std_logic;
           D7 : out std_logic;
           D8 : out std_logic;
           D9 : out std_logic;
           D10 : out std_logic;
           D11 : out std_logic;
           D12 : out std_logic;
           D13 : out std_logic;
           D14 : out std_logic;
           D15 : out std_logic);
end component;

signal D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15: std_logic;
signal L0, L1, L2, L3, L4, L5, L6, L7, L8, L9, L10, L11, L12, L13, L14, L15: std_logic;
signal Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15: std_logic_vector (15 downto 0);

begin
    Decoder1: Decoder port map (A => DA, D0=>D0, D1=>D1, D2=>D2, D3=>D3, D4=>D4, D5=>D5, D6=>D6, D7=>D7, D8=>D8, D9=>D9, D10=>D10, D11=>D11, D12=>D12, D13=>D13, D14=>D14, D15=>D15);
    L1 <= D1 and WR; L2 <= D2 and WR; L3 <= D3 and WR; L4 <= D4 and WR; L5 <= D5 and WR; L6 <= D6 and WR; L7 <= D7 and WR; L8 <= D8 and WR; L9 <= D9 and WR; L10 <= D10 and WR; L11 <= D11 and WR; L12 <= D12 and WR; L13 <= D13 and WR; L14 <= D14 and WR; L15 <= D15 and WR;
    Q0 <= (others => '0');
    R1: Register16 port map (D => Data, Load => L1, CLK => CLK, Q=> Q1);
    R2: Register16 port map (D => Data, Load => L2, CLK => CLK, Q=> Q2);
    R3: Register16 port map (D => Data, Load => L3, CLK => CLK, Q=> Q3);
    R4: Register16 port map (D => Data, Load => L4, CLK => CLK, Q=> Q4);
    R5: Register16 port map (D => Data, Load => L5, CLK => CLK, Q=> Q5);
    R6: Register16 port map (D => Data, Load => L6, CLK => CLK, Q=> Q6);
    R7: Register16 port map (D => Data, Load => L7, CLK => CLK, Q=> Q7);
    R8: Register16 port map (D => Data, Load => L8, CLK => CLK, Q=> Q8);
    R9: Register16 port map (D => Data, Load => L9, CLK => CLK, Q=> Q9);
    R10: Register16 port map (D => Data, Load => L10, CLK => CLK, Q=> Q10);
    R11: Register16 port map (D => Data, Load => L11, CLK => CLK, Q=> Q11);
    R12: Register16 port map (D => Data, Load => L12, CLK => CLK, Q=> Q12);
    R13: Register16 port map (D => Data, Load => L13, CLK => CLK, Q=> Q13);
    R14: Register16 port map (D => Data, Load => L14, CLK => CLK, Q=> Q14);
    R15: Register16 port map (D => Data, Load => L15, CLK => CLK, Q=> Q15);
    MA: mux16to1_16 port map (S => AA, I0 => Q0, I1 => Q1, I2 => Q2, I3 => Q3, I4 => Q4, I5 => Q5, I6 => Q6, I7 => Q7, I8 => Q8, I9 => Q9, I10 => Q10, I11 => Q11, I12 => Q12, I13 => Q13, I14 => Q14, I15 => Q15, O=>A);
    MB: mux16to1_16 port map (S => BA, I0 => Q0, I1 => Q1, I2 => Q2, I3 => Q3, I4 => Q4, I5 => Q5, I6 => Q6, I7 => Q7, I8 => Q8, I9 => Q9, I10 => Q10, I11 => Q11, I12 => Q12, I13 => Q13, I14 => Q14, I15 => Q15, O=>B);
end structural;
