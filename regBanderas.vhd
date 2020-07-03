library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity regBanderas is
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
end regBanderas;

architecture Behavioral of regBanderas is

begin

	registroBanderas : process (CLK, CLR)
	begin
		if (CLR = '1') then
			OV <= '0';
			N <= '0';
			Z <= '0';
			C <= '0';
		elsif (falling_edge(CLK)) then
			if LF = '1' then
				OV <= flags(3);
				N <= flags(2);
				Z <= flags(1);
				C <= flags(0);
			else
				OV <= OV;
				N <= N;
				Z <= Z;
				C <= C;
			end if;
		end if;
	end process registroBanderas;

end Behavioral;
