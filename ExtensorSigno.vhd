------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
------------------------------------------------------------
entity ExtensorSigno is
generic
	(N	: integer := 12;
	S: integer := 16
	);
	port
	(entrada: in std_logic_vector(N-1 downto 0);
	salida: out std_logic_vector(S-1 downto 0)
	);
end ExtensorSigno;
------------------------------------------------------------
architecture Behavioral of ExtensorSigno is
signal MSB: std_logic;
-----------------------------------------------------------
begin
-----------------------------------------------------------
MSB <= entrada(N-1);
salida <= MSB&MSB&MSB&MSB&entrada;
---------------------------------------------------------
end Behavioral;

