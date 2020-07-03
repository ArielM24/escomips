library IEEE;
use IEEE.STD_LOGIC_1164.all;

package unidadControlPackage is

	component regBanderas is												
		port
		(
			flags							: in std_logic_vector (3 downto 0);
			LF								: in std_logic;
			CLK							: in std_logic;
			CLR							: in std_logic;
			OV								: inout std_logic;
			N								: inout std_logic;
			Z								: inout std_logic;
			C								: inout std_logic
		);
	end component;

	component condicion is												
		port
		(
			OV								: in std_logic;
			N								: in std_logic;
			Z								: in std_logic;
			C								: in std_logic;

			EQ								: out std_logic;
			NEQ							: out std_logic;
			LT								: out std_logic;
			LE								: out std_logic;
			GT								: out std_logic;
			GET							: out std_logic
		);
	end component;

	component nivelC is													
		port
		(
			CLK							: in std_logic;
			CLR							: in std_logic;
			NA								: out std_logic
		);
	end component;

	component decoInst is												
		port
		(
			op_code				: in std_logic_vector(4 downto 0);

			TIPOR							: out std_logic;
			BEQI							: out std_logic;
			BNEQI							: out std_logic;
			BLTI							: out std_logic;
			BLETI							: out std_logic;
			BGTI							: out std_logic;
			BGETI							: out std_logic
		);
	end component;

	component UC is											
		port
		(
			TIPOR							: in std_logic;
			BEQI							: in std_logic;
			BNEQI							: in std_logic;
			BLTI							: in std_logic;
			BLETI							: in std_logic;
			BGTI							: in std_logic;
			BGETI							: in std_logic;
			NA								: in std_logic;
			EQ								: in std_logic;
			NEQ							: in std_logic;
			LT								: in std_logic;
			LE								: in std_logic;
			GT								: in std_logic;
			GET							: in std_logic;
			CLK							: in std_logic;
			CLR							: in std_logic;
			SDOPC							: out std_logic;
			SM								: out std_logic
		);
	end component;

	component mux1 is												
		port
		(
			zeros							: in std_logic_vector (4 downto 0);
			operationCode				: in std_logic_vector (4 downto 0);
			SDOPC							: in std_logic;
			selOPC						: out std_logic_vector (4 downto 0)
		);
	end component;

	component codOP is													
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
	end component;

	component codFUN is		
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
	end component;

	component mux2 is									
		port
		(
			microCodFun					: in std_logic_vector (19 downto 0);
			microCodOpe					: in std_logic_vector (19 downto 0);
			SM								: in std_logic;
			microInstruccion			: out std_logic_vector (19 downto 0)
		);
	end component;

end unidadControlPackage;

package body unidadControlPackage is


end unidadControlPackage;
