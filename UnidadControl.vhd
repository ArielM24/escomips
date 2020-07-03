----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.unidadControlPackage.all;
----------------------------------------
entity UnidadControl is
port
	(op_function: in std_logic_vector (3 downto 0);
	op_code: in std_logic_vector (4 downto 0);
	flags: in std_logic_vector (3 downto 0);
	LF: in std_logic;
	CLR: in std_logic;
	CLK: in std_logic;
	microInstruccion: out std_logic_vector (19 downto 0)
	);
end UnidadControl;
----------------------------------------
architecture Behavioral of UnidadControl is
signal OV: std_logic;
signal N: std_logic;
signal Z: std_logic;
signal C: std_logic;
signal EQ: std_logic;
signal NEQ: std_logic;
signal LT: std_logic;
signal LE: std_logic;
signal GT: std_logic;
signal GET: std_logic;
signal NA: std_logic;
signal TIPOR: std_logic;
signal BEQI: std_logic;
signal BNEQI: std_logic;
signal BLTI: std_logic;
signal BLETI: std_logic;
signal BGTI: std_logic;
signal BGETI: std_logic;
signal zero: std_logic_vector (4 downto 0);
signal SDOPC: std_logic;
signal SM: std_logic;
signal selOPC: std_logic_vector (4 downto 0);
signal dataOP: std_logic_vector (19 downto 0);
signal dataFU: std_logic_vector (19 downto 0);
----------------------------------------
begin
----------------------------------------

	zero <= "00000";

banderas : regBanderas
		port map
		(
			flags => flags,
			LF => LF,
			CLK => CLK,
			CLR => CLR,
			OV => OV,
			N => N,
			Z => Z,
			C => C
		);

condiciones : condicion
		port map
		(
			OV => OV,
			N => N,
			Z => Z,
			C => C,

			EQ => EQ,
			NEQ => NEQ,
			LT => LT,
			LE => LE,
			GT => GT,
			GET => GET
		);

niveles : nivelC
		port map
		(
			CLK => CLK,
			CLR => CLR,
			NA => NA
		);

decoInstr : decoInst
		port map
		(
			op_code => op_code,
			TIPOR => TIPOR,
			BEQI => BEQI,
			BNEQI => BNEQI,
			BLTI => BLTI,
			BLETI => BLETI,
			BGTI => BGTI,
			BGETI => BGETI
		);

UCP : UC
		port map
		(
			TIPOR => TIPOR,
			BEQI => BEQI,
			BNEQI => BNEQI,
			BLTI => BLTI,
			BLETI => BLETI,
			BGTI => BGTI,
			BGETI => BGETI,

			NA => NA,

			EQ => EQ,
			NEQ => NEQ,
			LT => LT,
			LE => LE,
			GT => GT,
			GET => GET,
			CLK => CLK,
			CLR => CLR,
			SDOPC => SDOPC,
			SM => SM
		);

MUXSDOPC : mux1
		port map
		(
			zeros => zero,
			operationCode => op_code,
			SDOPC => SDOPC,
			selOPC => selOPC
		);

operacion : codOP
		port map
		(
			dir => selOPC,
			data => dataOP
		);

funcion : codFUN
	port map
		(
			dir => op_function	,
			data => dataFU
		);

MUXSM : mux2
		port map
		(
			microCodFun => dataFU,
			microCodOpe => dataOP,
			SM => SM,
			microInstruccion => microInstruccion
		);
end Behavioral;

