library IEEE;
use IEEE.STD_LOGIC_1164.all;

package ProyectoESCOMipsPVPackage is
	
	-- Divisor de Frecuencias
	component divFrecuencia is														
		Port
		(
			Osc_clk				: in STD_LOGIC;
			clr					: in STD_LOGIC;
			clk					: out STD_LOGIC
		);
	end component;

	component FF is
		port
		(
			CLK				: in std_logic;
			RCLR				: in std_logic;
			CLR				: out std_logic
		);
	end component;
	
	-- ALU
	component ALU is														
		generic
		(
			N: integer := 16
		);
		Port
		(
			a								: in  STD_LOGIC_VECTOR (N-1 downto 0);
			b								: in  STD_LOGIC_VECTOR (N-1 downto 0);
			aluop							: in  STD_LOGIC_VECTOR (3 downto 0);
			result						: out  STD_LOGIC_VECTOR (N-1 downto 0);
			flags							: out  STD_LOGIC_VECTOR (3 downto 0)
		);
	end component;

	component ArchivoRegistros is														-- Archivo de Registros
		generic
		(
			n: integer := 16								
		);
		port
		(
			  clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           DIR : in  STD_LOGIC;
           WR : in  STD_LOGIC;
			  SHE : in  STD_LOGIC;
           writeRegister : in  STD_LOGIC_VECTOR (3 downto 0);
           writeData : in  STD_LOGIC_VECTOR (n-1 downto 0);
           readRegister1 : in  STD_LOGIC_VECTOR (3 downto 0);
           readRegister2 : in  STD_LOGIC_VECTOR (3 downto 0);
           SHAMT : in  STD_LOGIC_VECTOR (3 downto 0);
           readData1 : out  STD_LOGIC_VECTOR (n-1 downto 0);
           readData2 : out  STD_LOGIC_VECTOR (n-1 downto 0)
		);
	end component;

	component MemoriaDatos is
		generic
		(
			palabra : integer := 16;
			busT  : integer := 11
		);
		port
		(
			dir		: in 	std_logic_vector(busT-1 downto 0);
			d_in		: in 	std_logic_vector(palabra-1 downto 0);
			d_out		: out	std_logic_vector(palabra-1 downto 0);

			WD					: in	std_logic;
			clk				: in	std_logic
		);
	end component;

	component Pila is														-- Pila
		generic
		(
			constant busT 					: integer := 16;
			constant tamSP		: integer := 3
		);
		port
		(
			pcData				: in std_logic_vector(busT-1 downto 0);
			programCounter		: out std_logic_vector(busT-1 downto 0);
			WPC						: in std_logic;
			UP						: in std_logic;
			DW						: in std_logic;
			clk					: in std_logic;
			clr					: in std_logic
		);
	end component;

	component MemoriaPrograma is														-- Memoria de Programa
		generic
		(
			palabra : integer := 25;
			busT  : integer := 11
		);
		port
		(
			dir		: in 	std_logic_vector(busT-1 downto 0);
			data		: out	std_logic_vector(palabra-1 downto 0)
		);
	end component;

	component UnidadControl is														-- Unidad de Control
		port
		(
			op_function						: in std_logic_vector (3 downto 0);
			op_code							: in std_logic_vector (4 downto 0);
			flags								: in std_logic_vector (3 downto 0);
			LF									: in std_logic;

			CLR								: in std_logic;
			CLK								: in std_logic;

			microInstruccion				: out std_logic_vector (19 downto 0)
--			NAO								: out std_logic
		);
	end component;

	component ExtensorSigno is															-- Extensor de Signo
		generic
		(
				N					: integer := 12;
				S					: integer := 16
		);
		port
		(
				entrada			: in std_logic_vector(N-1 downto 0);
				salida			: out std_logic_vector(S-1 downto 0)
		);
	end component;

	component ExtensorDireccion is															-- Extensor de Direcci�n
		generic
		(
				N					: integer := 12;
				S					: integer := 16
		);
		port
		(
				entrada			: in std_logic_vector(N-1 downto 0);
				salida			: out std_logic_vector(S-1 downto 0)
		);
	end component;

end ProyectoESCOMipsPVPackage;

package body ProyectoESCOMipsPVPackage is


end ProyectoESCOMipsPVPackage;
