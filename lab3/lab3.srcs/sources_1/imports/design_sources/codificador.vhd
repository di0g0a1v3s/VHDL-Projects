----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/26/2016 11:52:26 PM
-- Design Name: 
-- Module Name: codificador - Behavioral
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

entity codificador is
    Port ( message : in STD_LOGIC_VECTOR (7 downto 0);
           mess_codif : out STD_LOGIC_VECTOR (7 downto 0));
end codificador;

architecture Behavioral of codificador is
    -- declaracao do componente somador 4
    component somador4 
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               ci : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (3 downto 0);
               co : out STD_LOGIC;
               V : out STD_LOGIC);
    end component;
    -- declaracao dos sinais internos 
    signal mescod_inter : STD_LOGIC_VECTOR (7 downto 0);
    signal som1_cout : STD_LOGIC;
    -- change here
    signal cod_key : STD_LOGIC_VECTOR (7 downto 0) := "01010010";

begin

    -- SOM1: instancia do somador 4
    SOM1: somador4 port map (
        A => message(3 downto 0), B => cod_key(3 downto 0), ci => '0',
        S => mescod_inter(3 downto 0), co => som1_cout, V => open 
    );
    
    -- SOM2: instancia do somador 4
    SOM2: somador4 port map (
        A => message(7 downto 4), B => cod_key(7 downto 4), ci => som1_cout,
        S => mescod_inter(7 downto 4), co => open, V => open 
    );
    
    -- ROR 4
    mess_codif <= mescod_inter(3 downto 0) & mescod_inter(7 downto 4);

end Behavioral;
