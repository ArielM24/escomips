library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nivelC is
	port
	(
		CLK							: in std_logic;
		CLR							: in std_logic;

		NA								: out std_logic
	);
end nivelC;

architecture Behavioral of nivelC is

signal PCLK : std_logic;
signal NCLK : std_logic;

begin

	pclkR1 : process (CLK, CLR)
	begin
		if (CLR = '1')	 then
			PCLK <= '0';
		elsif (rising_edge(CLK)) then
			PCLK <= not PCLK;
		end if;
	end process pclkR1;

	nclkR2 : process (CLK, CLR)
	begin
		IF (CLR = '1') then
			NCLK <= '0';
		elsif (falling_edge(CLK)) then
			NCLK <= not NCLK;
		end if;
	end process nclkR2;

	NA <= PCLK xor NCLK;

end Behavioral;