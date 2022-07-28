----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/27/2016 10:51:51 AM
-- Design Name: 
-- Module Name: tb_enigma - Behavioral
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

entity tb_enigma is
--  Port ( );
end tb_enigma;

architecture Behavioral of tb_enigma is
    -- decalaracao do componente para testar
    component enigma
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               start : in STD_LOGIC;
               mess_orig : out STD_LOGIC_VECTOR (7 downto 0);
               mess_codif : out STD_LOGIC_VECTOR (7 downto 0);
               mess_descod : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    -- declaration of internal simulation signals 
    -- (without any problem, they can have the same name as entradas/saidas of the component to test)         
    signal clk, reset, start : STD_LOGIC := '0';
    signal mess_orig, mess_codif, mess_descod : STD_LOGIC_VECTOR (7 downto 0);

begin
    -- instancia do componente (unidade de teste) 
    test_enigma : enigma port map (
        clk => clk, reset => reset, start => start,
        mess_orig => mess_orig, mess_codif => mess_codif, mess_descod => mess_descod
    );

    -- process that will non-stop generate the clock signal
    -- '0' for 25ns, followed by '1' for another 25 ns (and so on...)
    process begin
        clk <= '0';
        wait for 25 ns;
        clk <= '1';
        wait for 25 ns;
    end process;
    
    -- process to test the circuit 
    process begin
        -- hold reset for 2 clock cycles 2x(2*25ns)
        reset <= '1';
        start <= '1';
        wait for 4*25 ns;
        -- out start=0 in order to initialize mess_gen [for 2 clock cycles 2x(2*25ns)]
        reset <= '0';
        start <= '0';
        wait for 4*25 ns;
        -- reset=0 and start=1
        -- enigma starts generating random messages (every clock cycle) and perform coding and decoding
        start <= '1';
        wait; 
    end process;

end Behavioral;
