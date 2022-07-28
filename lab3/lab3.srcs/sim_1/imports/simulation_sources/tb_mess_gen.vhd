----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2016 10:06:53 PM
-- Design Name: 
-- Module Name: tb_mess_gen - Behavioral
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


-- Definicao do nome da entidade, sem qualquer entrada ou saida (e quase SEMPRE assim)
entity tb_mess_gen is
--  Port ( );
end tb_mess_gen;

architecture Behavioral of tb_mess_gen is
    -- decalaracao do componente para testar
    component mess_gen 
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               init : in STD_LOGIC;
               message : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    -- declaration of internal simulation signals 
    -- (without any problem, they can have the same name as entradas/saidas of the component to test) 
    signal clk, reset, init : STD_LOGIC := '0';
    signal message : STD_LOGIC_VECTOR (7 downto 0);
    
begin
    -- instancia do mess_gen (unidade de teste) 
    test_unit : mess_gen port map (
        clk => clk, reset => reset, init => init,
        message => message);
        
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
        -- hold reset for the first 2 clock cycles 2x(2*25)
        reset <= '1';
        wait for 4*25 ns;
        -- hold init for the second set of 2 clock cycles 2x(2*25)
        reset <= '0';
        init <= '1';
        wait for 4*25 ns;
        -- starts generating random messages (since both init and reset are on '0')
        init <= '0';
        wait; -- forever 
    end process;

end Behavioral;
