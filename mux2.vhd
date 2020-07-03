library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2 is
	port
	(
		microCodFun					: in std_logic_vector (19 downto 0);
		microCodOpe					: in std_logic_vector (19 downto 0);
		SM								: in std_logic;
		microInstruccion			: out std_logic_vector (19 downto 0)
	);
end mux2;

architecture Behavioral of mux2 is

begin
	microInstruccion <= microCodFun when SM = '0' else microCodOpe;
end Behavioral;
