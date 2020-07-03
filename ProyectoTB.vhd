--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:55:44 11/24/2019
-- Design Name:   
-- Module Name:   C:/Users/reyja/Downloads/ProyectoESCOMipsPV/ProyectoTB.vhd
-- Project Name:  ProyectoESCOMipsPV
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Proyecto
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ProyectoTB IS
END ProyectoTB;
 
ARCHITECTURE behavior OF ProyectoTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Proyecto
    PORT(
         CLR : IN  std_logic;
         CLK : IN  std_logic;
         salida : OUT  std_logic_vector(7 downto 0);
         PC : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLR : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal salida : std_logic_vector(7 downto 0);
   signal PC : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Proyecto PORT MAP (
          CLR => CLR,
          CLK => CLK,
          salida => salida,
          PC => PC
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
		clr<='1';
		wait for 12ns;
--		wait until falling_edge(clk);
--		wait until falling_edge(clk);
		clr<='0';

      wait;
   end process;

END;
