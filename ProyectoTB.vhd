--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:18:09 07/02/2020
-- Design Name:   
-- Module Name:   C:/Users/DANIEL/Desktop/Ilusion/ilusion/ProyectoTB.vhd
-- Project Name:  ilusion
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ProyectoESCOMipsPV
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
 
    COMPONENT ProyectoESCOMipsPV
    PORT(
         RCLR : IN  std_logic;
         RCLK : IN  std_logic;
         salida : OUT  std_logic_vector(7 downto 0);
         contProg : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RCLR : std_logic := '0';
   signal RCLK : std_logic := '0';

  --Outputs
   signal salida : std_logic_vector(7 downto 0);
   signal contProg : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant RCLK_period : time := 10 ns;
 
BEGIN
 
  -- Instantiate the Unit Under Test (UUT)
   uut: ProyectoESCOMipsPV PORT MAP (
          RCLR => RCLR,
          RCLK => RCLK,
          salida => salida,
          contProg => contProg
        );

   -- Clock process definitions
   RCLK_process :process
   begin
    RCLK <= '0';
    wait for RCLK_period/2;
    RCLK <= '1';
    wait for RCLK_period/2;
   end process;
 


   -- Stimulus process
   stim_proc: process
   begin
    RCLR<='1';
    wait for 12ns;
--    wait until falling_edge(clk);
--    wait until falling_edge(clk);
    RCLR<='0';

      wait;
   end process;
END;
