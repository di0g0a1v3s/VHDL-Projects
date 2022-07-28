----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2016 07:19:18 PM
-- Design Name: 
-- Module Name: ff_elem - Behavioral
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

entity ff_elem is
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
end ff_elem;

architecture Behavioral of ff_elem is
    -- declaracao do componente m21
    component m21
        Port ( s : in STD_LOGIC;
               d0 : in STD_LOGIC;
               d1 : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;
    -- declaracao do componente ffd
    component ff_d
        Port ( din : in STD_LOGIC;
               clk : in STD_LOGIC;
               set : in STD_LOGIC;
               reset : in STD_LOGIC;
               dout : out STD_LOGIC);
    end component;
    -- declaracao dos sinais internos
    signal m21_out : STD_LOGIC;
    signal ffd_in, ffd_out, ffd_res, ffd_set : STD_LOGIC;  
    signal ffd_res_inter, ffd_set_inter : STD_LOGIC;

begin
    -- instancia do componente m21
    m21_inst : m21 port map (
            s => sel,
            d0 => val0,
            d1 => val1,
            y => m21_out );
            
    -- sinal para ligar a saida do m21 a entrada din do ff_d
    ffd_in <= m21_out; 
    -- reset do ff_d (criation)
    ffd_res_inter <= init_sig and (not init_val);
    ffd_res <= reset or ffd_res_inter;
    -- init do ff_d (criation)
    ffd_set_inter <= init_sig and init_val;
    ffd_set <= (not reset) and ffd_set_inter;
    
    -- instancia do componente ff_d
    ff_d_inst: ff_d port map (
            din => ffd_in,
            clk => clk,
            set => ffd_set,
            reset => ffd_res,
            dout => ffd_out );
    
    -- saidas do ff_elem
    m <= ffd_out;
    mx <= ffd_out xor seed;
            
end Behavioral;
