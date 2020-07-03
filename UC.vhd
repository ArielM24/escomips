library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity UC is
	port
	(
		TIPOR							: in std_logic;
		BEQI							: in std_logic;
		BNEQI							: in std_logic;
		BLTI							: in std_logic;
		BLETI							: in std_logic;
		BGTI							: in std_logic;
		BGETI							: in std_logic;
		NA								: in std_logic;
		EQ								: in std_logic;
		NEQ							: in std_logic;
		LT								: in std_logic;
		LE								: in std_logic;
		GT								: in std_logic;
		GET							: in std_logic;
		CLK							: in std_logic;
		CLR							: in std_logic;
		SDOPC							: out std_logic;
		SM								: out std_logic
	);
end UC;

architecture Behavioral of UC is

type ESTADOS is (A);
signal EDOA, EDOS : ESTADOS;

begin
	process(CLK, CLR)
	begin
		if (CLR = '1') then
			EDOA <= A;
		elsif (rising_edge(CLK)) then
			EDOA <= EDOS;
		end if;
	end process;

	process (EDOA, TIPOR, BEQI, BNEQI, BLTI, BLETI, BGTI, BGETI, NA, EQ, NEQ, LT, LE, GT, GET)
	begin
		SDOPC		<= '0';
		SM			<= '0';

		case EDOA is
			when A =>
				if TIPOR = '1' then
					SM		<= '0';
					EDOS	<= A;
				elsif BEQI = '1' then
					if NA = '1' then
						SDOPC <= '0';
						SM <= '1';
						EDOS <= A;
					else
						if EQ = '1' then
							SDOPC <= '1';
							SM <='1';
							EDOS <= A;
						else
							SDOPC <= '0';
							SM <= '1';
							EDOS <= A;
						end if;
					end if;
				elsif BNEQI = '1' then
					if NA = '1' then
						SDOPC <= '0';
						SM <= '1';
						EDOS <= A;
					else
						if NEQ = '1' then
							SDOPC <= '1';
							SM <='1';
							EDOS <= A;
						else
							SDOPC <= '0';
							SM <= '1';
							EDOS <= A;
						end if;
					end if;
				elsif BLTI = '1' then
					if NA = '1' then
						SDOPC <= '0';
						SM <= '1';
						EDOS <= A;
					else
						if LT = '1' then
							SDOPC <= '1';
							SM <='1';
							EDOS <= A;
						else
							SDOPC <= '0';
							SM <= '1';
							EDOS <= A;
						end if;
					end if;
				elsif BLETI = '1' then
					if NA = '1' then
						SDOPC <= '0';
						SM <= '1';
						EDOS <= A;
					else
						if LE = '1' then
							SDOPC <= '1';
							SM <='1';
							EDOS <= A;
						else
							SDOPC <= '0';
							SM <= '1';
							EDOS <= A;
						end if;
					end if;
				elsif BGTI = '1' then
					if NA = '1' then
						SDOPC <= '0';
						SM <= '1';
						EDOS <= A;
					else
						if GT = '1' then
							SDOPC <= '1';
							SM <='1';
							EDOS <= A;
						else
							SDOPC <= '0';
							SM <= '1';
							EDOS <= A;
						end if;
					end if;
				elsif BGETI = '1' then
					if NA = '1' then
						SDOPC <= '0';
						SM <= '1';
						EDOS <= A;
					else
						if GET = '1' then	
							SDOPC <= '1';
							SM <='1';
							EDOS <= A;
						else
							SDOPC <= '0';
							SM <= '1';
							EDOS <= A;
						end if;
					end if;
				else
					SDOPC <= '1';
					SM <= '1';
					EDOS <= A;
				end if;
		end case;
	end process;

end Behavioral;
