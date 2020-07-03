library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux1 is
	port
	(
		zeros							: in std_logic_vector (4 downto 0);
		operationCode			: in std_logic_vector (4 downto 0);
		SDOPC							: in std_logic;
		selOPC						: out std_logic_vector (4 downto 0)
	);
end mux1;

architecture Behavioral of mux1 is

begin

	selOPC <= zeros when SDOPC = '0' else operationCode;

end Behavioral;
