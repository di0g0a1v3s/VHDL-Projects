----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/26/2016 11:01:40 PM
-- Design Name: 
-- Module Name: somador4 - Behavioral
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

entity somador5 is
    Port ( A : in STD_LOGIC_VECTOR (4 downto 0);
           B : in STD_LOGIC_VECTOR (4 downto 0);
           ci : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (4 downto 0);
           co : out STD_LOGIC;
           V : out STD_LOGIC);
end somador5;

architecture Behavioral of somador5 is
    -- declaracao do componente full_adder
    component full_adder
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               cin : in STD_LOGIC;
               s : out STD_LOGIC;
               cout : out STD_LOGIC);
    end component;
    --declaracao dos sinais internos
    signal C : STD_LOGIC_VECTOR (5 downto 0);

begin
    -- atribuicao do valor de C(0)
    C(0) <= ci;
    -- instanciacao automatica de 5 componentes
    uGen: for i in 0 to 4 generate
        UFA: full_adder port map (
            a => A(i), b => B(i), cin => C(i),
            s => S(i), cout => C(i+1)
        );
    end generate;
    
    -- sinais adicionais de saida
    co <= C(5);
    V <= C(4) xor C(3);

end Behavioral;
