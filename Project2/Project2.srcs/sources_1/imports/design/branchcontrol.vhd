library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity branchcontrol is
    Port ( PL : in STD_LOGIC;
           BC : in STD_LOGIC_VECTOR(3 downto 0);
           PC : in STD_LOGIC_VECTOR (31 downto 0);
           AD : in STD_LOGIC_VECTOR (31 downto 0);
           Flags : in STD_LOGIC_VECTOR(3 downto 0);
           PCLoad : out STD_LOGIC;
           PCValue : out STD_LOGIC_VECTOR (31 downto 0));
end branchcontrol;

architecture Behavioral of branchcontrol is

signal Z,N,P,C,V: std_logic;
--adi��o do sinal BC_out
signal BCout: std_logic;

begin

Z <= Flags(3);        -- zero flag
N <= Flags(2);        -- negative flag
P <= not N and not Z; -- positive flag
C <= FLags(1);        -- carry flag
V <= Flags(0);        -- overflow flag

-- Definir a l�gica relativa ao calculo do sinal PCLoad, o qual dever� ter o n�vel l�gico '1' sempre que
-- ocorrer uma instru��o de salto (branch), mas apenas nos casos em que a condi��o de salto � verdadeira.
-- Em todos os outros casos (i.e., a instru��o n�o � de branch, ou a condi��o de salto � falsa) o valor 
-- dever� ser zero.

--adi��o de um multiplexer para escolher a flag de interesse consoante o BC
with BC(2 downto 0) select
    BCout <= '1' when "000",
            '1' when "001",
            Z when "010",
            not(Z) when "011",
            P when "100",
            not(N) when "101",
            N when "110",
            not(P) when "111",
            '-' when others;
--l�gica para PCLoad (� 1 quando existe salto e 0 quando n�o exite)
PCLoad <= PL and not(BC(3)) and BCout;

-- Calculo do novo valor de PC (caso a condicao de salto seja verdadeira)
PCValue<=PC+AD;

end Behavioral;
