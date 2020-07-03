----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
------------------------------------------------------------
entity ExtensorDireccion is
generic
	(N: integer := 12;
	S: integer := 16
	);
	port
	(entrada: in std_logic_vector(N-1 downto 0);
	salida: out std_logic_vector(S-1 downto 0)
	);
end ExtensorDireccion;
------------------------------------------------------------
architecture Behavioral of ExtensorDireccion is
signal MSB: std_logic_vector (3 downto 0);

------------------------------------------------------------
begin
------------------------------------------------------------
MSB <= "0000";
	salida <= MSB&entrada;
	--------------------------------------------------
end Behavioral;

