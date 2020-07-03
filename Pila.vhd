----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-----------------------------------------------------------
entity Pila is
generic
	(constant busT 	: integer := 16;
	constant tamSP	: integer := 3
	);

	port
	(pcData: in std_logic_vector(busT-1 downto 0);
	programCounter: out std_logic_vector(busT-1 downto 0);
	WPC: in std_logic;
	UP: in std_logic;
	DW: in std_logic;
	clk: in std_logic;
	clr: in std_logic
	);
end Pila;
-----------------------------------------------------------
architecture Behavioral of Pila is
type arreglo is array (0 to (2**tamSP)-1) of std_logic_vector (busT-1 downto 0);
signal pila: arreglo;

-----------------------------------------------------------
begin
-----------------------------------------------------------
	process(clk, clr, pila)
	variable SP: integer range 0 to (2**tamSP)-1;

	begin
		if(clr = '1') then
			pila <= (others => (others => '0'));
			SP := 0;
		elsif(rising_edge(clk)) then
			if(WPC = '1' and UP = '0' and DW = '0') then-- B
				pila(SP) <= pcData;
			elsif(WPC = '1' and UP = '1' and DW = '0') then-- CALL
				SP := SP + 1;
				pila(SP) <= pcData;
			elsif(WPC = '0' and UP = '0' and DW = '1') then-- RET
				SP := SP - 1;
				pila(SP) <= pila(SP) + 1;
			else
				pila(SP) <= pila(SP) + 1;
			end if;
		end if;

		programCounter <= pila(SP);
	end process;
----------------------------------------------------------------
end Behavioral;

