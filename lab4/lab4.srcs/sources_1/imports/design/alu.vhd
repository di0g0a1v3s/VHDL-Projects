----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2016 12:24:47
-- Design Name: 
-- Module Name: aritmethic_unit - Behavioral
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

entity alu is
        Port (
   op   : in STD_LOGIC_VECTOR (1 downto 0);
   A    : in STD_LOGIC_VECTOR (7 downto 0);
   B    : in STD_LOGIC_VECTOR (7 downto 0);
   S    : out STD_LOGIC_VECTOR (4 downto 0);
   Z    : out STD_LOGIC);
end alu;


-- ALU que implementa as operaçoes 
--   00 - S <=  mB + mA
--   01 - S <= -eB + eA 
--   10 - S <=  -1 + eB
--   11 - S <=   1 + eA

--  onde mA é A(7:3), a mantissa e eA é A (2:0), o expoente.
--  onde mB é B(7:3), a mantissa e eB é B (2:0), o expoente.

architecture Behavioral of alu is
    -- somador 5
    component somador5
        Port ( A : in STD_LOGIC_VECTOR (4 downto 0);
               B : in STD_LOGIC_VECTOR (4 downto 0);
               ci : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (4 downto 0);
               co : out STD_LOGIC;
               V : out STD_LOGIC);
    end component; 

    -- sinais
    signal a_op, b_op_i, b_op, S_i : STD_LOGIC_VECTOR (4 downto 0);
    signal ci : STD_LOGIC;
begin


-- definição dos operadores a partir da operaçao
-- mux 2:1 da entrada b do somador seleciona a mantissa de B quando op = 00, e o expoente se for diferente de 00
    b_op_i <= B(7 downto 3)  when op(1 downto 0) = "00" else ("00" & B(2 downto 0));
	
-- XOR deal wiht -eB and 1, OR puts -1 in a_op
    b_op <= (4 downto 0 => op(0)) xor ((4 downto 0 => op(1)) or  b_op_i);  
	
-- as operações impares são subtrações
    ci <= op(0);  
	  
-- mux 4:1 (ou dois mux 2:1) da entrada a do somador
--    seleciona:
--       a mantissa de A quando op = 00, 
--       o expoente de B quando op = 10,
--       o expoente de A nos outros casos
    a_op <= A(7 downto 3)  			when op(1 downto 0)="00" else 
		   ("00" & B(2 downto 0)) 	when op(1 downto 0)="10" else 
           ("00" & A(2 downto 0));


-- somador mais flag ZERO
    som5 : somador5 port map ( 
        A => a_op, B => b_op, ci => ci,
        S => S_i, co => open, V => open  
        );
        
    Z <= (not (S_i(4) or S_i(3) or S_i(2) or S_i(1) or S_i(0)));
    S <= S_i;
end Behavioral;
