----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/27/2016 10:28:21 AM
-- Design Name: 
-- Module Name: tb_descodificador - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_descodificador is
--  Port ( );
end tb_descodificador;

architecture Behavioral of tb_descodificador is
    -- decalaracao do componente para testar
    component descodificador
        Port ( mess_codif : in STD_LOGIC_VECTOR (7 downto 0);
               mess_descod : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    -- declaration of internal simulation signals 
    -- (without any problem, they can have the same name as entradas/saidas of the component to test)         
    signal mess_codif : STD_LOGIC_VECTOR (7 downto 0) := (7 downto 0 => '0');
    signal mess_descod : STD_LOGIC_VECTOR (7 downto 0);

begin
    -- instancia do componente (unidade de teste) 
    test_unit : descodificador port map (
            mess_codif => mess_codif,
            mess_descod => mess_descod
        );
        
    -- process to test the circuit 
    -- it just increments message value every 25 ns
    -- to be able to use this '+', it is necessary to add "use IEEE.STD_LOGIC_UNSIGNED.ALL;" in line 24 of this test
    -- if this library is not included, it will show the error and the simulation will not run
    process begin
        wait for 25 ns;
        mess_codif <= mess_codif + 1;
    end process;


end Behavioral;
