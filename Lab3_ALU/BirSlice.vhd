--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:50:28 04/21/2022
-- Design Name:   
-- Module Name:   C:/Users/otal19/Desktop/Elec 204 Lab3/Lab3/BirSlice.vhd
-- Project Name:  Lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY BirSlice IS
END BirSlice;
 
ARCHITECTURE behavior OF BirSlice IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         M : IN  std_logic;
         S0 : IN  std_logic;
         S1 : IN  std_logic;
         C_in : IN  std_logic;
         C_out : OUT  std_logic;
         Z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal M : std_logic := '0';
   signal S0 : std_logic := '0';
   signal S1 : std_logic := '0';
   signal C_in : std_logic := '0';

 	--Outputs
   signal C_out : std_logic;
   signal Z : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          M => M,
          S0 => S0,
          S1 => S1,
          C_in => C_in,
          C_out => C_out,
          Z => Z
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.	
			A <= '0';
			B <= '0';
			M <= '0';
			S0 <= '1';
			S1 <= '1';
			C_in <= '0';
      wait for Clock_period*10;
			A <= '0';
			B <= '1';
			M <= '0';
			S0 <= '1';
			S1 <= '1';
			C_in <= '0';
      wait for Clock_period*10;
			A <= '1';
			B <= '0';
			M <= '0';
			S0 <= '1';
			S1 <= '1';
			C_in <= '0';
      wait for Clock_period*10;
			A <= '1';
			B <= '1';
			M <= '0';
			S0 <= '1';
			S1 <= '1';
			C_in <= '0';
      wait for Clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
