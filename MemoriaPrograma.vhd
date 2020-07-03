----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use iEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-------------------------------------------
entity MemoriaPrograma is
generic
	(palabra: integer := 25;
	busT: integer := 10
	);
	port
	(dir: in	std_logic_vector(busT-1 downto 0);
	data: out std_logic_vector(palabra-1 downto 0)
	);
end MemoriaPrograma;
-------------------------------------------
architecture Behavioral of MemoriaPrograma is

	constant R0	: std_logic_vector(3 downto 0):=x"0";
	constant R1	: std_logic_vector(3 downto 0):=x"1";
	constant R2	: std_logic_vector(3 downto 0):=x"2";
	constant R3	: std_logic_vector(3 downto 0):=x"3";
	constant R4	: std_logic_vector(3 downto 0):=x"4";
	constant R5	: std_logic_vector(3 downto 0):=x"5";
	constant R6	: std_logic_vector(3 downto 0):=x"6";
	constant R7	: std_logic_vector(3 downto 0):=x"7";
	constant R8	: std_logic_vector(3 downto 0):=x"8";
	constant R9	: std_logic_vector(3 downto 0):=x"9";
	constant R10: std_logic_vector(3 downto 0):=x"A";
	constant R11: std_logic_vector(3 downto 0):=x"B";
	constant R12: std_logic_vector(3 downto 0):=x"C";
	constant R13: std_logic_vector(3 downto 0):=x"D";
	constant R14: std_logic_vector(3 downto 0):=x"E";
	constant R15: std_logic_vector(3 downto 0):=x"F";
	
	--Codigos de Operación
	constant codOP_TipoR		: std_logic_vector:="00000";
	constant codOP_LI			: std_logic_vector:="00001";
	constant codOP_LWI		: std_logic_vector:="00010";
	constant codOP_SWI		: std_logic_vector:="00011";
	constant codOP_SW			: std_logic_vector:="00100";
	constant codOP_ADDI		: std_logic_vector:="00101";
	constant codOP_SUBI		: std_logic_vector:="00110";
	constant codOP_ANDI		: std_logic_vector:="00111";
	constant codOP_ORI		: std_logic_vector:="01000";
	constant codOP_XORI		: std_logic_vector:="01001";
	constant codOP_NANDI		: std_logic_vector:="01010";
	constant codOP_NORI		: std_logic_vector:="01011";
	constant codOP_XNORI		: std_logic_vector:="01100";
	constant codOP_BEQI		: std_logic_vector:="01101";
	constant codOP_BNEI		: std_logic_vector:="01110";
	constant codOP_BLTI		: std_logic_vector:="01111";
	constant codOP_BLETI		: std_logic_vector:="10000";
	constant codOP_BGTI		: std_logic_vector:="10001";
	constant codOP_BGETI		: std_logic_vector:="10010";
	constant codOP_B			: std_logic_vector:="10011";
	constant codOP_CALL		: std_logic_vector:="10100";
	constant codOP_RET		: std_logic_vector:="10101";
	constant codOP_NOP		: std_logic_vector:="10110";
	constant codOP_LW			: std_logic_vector:="10111";
	
	--Códigos de Función
	constant codFun_ADD		: std_logic_vector:=x"0";
	constant codFun_SUB		: std_logic_vector:=x"1";
	constant codFun_AND		: std_logic_vector:=x"2";
	constant codFun_OR		: std_logic_vector:=x"3";
	constant codFun_XOR		: std_logic_vector:=x"4";
	constant codFun_NAND 	: std_logic_vector:=x"5";
	constant codFun_NOR		: std_logic_vector:=x"6";
	constant codFun_XNOR 	: std_logic_vector:=x"7";
	constant codFun_NOT		: std_logic_vector:=x"8";
	constant codFun_SLL		: std_logic_vector:=x"9";
	constant codFun_SRL  	: std_logic_vector:=x"A";
	
	--Sin Usar
	constant SU: std_logic_vector:=x"0";
	
	--Etiquetas llamadas a subrutinas
	constant initialize	: std_logic_vector:=x"0005";
	constant sorting		: std_logic_vector:=x"000D";
	constant show	: std_logic_vector:=x"001B";
	
	--Etiquetas para saltos incondicionales
	constant filling		: std_logic_vector:=x"0007";
	constant loop1		: std_logic_vector:=x"000E";
	constant loop2		: std_logic_vector:=x"0010";
	constant reading			: std_logic_vector:=x"001C";
	constant again	: std_logic_vector:=x"0003";
	
	--Etiquetas para saltos condicionales
	constant end_initialize	: std_logic_vector:=x"005";
	constant end_show		: std_logic_vector:=x"004";
	constant end_sorting			: std_logic_vector:=x"00C";
	constant loopi				: std_logic_vector:=x"008";
	constant loopj				: std_logic_vector:=x"003";


type arr is array (0 to ((2**busT)-1)) of std_logic_vector((palabra-1) downto 0);
constant banco: arr :=	(
--
--		codOP_LI&R0&x"000A",
--		codOP_CALL&SU&initialize,
--		codOP_CALL&SU&sorting,
--		codOP_CALL&SU&show,
--
--		codOP_B&SU&again,
--		codOP_LI&R1&x"0000",
--		codOP_LI&R2&x"0384",
--
--		codOP_BEQI&R1&R0&end_initialize,
--		codOP_SW&R2&R1&x"000",
--		codOP_SUBI&R2&R2&x"00C",
--		codOP_ADDI&R1&R1&x"001",
--
--		codOP_B&SU&filling,
--		codOP_RET&SU&SU&SU&SU&SU,
--		codOP_LI&R1&x"0001",
--
--		codOP_BEQI&R1&R0&end_sorting,
--		codOP_ORI&R2&R1&x"000",
--		codOP_BEQI&R2&R0&loopi,
--		codOP_LW&R3&R1&x"FFF",
--		codOP_LW&R4&R2&x"000",
--
--		codOP_BLETI&R4&R3&loopj,
--		codOP_SW&R4&R1&x"FFF",
--		codOP_SW&R3&R2&x"000",
--		codOP_ADDI&R2&R2&x"001",
--		codOP_B&SU&loop2,
--		codOP_ADDI&R1&R1&x"001",
--		codOP_B&SU&loop1,
--		codOP_RET&SU&SU&SU&SU&SU,
--		codOP_LI&R1&x"0000",
--
--		codOP_BEQI&R1&R0&end_show,
--		codOP_LW&R2&R1&x"000",
--		codOP_ADDI&R1&R1&x"001",
--
--		codOP_B&SU&reading,
--		codOP_RET&SU&SU&SU&SU&SU,
--		others=>(others=>'0')				
--		);
							--Fibonacci--
		"0000100000000000000000000",--LI, R0 = 0
		"0000100010000000000000001",--LI, R1 = 1
		"0000000100000000000000000",--LI, R2 = 0
		"0001100110000000000000001",--LI, R3 = 12
		"0000001000000000100000000",--ADD, R4 = R0+R1
		"0001101000000000001001000",--SWI, MEM[72] = R4
		"0010100000001000000000000",--ORI, R0 = R1
		"0010100010100000000000000",--ORI, R1 = R4									 
		"0010100100010000000000001",--ADDI, R2 = R2+1
		"0111000100011111111111011",--BNEI, R2!=R3, salto 4
		"1011000000000000000000000",--NOP
		"1001100000000000000001010",--B, salto 10
others => (others=>'0') );

--	--Burbujita--
--	"1010000000000000000000011", -- call Llenado(LINEA 3)			-- 0
--	"1010000000000000000100101", -- call subrutina(LINEA 37)	   -- 1
--	"1010000000000000000011010", -- call mostrar(Linea 26)      -- 2
--	
--	-- *************** Llenado ***************
--	"0000100010000000000000001",--li R1,1 				 				-- 3
--	"0001100010000000001000000",--swi 1,40 Mem[0x40]=R1 			-- 4
--	"0000100010000000000001111",--li R1,15					 			-- 5
--	"0001100010000000001000001",--swi 1,41 Mem[0x41]=R1				-- 6
--	"0000100010000000000001010",--li R1,10									-- 7
--	"0001100010000000001000010",--swi 1,42 Mem[0x42]=R1				-- 8
--	"0000100010000000000010100",--li R1,20									-- 9
--	"0001100010000000001000011",--swi 1,43 Mem[0x43]=R1				-- 10
--	"0000100010000000000001100",--li R1,12									-- 11
--	"0001100010000000001000100",--swi 1,44 Mem[0x44]=R1				-- 12
--	"0000100010000000000101101",--li R1,45									-- 13
--	"0001100010000000001000101",--swi 1,44 Mem[0x45]=R1				-- 14					
--	"0000100010000000000000101",--li R1,5									-- 15
--	"0001100010000000001000110",--swi 1,44 Mem[0x46]=R1				-- 16
--	"0000100010000000000111100",--li R1,60									-- 17
--	"0001100010000000001000111",--swi 1,44 Mem[0x47]=R1				-- 18
--	"0000100010000000000000111",--li R1,7									-- 19
--	"0001100010000000001001000",--swi 1,44 Mem[0x48]=R1				-- 20
--	"0000100010000000000001100",--li R1,12								-- 21
--	"0001100010000000001001001",--swi 1,44 Mem[0x49]=R1				-- 22
--	"0000100000000000000000000",--li R0,0  R0=0           			-- 23
--	"0000101100000000000001001",--li R6,9 R6=9          				-- 24
--	"1010100000000000000000000",--RET									-- 25
--	
--	-- *************** Mostrar Arreglo ordenado ***************
--	"0001001010000000001000000", --lwi r5 x40 R5=mem[0x40] 		-- 26
--	"0001001010000000001000001", --lwi r5 x41 R5=mem[0x41]		-- 27
--	"0001001010000000001000010", --lwi r5 x42 R5=mem[0x42]		-- 28
--	"0001001010000000001000011", --lwi r5 x43 R5=mem[0x43]		-- 29
--	"0001001010000000001000100", --lwi r5 x44 R5=mem[0x44]		-- 30
--	"0001001010000000001000101", --lwi r5 x45 R5=mem[0x45]		-- 31
--	"0001001010000000001000110", --lwi r5 x46 R5=mem[0x46]		-- 32
--	"0001001010000000001000111", --lwi r5 x47 R5=mem[0x47]		-- 33
--	"0001001010000000001001000", --lwi r5 x48 R5=mem[0x48]		-- 34
--	"0001001010000000001001001", --lwi r5 x49 R5=mem[0x49] 		-- 35
--	"1001100000000000000011010", -- B goto 26    			 		-- 36
--	
--	-- *************** Subrutina(bubble-sort) ***************
--	"0000100100000000000000000",--li R2,0 R2=0             			-- 37
--	"0000001010110000000000001",--sub R5=R6-R0							-- 38
--	"1011100110010000001000000",--lw R3,lit12(R2) R3=mem[0x40+R2] 	-- 39
--	"0010100100010000000000001",--addi R2=R2+1						   -- 40
--	"1011101000010000001000000",--lw R4,lit12(R2) R4=mem[0x40+R2]  -- 41
--	"1000001000011000000000101",--BLTEI R4,R3,5 IF(R3<=R4)goto 45 	-- 42
--	"0010000110010000001000000",--sw R3,0x40(R2) Mem[0x40+R2]=R3 	-- 43
--	"0011000100010000000000001",--subi R2=R2-1							-- 44
--	"0010001000010000001000000",--sw R4,0x40(R2) Mem[0x40+R2]=R4	-- 45
--	"0010100100010000000000001",--addi R2=R2+1							-- 46
--	"0111001010010111111111000",--BNEI R2,R5,-8 IF(R2!=R5) goto37 	-- 47
--	"0010100000000000000000001",--addi R0=R0+1							-- 48
--	"0111001100000111111110100",--BNEI R0,R6,-12 IF(R0!=R6) goto35 -- 49
--	"1010100000000000000000000",--RET										-- 50
--
--	"1010000000000000000000100",--CALL INICIAR ARREGLO EN MEMORIA 		0
--	"1010000000000000000011001",--CALL ORDENAR ARREGLO						1
--
---- 	B00
--	"1010000000000000000110000",--CALL VISUALIZAR ARREGLO ORDENADO		2
--	"100110000"&x"0002",-- B00														3
--
--
----INICIAR ARREGLO EN MEMORIA
--	"00001"&"0000"&x"0047",--LI R0,#71											4
--	"00011"&"0000"&x"0070",--SWI R0, 0X070										5
--	"00001"&"0001"&x"0018",--LI R1,#27											6
--	"00011"&"0001"&x"0071",--SWI R1, 0X071												7
--	"00001"&"0010"&x"0068",--LI R2,#104													8
--	"00011"&"0010"&x"0072",--SWI R2, 0X072												9
--	"00001"&"0011"&x"002e",--LI R3,#46													10
--	"00011"&"0011"&x"0073",--SWI R3, 0X073												11
--	"00001"&"0100"&x"0114",--LI R4,#276													12
--	"00011"&"0100"&x"0074",--SWI R4, 0X074												13
--	"00001"&"0101"&x"0000",--LI R5,#0													14
--	"00011"&"0101"&x"0075",--SWI R5, 0X075												15
--	"00001"&"0110"&x"001f",--LI R6,#31													16
--	"00011"&"0110"&x"0076",--SWI R6, 0X076												17
--	"00001"&"0111"&x"0005",--LI R7,#5													18
--	"00011"&"0111"&x"0077",--SWI R7, 0X077												19
--	"00001"&"1000"&x"0080",--LI R8,#128													20
--	"00011"&"1000"&x"0078",--SWI R8, 0X078												21
--	"00001"&"1001"&x"0003",--LI R9,#3													22	
--	"00011"&"1001"&x"0079",--SWI R9, 0X079												23
--	"10101"&"0000"&x"0000",--RET														24
--
----ORDENAR ARREGLO
--
--	"00001"&"1010"&"0000000000000000",--LI R10,#0									25
--	"00001"&"1100"&"0000000000001001",--LI R12,#9									26
--	"00001"&"1010"&"0000000000000000",--LI R13,#0									27
--	"00001"&"1010"&"0000000000000000",--LI R14,#0									28
--	"00001"&"1010"&"0000000000000000",--LI R15,#0									29
--	
----B01
--	"01111"&"1010"&"1100"&x"011",--BLETI R12,R10, 44								30
--	"00001"&"1011"&"0000000000000000",--LI R11,#0									31
--	"00000"&"1111"&"1100"&"1010"&x"01",--SUB R15,R12,R10							32
----B02
--	"01111"&"1011"&"1111"&x"00C",--BLETI R15,R11, 30								33
--	
--	"10111"&"1101"&"1011"&x"070",--LW R13,LIT12(#R11)								34
--	"00101"&"1011"&"1011"&x"001",--ADDI R11,R11,#1									35
--	
--	"10111"&"1110"&"1011"&x"070",--LW R14,LIT12(#R11)								36
--	"00110"&"1011"&"1011"&x"001",--SUBI R11,R11,#1									37
--	
--	"01111"&"1110"&"1101"&x"005",--BLTI R14,R13, 37									38
--	"00100"&"1110"&"1011"&x"070",--SW R14, LIT12(#R11)								39
--	"00101"&"1011"&"1011"&x"001",--ADDI R11,R11,#1									40
--	"00100"&"1101"&"1011"&x"070",--SW R13, LIT12(#R11)								41
--	"00110"&"1011"&"1011"&x"001",--SUBI R11,R11,#1									42
--	
--	"00101"&"1011"&"1011"&x"001",--ADDI R11,R11,#1									43
--	"10011"&"0000"&x"0021",--B02													44
--	"00101"&"1010"&"1010"&x"001",--ADDI R1O,R10,#1									45
--	"10011"&"0000"&x"001E",--B01													46
--	"10101"&"0000"&x"0000",--RET													47
--
----VISUALIZAR ARREGLO ORDENADO
----B3
----	"00010"&"1101"&x"0070",--LWI R13,LIT12(#R15)								50
--	"00010"&"1101"&x"0071",--LWI R13,LIT12(#R15)								50
--	"00010"&"1101"&x"0072",--LWI R13,LIT12(#R15)								50
--	"00010"&"1101"&x"0073",--LWI R13,LIT12(#R15)								50
--	"00010"&"1101"&x"0074",--LWI R13,LIT12(#R15)								50
--	"00010"&"1101"&x"0075",--LWI R13,LIT12(#R15)								50
--	"00010"&"1101"&x"0076",--LWI R13,LIT12(#R15)								50
--	"00010"&"1101"&x"0077",--LWI R13,LIT12(#R15)								50
--	"00010"&"1101"&x"0078",--LWI R13,LIT12(#R15)								50
--	"00010"&"1101"&x"0079",--LWI R13,LIT12(#R15)								50
--	"00010"&"1101"&x"007A",--LWI R13,LIT12(#R15)								50
--	"10101"&"0000"&x"0000",-- RET													53

--	others => (others => '0'));

-------------------------------------------
begin
-------------------------------------------
data <= banco(conv_integer(dir));
-----------------------------------------------------
end Behavioral;

