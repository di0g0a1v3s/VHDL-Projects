----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.11.2016 23:14:44
-- Design Name: 
-- Module Name: ctr_control - Behavioral
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

entity ctr_control is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;
           instr : in STD_LOGIC_VECTOR (3 downto 0);
		   
           hold  : out STD_LOGIC;
           load_args : out STD_LOGIC);
end ctr_control;

architecture Behavioral of ctr_control is
    component ff_de 
    Port ( 
       din : in STD_LOGIC;
       clk : in STD_LOGIC;
       ce  : in STD_LOGIC;
       reset : in STD_LOGIC;
       dout : out STD_LOGIC);
    end component;

    signal ct0, hold_intern, start_r, start_r_next : STD_LOGIC;
begin

	--  flag que indica que o contador está no estado "0000"
    ct0 <= (not (instr(3) or instr(2) or instr(1) or instr(0)));
    

    --  FFD que sincroniza a entrada start para evitar problemas de deboucing.
    START_SYNC_FF: ff_de port map (
        clk => clk, reset => reset, ce => '1',
        din => start_r_next, dout => start_r
    );
	-- se o contador estiver em parado em 0000 (hold_intern=1)
	-- entao a entrada externa start pode registada  
    start_r_next <= start when hold_intern = '1' else '0';
  
  
    --  sinal que pára o contador no valor 0000 até a saída do 
	--  START_SYNC_FF estar a '1'
    hold_intern <= ct0 and (not start_r);
 
 
    --  atribuição de sinais internos às saidas   
    hold      <= hold_intern;
    load_args <= start_r;

end Behavioral;
