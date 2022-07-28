library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
ENTITY tb_somador5 IS
--  Port ( );
END tb_somador5;
 
ARCHITECTURE behavior OF tb_somador5 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT somador5
    Port ( A : in STD_LOGIC_VECTOR (4 downto 0);
           B : in STD_LOGIC_VECTOR (4 downto 0);
           ci : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (4 downto 0);
           co : out STD_LOGIC;
           V : out STD_LOGIC);
    END COMPONENT;
    
   --Inputs
   signal P : std_logic_vector(4 downto 0) := (others => '0');
   signal Q : std_logic_vector(4 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(4 downto 0);
   signal Cout : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: somador5 PORT MAP (
          A => P,
          B => Q,
          ci => Cin,
          S => S,
          co => Cout
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      P <= "00001";
		Q <= "00011";
		Cin <= '0';
      wait for 100ns;
		Cin <= '1';
		wait for 100ns;
		P <= "00001";
		Q <= "11111";
		Cin <= '0';
      wait for 100ns;
		Cin <= '1';
      wait;
   end process;

END;
