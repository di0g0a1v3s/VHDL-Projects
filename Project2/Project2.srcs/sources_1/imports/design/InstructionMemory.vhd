library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity InstructionMemory is
    Port ( Address : in STD_LOGIC_VECTOR (7 downto 0);
           DataOut : out STD_LOGIC_VECTOR (31 downto 0));
end InstructionMemory;

architecture Structural of InstructionMemory is
type storage_type is array (0 to 255) of std_logic_vector(31 downto 0);

-- COMENTAR A LINHA SEGUINTE E DESCOMENTAR AS LINHAS CORRESPONDENTES AO TURNO DA SEMANA
--signal storage: storage_type := (others => x"00000000");

----------------------------------------------------------------------------------------------------
-- MEMORIA PARA OS TURNOS DE SEGUNDA-FEIRA
----------------------------------------------------------------------------------------------------
--signal storage: storage_type := (
--      --    OPCODE &   DR   &   SA   &   SB   &        KNS        -- ASSEMBLY CODE
--	 0 => "000001" & "0111" & "0000" & "0000" & "00000000000101", --        ADDI  R7,R0,#5
--	 1 => "000001" & "0011" & "0000" & "0000" & "00000000000001", --        ADDI  R3,R0,#1
--	 2 => "000001" & "0100" & "0000" & "0000" & "00000000000001", --        ADDI  R4,R0,#1
--	 3 => "000000" & "0010" & "0011" & "0100" & "00000000000000", --        ADD   R2,R3,R4
--	 4 => "000001" & "0001" & "0000" & "0000" & "00000000000010", --        ADDI  R1,R0,#2
--	 5 => "010111" & "0101" & "0001" & "0111" & "00000000000111", --        B.GE  R1,R7,#7    ; --> if (R1 >= R7) goto END
--	 6 => "000000" & "0101" & "0011" & "0100" & "00000000000000", -- LOOP:  ADD   R5,R3,R4
--	 7 => "001100" & "0011" & "0100" & "0000" & "00000000000000", --        XOR   R3,R4,R0
--	 8 => "001100" & "0100" & "0101" & "0000" & "00000000000000", --        XOR   R4,R5,R0
--	 9 => "000000" & "0010" & "0010" & "0101" & "00000000000000", --        ADD   R2,R2,R5
--	10 => "000001" & "0001" & "0001" & "0000" & "00000000000001", --        ADDI  R1,R1,#1
--	11 => "010111" & "0110" & "0001" & "0111" & "11111111111011", --        B.LT  R1,R7,#-5   ; --> if (R1 < R7) goto loop
--  12 => "010111" & "0000" & "0000" & "0000" & "00000000000000", -- END:   B     #0          ; --> END
--	 others => x"00000000" -- NOP
--	 );

----------------------------------------------------------------------------------------------------
-- MEMORIA PARA OS TURNOS DE TER?A-FEIRA
----------------------------------------------------------------------------------------------------
signal storage: storage_type := (
        --    OPCODE &   DR   &   SA   &   SB   &        KNS        -- ASSEMBLY CODE
     0 => "000011" & "0100" & "0000" & "0000" & "00000000000011", --        SUBI  R4,R0,#3
     1 => "000011" & "0011" & "0000" & "0000" & "00000000000001", --        SUBI  R3,R0,#1
     2 => "000011" & "0110" & "0000" & "1111" & "11111111111111", --        SUBI  R6,R0,#-1
     3 =>    x"00000000" , -- NOP
     4 => "010111" & "0010" & "0100" & "0000" & "00000000001100", --        B.EQ  R4,R0,#12    ; --> if (R4 = R0) goto END
     5 =>    x"00000000", -- NOP
     6 => "000010" & "0001" & "0011" & "0110" & "00000000000001", --        SUB   R1,R3,R6
     7 => "000010" & "0010" & "0011" & "0110" & "00000000000000", -- LOOP:  SUB   R2,R3,R6
     8 => "000011" & "0100" & "0100" & "1111" & "11111111111111", --        SUBI  R4,R4,#-1
     9 => "000010" & "0011" & "0000" & "0110" & "00000000000000", --        SUB   R3,R0,R6
     10 =>    x"00000000", -- NOP
     11 => "000010" & "0110" & "0000" & "0010" & "00000000000000", --        SUB   R6,R0,R2
     12 => "000000" & "0001" & "0001" & "0010" & "00000000000000", --        ADD   R1,R1,R2
     13 => "010111" & "0011" & "0100" & "0000" & "11111111111010", --        B.NE  R4,R0,#-6 ; --> if (R4 != R0) goto LOOP
     14 =>    x"00000000", -- NOP
     15 =>    x"00000000", -- NOP
     16 => "000010" & "0010" & "0000" & "0001" & "00000000000000", --        SUB   R2,R0,R1
     17 => "010111" & "0000" & "0000" & "0000" & "00000000000000", -- END:   B     #0          ; --> END
     18 =>    x"00000000", -- NOP
     19 =>    x"00000000", -- NOP
     others => x"00000000" -- NOP
	 );

----------------------------------------------------------------------------------------------------
-- MEMORIA PARA OS TURNOS DE QUARTA-FEIRA
----------------------------------------------------------------------------------------------------
--signal storage: storage_type := (
--          --    OPCODE &   DR   &   SA   &   SB   &        KNS        -- ASSEMBLY CODE
--         0 => "000011" & "0001" & "0000" & "1111" & "11111111111111", --        SUBI  R1,R0,#-1
--         1 => "010110" & "0000" & "0000" & "0001" & "00000000000001", --        ST    (R0+1),R1
--         2 => "010110" & "0000" & "0000" & "0001" & "00000000000010", --        ST    (R0+2),R1
--         3 => "000000" & "0010" & "0001" & "0001" & "00000000000000", --        ADD   R2,R1,R1
--         4 => "000011" & "0011" & "0000" & "1111" & "11111111111110", --        SUBI  R3,R0,#-2
--         5 => "000011" & "0100" & "0000" & "1111" & "11111111111011", --        SUBI  R4,R0,#-5
--         6 => "010111" & "0111" & "0011" & "0000" & "00000000000111", --        B.LE  R4,R3,#7      ; --> if (R4 <= R3) goto END
--         7 => "010101" & "0101" & "0011" & "1111" & "11111111111111", -- LOOP:  LDI   R5,(R3+#-1)
--         8 => "000000" & "0001" & "0001" & "0101" & "00000000000000", --        ADD   R1,R1,R5
--         9 => "000000" & "0010" & "0010" & "0001" & "00000000000000", --        ADD   R2,R2,R1
--        10 => "010110" & "0000" & "0011" & "0001" & "00000000000001", --        ST    (R3+#1),R1
--        11 => "000011" & "0011" & "0011" & "1111" & "11111111111111", --        SUBI  R3,R3,#-1
--        12 => "010111" & "0100" & "0100" & "0011" & "11111111111011", --        B.GT  R4,R3,#-5     ; --> if (R4 >= R3) goto LOOP
--        13 => "010111" & "0000" & "0000" & "0000" & "00000000000000", -- END:   B     #0            ; --> END
--    others => x"00000000" -- NOP
--	 );

----------------------------------------------------------------------------------------------------
-- MEMORIA PARA OS TURNOS DE QUINTA-FEIRA
----------------------------------------------------------------------------------------------------
--signal storage: storage_type := (
--          --    OPCODE &   DR   &   SA   &   SB   &        KNS        -- ASSEMBLY CODE
--         0 => "001001" & "0010" & "0000" & "0000" & "00000000001111", --        ORIL  R2,R0,#15
--         1 => "001001" & "0001" & "0000" & "0011" & "11111001101100", --        ORIL  R1,R0,#FE6Ch
--         2 => "001001" & "0011" & "0000" & "0000" & "00000000000000", --        ORIL  R3,R0,#0
--         3 => "010111" & "0010" & "0001" & "0000" & "00000000001001", --        B.EQ  R1,R0,#9      ; if (R1==0) goto END
--         4 => "000100" & "0100" & "0001" & "0010" & "00000000000000", -- LOOP:  AND   R4,R1,R2
--         5 => "010100" & "0101" & "0100" & "0000" & "00000000000000", --        LD    R5,(R4+R0)
--         6 => "000000" & "0011" & "0011" & "0101" & "00000000000000", --        ADD   R3,R3,R5
--         7 => "001111" & "0001" & "0000" & "0001" & "00000000000000", --        SHR   R1,R1
--         8 => "001111" & "0001" & "0000" & "0001" & "00000000000000", --        SHR   R1,R1
--         9 => "001111" & "0001" & "0000" & "0001" & "00000000000000", --        SHR   R1,R1
--        10 => "001111" & "0001" & "0000" & "0001" & "00000000000000", --        SHR   R1,R1
--        11 => "010111" & "0011" & "0001" & "0000" & "11111111111001", --        B.NE  R1,R0,#-7     ; if (R1!=0) goto LOOP
--        12 => "010111" & "0000" & "0000" & "0000" & "00000000000000", -- END:   B     #0
--    others => x"00000000" -- NOP
--    );

----------------------------------------------------------------------------------------------------
-- MEMORIA PARA OS TURNOS DE SEXTA-FEIRA
----------------------------------------------------------------------------------------------------
--signal storage: storage_type := (
--          --    OPCODE &   DR   &   SA   &   SB   &        KNS        -- ASSEMBLY CODE
--         0 => "000001" & "0001" & "0000" & "1111" & "11010011000011", --        ADDI  R1,R0,#-2876
--         1 => "000001" & "0111" & "0000" & "1111" & "11111111111000", --        ADDI  R7,R0,#-8
--         2 => "000001" & "0010" & "0000" & "0000" & "00000000001111", --        ADDI  R2,R0,#15
--         3 => "001100" & "0011" & "0000" & "0000" & "00000000000000", --        XOR   R3,R0,R0
--         4 => "001100" & "0100" & "0001" & "0010" & "00000000000000", -- LOOP:  XOR   R4,R1,R2
--         5 => "000100" & "0100" & "0100" & "0010" & "00000000000000", --        AND   R4,R4,R2
--         6 => "010100" & "0101" & "0100" & "0000" & "00000000000000", --        LD    R5,(R4+R0)
--         7 => "010011" & "0001" & "0000" & "0001" & "00000000000000", --        SHRA  R1,R1
--         8 => "010011" & "0001" & "0000" & "0001" & "00000000000000", --        SHRA  R1,R1
--         9 => "010011" & "0001" & "0000" & "0001" & "00000000000000", --        SHRA  R1,R1
--        10 => "010011" & "0001" & "0000" & "0001" & "00000000000000", --        SHRA  R1,R1
--        11 => "000000" & "0011" & "0011" & "0101" & "00000000000000", --        ADD   R3,R3,R5
--        12 => "011000" & "0011" & "0001" & "0111" & "11111111111111", --        BI.NE R1,#-1,R7     ; --> if (R4 >= R3) goto LOOP
--        13 => "010111" & "0000" & "0000" & "0000" & "00000000000000", -- END:   B     #0            ; --> END
--    others => x"00000000" -- NOP
--	 );

	 
begin

DataOut <= storage(to_integer(unsigned(Address)));
	
end Structural;
