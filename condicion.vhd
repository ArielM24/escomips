library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity condicion is
	port
	(
		OV								: in std_logic;
		N								: in std_logic;
		Z								: in std_logic;
		C								: in std_logic;
		EQ								: out std_logic;
		NEQ							: out std_logic;
		LT								: out std_logic;
		LE								: out std_logic;
		GT								: out std_logic;
		GET							: out std_logic
	);
end condicion;

architecture Behavioral of condicion is

begin
		EQ <= Z;
		NEQ <= (not Z);
		LT <= (not C);
		LE <= (Z or (not C));
		GT <= (C and (not Z));
		GET <= C;
end Behavioral;
