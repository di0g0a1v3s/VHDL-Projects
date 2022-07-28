----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2016 08:33:32 PM
-- Design Name: 
-- Module Name: mess_gen - Behavioral
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

entity mess_gen is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           init : in STD_LOGIC;
           message : out STD_LOGIC_VECTOR (7 downto 0));
end mess_gen;

architecture Behavioral of mess_gen is
    -- declaracao do componente ff_elem
    component ff_elem 
        Port ( init_val : in STD_LOGIC;
               init_sig : in STD_LOGIC;
               sel : in STD_LOGIC;
               val0 : in STD_LOGIC;
               val1 : in STD_LOGIC;
               seed : in STD_LOGIC;
               reset : in STD_LOGIC;
               clk : in STD_LOGIC;
               m : out STD_LOGIC;
               mx : out STD_LOGIC);
    end component;
    -- declaracao dos sinais internos
    signal seed : STD_LOGIC_VECTOR (5 downto 0) := "010110";
    signal m_ff, mx_ff : STD_LOGIC_VECTOR (5 downto 0);
    signal selection : STD_LOGIC;
    
    -- change here
    signal init_val : STD_LOGIC_VECTOR (5 downto 0) := "100111";
    
begin
    -- selection signal shared among all ff_elem instances
    selection <= m_ff(0);
    
    -- instancia do componente ff_elem
    ff_elem0 : ff_elem port map (
        clk => clk, reset => reset, 
        init_sig => init, init_val => init_val(0),
        sel => selection, val0 => m_ff(5), val1 => mx_ff(5),
        seed => seed(0), m => m_ff(0), mx => mx_ff(0));
    -- instancia do componente ff_elem
    ff_elem1 : ff_elem port map (
        clk => clk, reset => reset, 
        init_sig => init, init_val => init_val(1),
        sel => selection, val0 => m_ff(0), val1 => mx_ff(0),
        seed => seed(1), m => m_ff(1), mx => mx_ff(1));
    -- instancia do componente ff_elem
    ff_elem2 : ff_elem port map (
        clk => clk, reset => reset, 
        init_sig => init, init_val => init_val(2),
        sel => selection, val0 => m_ff(1), val1 => mx_ff(1),
        seed => seed(2), m => m_ff(2), mx => mx_ff(2));
    -- instancia do componente ff_elem                
    ff_elem3 : ff_elem port map (
        clk => clk, reset => reset, 
        init_sig => init, init_val => init_val(3),
        sel => selection, val0 => m_ff(2), val1 => mx_ff(2),
        seed => seed(3), m => m_ff(3), mx => mx_ff(3));
    -- instancia do componente ff_elem                                    
    ff_elem4 : ff_elem port map (
        clk => clk, reset => reset, 
        init_sig => init, init_val => init_val(4),
        sel => selection, val0 => m_ff(3), val1 => mx_ff(3),
        seed => seed(4), m => m_ff(4), mx => mx_ff(4));
    -- instancia do componente ff_elem                               
    ff_elem5 : ff_elem port map (
        clk => clk, reset => reset, 
        init_sig => init, init_val => init_val(5),
        sel => selection, val0 => m_ff(4), val1 => mx_ff(4),
        seed => seed(5), m => m_ff(5), mx => mx_ff(5));
        
    -- saida (mensagem original)
    message <= "00" & m_ff;

end Behavioral;
