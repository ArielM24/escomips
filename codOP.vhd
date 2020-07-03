 library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use iEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity codOP is
	generic
	(
		palabra : integer := 20;
		busT  : integer := 5
	);
	port
	(
		dir		: in 	std_logic_vector(busT-1 downto 0);
		data		: out	std_logic_vector(palabra-1 downto 0)
	);
end codOP;

architecture Behavioral of codOP is


  constant VERIF	: std_logic_vector (palabra - 1 downto 0)	:= "00001000000001110001";		-- 0
  constant LI		: std_logic_vector (palabra - 1 downto 0)	:= "00000000010000000000";		-- 1
  constant LWI		: std_logic_vector (palabra - 1 downto 0)	:= "00000100010000001000";		-- 2
  constant LW		: std_logic_vector (palabra - 1 downto 0)	:= "00000110010100110000";		-- 23
  constant SWI		: std_logic_vector (palabra - 1 downto 0)	:= "00001000000000001100";		-- 3
  constant SW		: std_logic_vector (palabra - 1 downto 0)	:= "00001010000100110100";		-- 4

  constant ADDI	: std_logic_vector (palabra - 1 downto 0)	:= "00000100010100110010";		-- 5
  constant SUBI	: std_logic_vector (palabra - 1 downto 0)	:= "00000100010101110010";		-- 6
  constant ANDI	: std_logic_vector (palabra - 1 downto 0)	:= "00000100010100000010";		-- 7
  constant ORI		: std_logic_vector (palabra - 1 downto 0)	:= "00000100010100010010";		-- 8
  constant XORI	: std_logic_vector (palabra - 1 downto 0)	:= "00000100010100100010";		-- 9
  constant NANDI	: std_logic_vector (palabra - 1 downto 0)	:= "00000100010111010010";		-- 10
  constant NORI	: std_logic_vector (palabra - 1 downto 0)	:= "00000100010111000010";		-- 11
  constant XNORI	: std_logic_vector (palabra - 1 downto 0)	:= "00000100010101100010";		-- 12

  constant SALTO	: std_logic_vector (palabra - 1 downto 0)	:= "10010000001100110010";		-- 13, 14, 15, 16, 17, 18

  constant B		: std_logic_vector (palabra - 1 downto 0)	:= "00010000000000000000";		-- 19
  constant CALL	: std_logic_vector (palabra - 1 downto 0)	:= "01010000000000000000";		-- 20
  constant RET		: std_logic_vector (palabra - 1 downto 0)	:= "00100000000000000000";		-- 21
  constant NOP		: std_logic_vector (palabra - 1 downto 0)	:= "00000000000000000000";		-- 22

type arr is array (0 to ((2**busT)-1)) of std_logic_vector((palabra-1) downto 0);

constant memoria: arr :=	(
													VERIF,					-- 0
													LI,						-- 1
													LWI,						-- 2
													SWI,						-- 3
													SW,						-- 4
													ADDI,						-- 5
													SUBI,						-- 6
													ANDI,						-- 7
													ORI,						-- 8
													XORI,						-- 9
													NANDI,					-- 10
													NORI,						-- 11
													XNORI,					-- 12
													SALTO,					-- 13
													SALTO,					-- 14
													SALTO,					-- 15
													SALTO,					-- 16
													SALTO,					-- 17
													SALTO,					-- 18
													B,							-- 19
													CALL,						-- 20
													RET,						-- 21
													NOP,						-- 22
													LW,						-- 23
													others => (others => '0')					-- 24 .. 31
												);

begin
	data <= memoria(conv_integer(dir));
end Behavioral;
