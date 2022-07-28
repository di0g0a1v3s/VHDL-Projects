----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/27/2016 10:39:45 AM
-- Design Name: 
-- Module Name: enigma - Behavioral
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

entity enigma is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;
           mess_orig : out STD_LOGIC_VECTOR (7 downto 0);
           mess_codif : out STD_LOGIC_VECTOR (7 downto 0);
           mess_descod : out STD_LOGIC_VECTOR (7 downto 0));
end enigma;

architecture Behavioral of enigma is
    -- decalaracao do componente mess_gen
    component mess_gen
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               init : in STD_LOGIC;
               message : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    -- decalaracao do componente codificador
    component codificador
        Port ( message : in STD_LOGIC_VECTOR (7 downto 0);
               mess_codif : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    -- decalaracao do componente descodificador
    component descodificador
        Port ( mess_codif : in STD_LOGIC_VECTOR (7 downto 0);
               mess_descod : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    -- decalaracao dos sinais internos
    signal mess_gen_out, codificador_out, descodificador_out : STD_LOGIC_VECTOR (7 downto 0);
    signal init : STD_LOGIC;
  
begin
    -- start=0 => init=1 (initialize message generatior, i.e., inseet INIT_VAL)
    -- start=1 => init=0 (generate random messages)
    init <= not start;
    
    -- instancia do componente mess_gen
    inst_mess_gen : mess_gen port map (
            clk => clk, reset => reset, init => init,
            message => mess_gen_out
        );

    -- instancia do componente codificador
    inst_codificador : codificador port map (
            message => mess_gen_out,
            mess_codif => codificador_out
        );

    -- instancia do componente descodificador
    inst_descodificador : descodificador port map (
            mess_codif => codificador_out,
            mess_descod => descodificador_out
        );
        
    -- saidas do enigma
    mess_orig <= mess_gen_out;
    mess_codif <= codificador_out;
    mess_descod <= descodificador_out;

end Behavioral;
