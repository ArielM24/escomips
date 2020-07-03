----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
---------------------------------------------------
entity ALU is
	generic
		(
			N: integer := 16
		);
	Port
		(
			a: in  STD_LOGIC_VECTOR (N-1 downto 0);
			b: in  STD_LOGIC_VECTOR (N-1 downto 0);
			aluop: in  STD_LOGIC_VECTOR (3 downto 0);
			result: out  STD_LOGIC_VECTOR (N-1 downto 0);
			flags: out  STD_LOGIC_VECTOR (3 downto 0)
		);
end ALU;
---------------------------------------------------
architecture operaciones of ALU is

signal Asel: STD_LOGIC;
signal Bsel: STD_LOGIC;
signal Aaux, Baux: STD_LOGIC_VECTOR (N-1 downto 0);
signal AndOP, OrOP, XorOP, SumOP	: STD_LOGIC_VECTOR (N-1 downto 0);
signal res: STD_LOGIC_VECTOR (N-1 downto 0);
signal c	: STD_LOGIC_VECTOR (N downto 0);
constant zeros: std_logic_vector (N - 1 downto 0) := (others => '0');
---------------------------------------------------
begin
---------------------------------------------------
c(0) <= Bsel;

	Asel <= aluop(3);
	Bsel <= aluop(2);

	alu: for i in 0 to N-1 generate
		Aaux(i) <= a(i) xor Asel;
		Baux(i) <= b(i) xor Bsel;

		AndOP(i) <= Aaux(i) and Baux(i);
		OrOP(i) <= Aaux(i) or Baux(i);
		XorOP(i) <= Aaux(i) xor Baux(i);

		SumOP(i) <= Aaux(i) xor Baux(i) xor c(i);
		c(i+1) <= (Baux(i) and c(i)) or (Aaux(i) and c(i)) or (Aaux(i) and Baux(i));

		res(i) <= AndOP(i) when aluop(1 downto 0) = "00" else
	  OrOP(i)  when aluop(1 downto 0) = "01" else
		XorOP(i) when aluop(1 downto 0) = "10" else
		SumOP(i);
	end generate;

	flags(3) <= c(N) xor c(N-1) when aluop(1 downto 0) = "11" else '0';
	flags(2) <= res(N-1);
	flags(1) <= '1' when res = zeros else '0';
	flags(0) <= c(N) when aluop(1 downto 0) = "11" else '0';

	result <= res;
----------------------------------------------------
end operaciones;

