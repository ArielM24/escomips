library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoInst is
	port
	(
		op_code				: in std_logic_vector(4 downto 0);
		TIPOR							: out std_logic;
		BEQI							: out std_logic;
		BNEQI							: out std_logic;
		BLTI							: out std_logic;
		BLETI							: out std_logic;
		BGTI							: out std_logic;
		BGETI							: out std_logic
	);
end decoInst;

architecture Behavioral of decoInst is
begin

	process(op_code)
	begin
		TIPOR	<= '0';
		BEQI	<= '0';
		BNEQI	<= '0';
		BLTI	<= '0';
		BLETI	<= '0';
		BGTI	<= '0';
		BGETI	<= '0';

		case op_code is
			when "00000" => TIPOR	<= '1';
			when "01101" => BEQI		<= '1';
			when "01110" => BNEQI	<= '1';
			when "01111" => BLTI		<= '1';
			when "10000" => BLETI	<= '1';
			when "10001" => BGTI		<= '1';
			when "10010" => BGETI	<= '1';
			when others =>
				TIPOR	<= '0';
				BEQI	<= '0';
				BNEQI	<= '0';
				BLTI	<= '0';
				BLETI	<= '0';
				BGTI	<= '0';
				BGETI	<= '0';
		end case;
	end process;

end Behavioral;
