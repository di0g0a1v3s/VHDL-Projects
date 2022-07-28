
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY tb_full_adder IS
END tb_full_adder;
 
ARCHITECTURE behavior OF tb_full_adder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT full_adder
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         cin : IN  std_logic;
         cout : OUT  std_logic;
         s : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal cin : std_logic := '0';

 	--Outputs
   signal co : std_logic;
   signal s : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: full_adder PORT MAP (
          a => a,
          b => b,
          cin => cin,
          cout => co,
          s => s
        );

   -- Stimulus process
   a_proc: process
   begin		
      a <= '0';
      wait for 4*100 ns;	
      a <= '1';
      wait for 4*100 ns;	
   end process;
	
	b_proc: process
   begin		
      b <= '0';
      wait for 2*100 ns;	
      b <= '1';
      wait for 2*100 ns;	
   end process;
	
	cin_proc: process
   begin		
      cin <= '0';
      wait for 100 ns;	
      cin <= '1';
      wait for 100 ns;	
   end process;

END;
