----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/16/2015 10:44:41 PM
-- Design Name: 
-- Module Name: sd - Behavioral
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

entity sd is
Port( 
    SW 			: in  STD_LOGIC_VECTOR (15 downto 0);
    BTN         : in  STD_LOGIC_VECTOR (4 downto 0);
    CLK         : in  STD_LOGIC;
    LED         : out  STD_LOGIC_VECTOR (15 downto 0);
    SSEG_CA     : out  STD_LOGIC_VECTOR (7 downto 0);
    SSEG_AN     : out  STD_LOGIC_VECTOR (3 downto 0)
);
end sd;

architecture Behavioral of sd is
    
    ----------------------------------------------------------
    ------      INTERNAL COMPONENTS (DON'T TOUCH)      -------
    ----------------------------------------------------------
    component clkdiv
      Port (
        clk : in std_logic;
        clk_fast, clk_slow, clk_disp : out std_logic
      );
    end component;
    -- component declaration with interface for 7-segment display
    component disp7
      Port (
        disp4_3, disp4_2, disp4_1, disp4_0, aceso4 : in std_logic;
        disp3_3, disp3_2, disp3_1, disp3_0, aceso3 : in std_logic;
        disp2_3, disp2_2, disp2_1, disp2_0, aceso2 : in std_logic;
        disp1_3, disp1_2, disp1_1, disp1_0, aceso1 : in std_logic;
        clk : in std_logic;
        en1, en2, en3, en4 : out std_logic;
        segm1, segm2, segm3, segm4, segm5, segm6, segm7, dp : out std_logic
      );
    end component;
    -- display 7 signals 
    signal disp0, disp1, disp2, disp3, aceso : std_logic_vector(3 downto 0);
    -- clock signals
    signal clk_fast, clk_slow, clk_disp : std_logic;
    
    ----------------------------------------
    ----------------------------------------
    ------      LAB4 PROJECT STUFF   -------
    ----------------------------------------
    ----------------------------------------
    component float_add
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               start : in STD_LOGIC;
               A : in STD_LOGIC_VECTOR (7 downto 0);
               B : in STD_LOGIC_VECTOR (7 downto 0);
               OutA : out STD_LOGIC_VECTOR (7 downto 0);
			   OutB : out STD_LOGIC_VECTOR (7 downto 0);
			   I : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    -- ouptuts 
    signal A_out, B_out, mux_out : STD_LOGIC_VECTOR (7 downto 0);  
	signal I_out        : STD_LOGIC_VECTOR (3 downto 0);  
	
begin
    ----------------------------------------------------------
    ------      7-Seg Display Instance (DON'T TOUCH)   -------
    ----------------------------------------------------------
    udisp: disp7 port map (
        clk => clk_disp,
        en1 => SSEG_AN(0), en2 => SSEG_AN(1), en3 => SSEG_AN(2), en4=> SSEG_AN(3),
        segm1 => SSEG_CA(0), segm2 => SSEG_CA(1), segm3 => SSEG_CA(2), segm4 => SSEG_CA(3), segm5 => SSEG_CA(4), segm6 => SSEG_CA(5), segm7 => SSEG_CA(6), dp => SSEG_CA(7),
        -- the signals that must be defined are: 
        --    * disp3, disp2, disp1, disp0 : std_logic_vector (3 downto 0);
        --    * aceso(3), aceso(2), aceso(1), aceso(0) => enable that allows to activate the respective 7-segment display.
        disp4_3 => disp3(3), disp4_2 => disp3(2), disp4_1 => disp3(1), disp4_0 => disp3(0),
        disp3_3 => disp2(3), disp3_2 => disp2(2), disp3_1 => disp2(1), disp3_0 => disp2(0),
        disp2_3 => disp1(3), disp2_2 => disp1(2), disp2_1 => disp1(1), disp2_0 => disp1(0),
        disp1_3 => disp0(3), disp1_2 => disp0(2), disp1_1 => disp0(1), disp1_0 => disp0(0),
        aceso4 => aceso(3) , aceso3 => aceso(2) , aceso2 => aceso(1) , aceso1 => aceso(0)
     );
    ----------------------------------------------------------
    ------      Clock Divisor Instance (DON'T TOUCH)   -------
    ----------------------------------------------------------
    -- component instantiation to generate the following clock signals
    uclk_gen: clkdiv port map (
        clk => CLK,
        -- clock outputs that can be used
        clk_fast => clk_fast, -- 100 MHz
        clk_slow => clk_slow, -- 1.5Hz
        clk_disp => clk_disp  -- 1490 Hz
    );

    ----------------------------------------------------------
    ----------------------------------------------------------
    ------          Lab4 circuit port mapping          -------
    ----------------------------------------------------------
    ----------------------------------------------------------
    -- Lab3 circuit port mapping
    inst_float_add: float_add port map ( 
        clk => clk_slow, reset => BTN(0), start => BTN(3),
		A => SW(15 downto 8), B => SW(7 downto 0),
        OutA => A_out, OutB => B_out, I => I_out 
    );
    
    ----------------------------------------------------------
    ------                LED Control                  -------
    ----------------------------------------------------------
    LED <= (15 downto 0 => '0');
			 			 
    ----------------------------------------------------------
    ------           7-Seg Display Control             -------
    ----------------------------------------------------------   
    mux_out <= A_out when BTN(1)='0' else B_out;
	-- Display 7 enable for each digit
    aceso <= "1111";	  			  
    -- values on display
    disp3 <= I_out;
    disp2 <= (3 downto 0 => mux_out(7));
    disp1 <= mux_out(6 downto 3);
    disp0 <= "0" & mux_out(2 downto 0);

end Behavioral;
