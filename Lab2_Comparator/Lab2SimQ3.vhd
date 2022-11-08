--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:14:53 03/19/2022
-- Design Name:   
-- Module Name:   C:/Users/otal19/Desktop/Lab 2/comparator/Lab2SimQ3.vhd
-- Project Name:  comparator
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Q3
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
 
ENTITY Lab2SimQ3 IS
END Lab2SimQ3;
 
ARCHITECTURE behavior OF Lab2SimQ3 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Q3
    PORT(
         C : IN  std_logic_vector(3 downto 0);
         D : IN  std_logic_vector(3 downto 0);
         E : OUT  std_logic;
         Gcd : OUT  std_logic;
         Gdc : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal C : std_logic_vector(3 downto 0) := (others => '0');
   signal D : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal E : std_logic;
   signal Gcd : std_logic;
   signal Gdc : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Q3 PORT MAP (
          C => C,
          D => D,
          E => E,
          Gcd => Gcd,
          Gdc => Gdc
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
	
			C <= "1010" ; D <= "1010";

      wait for Clock_period;
		
		    C <= "1010" ; D <= "1000";

      wait for Clock_period;
		
		    C <= "0010" ; D <= "1000";

      wait for Clock_period;
		
		    C <= "0110" ; D <= "1000";

      wait for Clock_period;
		
		    C <= "0010" ; D <= "1010";

      wait for Clock_period;
		
		    C <= "1110" ; D <= "1000";

      wait for Clock_period;
		
		    C <= "0000" ; D <= "1100";

      wait for Clock_period;
		
			 C <= "1111" ; D <= "0000";

      wait for Clock_period;		
	


      -- insert stimulus here 

      wait;
   end process;

END;
