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

entity tb_alu is
--  Port ( );
end tb_alu;

architecture Behavioral of tb_alu is
    component alu 
        Port (
            op   : in STD_LOGIC_VECTOR (1 downto 0);
            A    : in STD_LOGIC_VECTOR (7 downto 0);
            B    : in STD_LOGIC_VECTOR (7 downto 0);
            S    : out STD_LOGIC_VECTOR (4 downto 0);
            Z    : out STD_LOGIC);
end component;

-- sinais internos 
signal op : STD_LOGIC_VECTOR (1 downto 0) := "00";
signal a : STD_LOGIC_VECTOR (7 downto 0) := "01010110";
signal b : STD_LOGIC_VECTOR (7 downto 0) := "10101010";

signal s : STD_LOGIC_VECTOR (4 downto 0);
signal z : STD_LOGIC;

begin

     ALU1 : alu port map (
            op => op,
            A => a, B => b,
            S => s, Z => z
            );

    -- process to test the circuit 
    -- it just increments OP value every 25 ns
    -- to be able to use this '+', it is necessary to add "use IEEE.STD_LOGIC_UNSIGNED.ALL;" in line 24 of this test
    -- if this library is not included, it will show the error and the simulation will not run
    process begin
        wait for 25 ns;
        op <= op + 1;
    end process;


end Behavioral;
