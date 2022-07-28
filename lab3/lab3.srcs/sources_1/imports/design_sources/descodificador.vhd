----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/27/2016 10:19:57 AM
-- Design Name: 
-- Module Name: decodificador - Behavioral
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

entity descodificador is
    Port ( mess_codif : in STD_LOGIC_VECTOR (7 downto 0);
           mess_descod : out STD_LOGIC_VECTOR (7 downto 0));
end descodificador;

architecture Behavioral of descodificador is
    -- declaracao do componente somador
    component somador4 
            Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
                   B : in STD_LOGIC_VECTOR (3 downto 0);
                   ci : in STD_LOGIC;
                   S : out STD_LOGIC_VECTOR (3 downto 0);
                   co : out STD_LOGIC;
                   V : out STD_LOGIC);
        end component;
    -- declaracao de sinais internos 
    signal mesdec_inter, mesdec_som : STD_LOGIC_VECTOR (7 downto 0);
    signal som1_cout : STD_LOGIC;
    -- change here
    signal desc_key : STD_LOGIC_VECTOR (7 downto 0) := "10101110";

begin
    -- ROL 4 (para implementar)
    mesdec_inter <= mess_codif(3 downto 0) & mess_codif(7 downto 4);
    
    -- instancias dos somadores (para implementar)
    -- SOM1: instancia do somador 4
        SOM1: somador4 port map (
            A => mesdec_inter(3 downto 0), B => desc_key(3 downto 0), ci => '0',
            S => mesdec_som(3 downto 0), co => som1_cout, V => open 
        );
        
        -- SOM2: instancia do somador 4
        SOM2: somador4 port map (
            A => mesdec_inter(7 downto 4), B => desc_key(7 downto 4), ci => som1_cout,
            S => mesdec_som(7 downto 4), co => open, V => open 
        );
    --mesdec_som <= mesdec_inter;
    
    -- saida do descodificador 
    mess_descod <= mesdec_som;
    
end Behavioral;
