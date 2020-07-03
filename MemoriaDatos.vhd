------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use iEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
---------------------------------------------------
entity MemoriaDatos is
generic
	(palabra: integer := 16;
	busT: integer := 11
	);
	port
	(dir: in	std_logic_vector(busT-1 downto 0);
	d_in: in	std_logic_vector(palabra-1 downto 0);
	d_out: out	std_logic_vector(palabra-1 downto 0);
	WD: in	std_logic;
	clk: in	std_logic
	);
end MemoriaDatos;
---------------------------------------------------------
architecture Behavioral of MemoriaDatos is
type arr is array (0 to ((2**busT)-1)) of std_logic_vector((palabra-1) downto 0);
signal salida: arr;
----------------------------------------------------------
begin
-------------------------------------------------
d_out <= salida(conv_integer(dir));
	process(clk)
	begin
		if(rising_edge(clk)) then
			if(WD = '1') then
				salida(conv_integer(dir)) <= d_in;
			end if;
		end if;
	end process;
-----------------------------------------------------
end Behavioral;

