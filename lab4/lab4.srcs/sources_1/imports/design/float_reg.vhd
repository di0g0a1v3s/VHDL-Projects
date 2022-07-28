

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity float_reg is
    Port ( clk           : in STD_LOGIC;
           reset         : in STD_LOGIC;
           op            : in STD_LOGIC_VECTOR  (2 downto 0);
           arithmetic_in : in STD_LOGIC_VECTOR  (4 downto 0);
           num_in        : in STD_LOGIC_VECTOR  (7 downto 0);
           num           : out STD_LOGIC_VECTOR (7 downto 0));
end float_reg;

-- Registo que guarda um número de virgula flutuante e suporta operaçoes 
-- de shift aritmentico sobre a mantissa.
-- op controla as operaçoes do registo
--   000 - hold
--   001 - carrega a mantissa da entrada arithmetic_in(4:0) 
--   100 - carrega o expoente da entrada arithmetic_in(2:0) 
--   101 - carrega o expoente e a mantissa da entrada num_in(7:0)
--   111 - carrega o expoente da entrada arithmetic_in(2:0) e faz SRA da mantissa

--  quando o load é feito a partir da entrada num_in(7:0) os 5 bits mais significativos
--  são a mantissa e os 3 bits menos significativos são o expoente.

architecture Behavioral of float_reg is

--componentes
    component ff_de 
        Port ( din : in STD_LOGIC;
           clk : in STD_LOGIC;
           ce  : in STD_LOGIC;
           reset : in STD_LOGIC;
           dout : out STD_LOGIC);
    end component;
	
--sinais internos
     signal sel_load_num   : STD_LOGIC;
     signal exp_next   : STD_LOGIC_VECTOR (2 downto 0);
     signal exp_intern : STD_LOGIC_VECTOR (2 downto 0);
	

     signal mant_sel_ld : STD_LOGIC;
     signal mant_ld_next: STD_LOGIC_VECTOR (4 downto 0);
     signal mant_SRA 	: STD_LOGIC_VECTOR (4 downto 0);
     
     signal mant_next  	: STD_LOGIC_VECTOR (4 downto 0);
     signal mant_intern : STD_LOGIC_VECTOR (4 downto 0);
begin

	-- sinal que indica que devem ser carregados os valores presentes na 
	-- entrada num_in quando está a '1' (op == "101") e da entrada arithmetic_in
	-- quando está a '0'
	sel_load_num <= op(2) and (not op(1)) and op(0);

	
    -- expoente
    --  mux 2:1 da entrada
    exp_next <= num_in(2 downto 0) when sel_load_num = '1' else arithmetic_in(2 downto 0);
	
	--  instanciação de 3 FF_DE para o expoente
    uGenExp: for i in 0 to 2 generate
        FFD: ff_de port map (
            din => exp_next(i), dout => exp_intern(i), 
            clk => clk,  reset => reset, ce=>op(2)
        );
    end generate;

	
    -- mantissa
	--   shifter
    mant_SRA <= mant_intern(4) &  mant_intern(4 downto 1);    
	
	--   mux 2:1 da entrada para load
    mant_ld_next <= num_in(7 downto 3) when sel_load_num = '1' else arithmetic_in;
	
	--   mux 2:1 entre load e shift
    mant_sel_ld <= not (op(1)); 
	mant_next <= mant_ld_next when mant_sel_ld = '1' else mant_SRA;
 
        
	-- instanciacao de 5 FF_DE para a mantissa
    uGenMant: for i in 0 to 4 generate
        FFD: ff_de port map (
            din => mant_next(i), dout => mant_intern(i), 
            clk => clk,  reset => reset, ce=>op(0)
        );
    end generate;
		   
		   
	-- atribuição da saída
    num(7 downto 3) <= mant_intern;
	num(2 downto 0) <= exp_intern;
	

end Behavioral;
