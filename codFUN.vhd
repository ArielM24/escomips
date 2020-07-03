library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use iEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity codFUN is
	generic
	(
		palabra : integer := 20;
		busT  : integer := 4
	);
	port
	(
		dir		: in 	std_logic_vector(busT-1 downto 0);
		data		: out	std_logic_vector(palabra-1 downto 0)
	);
end codFUN;

architecture Behavioral of codFUN is

-- Programa de Prueba --
constant CADD	: std_logic_vector (palabra - 1 downto 0)	:= "00000100010000110010";		-- 00
constant CSUB	: std_logic_vector (palabra - 1 downto 0)	:= "00000100010001110010";		-- 01
constant CAND	: std_logic_vector (palabra - 1 downto 0)	:= "00000100010000000010";		-- 02
constant COR	: std_logic_vector (palabra - 1 downto 0)	:= "00000100010000010010";		-- 03
constant CXOR	: std_logic_vector (palabra - 1 downto 0)	:= "00000100010000100010";		-- 04
constant CNAND	: std_logic_vector (palabra - 1 downto 0)	:= "00000100010011010010";		-- 05
constant CNOR	: std_logic_vector (palabra - 1 downto 0)	:= "00000100010011000010";		-- 06
constant CXNOR	: std_logic_vector (palabra - 1 downto 0)	:= "00000100010001100010";		-- 07
constant CNOT	: std_logic_vector (palabra - 1 downto 0)	:= "00000100010011000010";		-- 08
constant CSLL	: std_logic_vector (palabra - 1 downto 0)	:= "00000001110000000000";		-- 09
constant CSRL	: std_logic_vector (palabra - 1 downto 0)	:= "00000001010000000000";		-- 10

type arr is array (0 to ((2**busT)-1)) of std_logic_vector((palabra-1) downto 0);

constant memoria: arr :=	(
													CADD,						-- 00
													CSUB,						-- 01
													CAND,						-- 02
													COR,						-- 03
													CXOR,						-- 04
													CNAND,					-- 05
													CNOR,						-- 06
													CXNOR,					-- 07
													CNOT,						-- 08
													CSLL,						-- 09
													CSRL,						-- 10
													others => (others => '0')
												);

begin
	data <= memoria(conv_integer(dir));
end Behavioral;
