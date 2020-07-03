library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity DivisorFrecuencia is
    Port ( clk100, clr: in  STD_LOGIC;
           clk: out  STD_LOGIC);
end DivisorFrecuencia;

architecture Behavioral of DivisorFrecuencia is
begin

	process(clk100, clr)
		variable contador: std_logic_vector(26 downto 0) := (others => '0');
	begin
		if clr = '1' then
			contador := (others => '0');
		elsif rising_edge(clk100) then
			contador := contador + 1;
		end if;
		
		clk <= contador(0);
		
	end process;

end Behavioral;

