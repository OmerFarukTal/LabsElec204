--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:09:33 03/15/2022
-- Design Name:   
-- Module Name:   C:/Users/otal19/Desktop/Lab 2/comparator/Lab2Sim.vhd
-- Project Name:  comparator
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Lab2Code
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
 
ENTITY Lab2Sim IS
END Lab2Sim;
 
ARCHITECTURE behavior OF Lab2Sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Lab2Code
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         E : OUT  std_logic;
         Gab : OUT  std_logic;
         Gba : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal E : std_logic;
   signal Gab : std_logic;
   signal Gba : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Lab2Code PORT MAP (
          A => A,
          B => B,
          E => E,
          Gab => Gab,
          Gba => Gba
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
			A <= "1010" ; B <= "1010";

      wait for Clock_period;
		
		    A <= "1010" ; B <= "1000";

      wait for Clock_period;
		
		    A <= "0010" ; B <= "1000";

      wait for Clock_period;
		
		    A <= "0110" ; B <= "1000";

      wait for Clock_period;
		
		    A <= "0010" ; B <= "0010";

      wait for Clock_period;
		
		    A <= "1110" ; B <= "1000";

      wait for Clock_period;
		
		    A <= "1100" ; B <= "1000";

      wait for Clock_period;
		
			 A <= "1111" ; B <= "1000";

      wait for Clock_period;

      -- insert stimulus here 

      wait;
   end process;

END;
