--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:16:22 04/22/2022
-- Design Name:   
-- Module Name:   C:/Users/otal19/Desktop/Elec 204 Lab3/Lab3/FourBitTest.vhd
-- Project Name:  Lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FourBitALU
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
-- Zaten o sarkiyi ben sana yazmadim
-- Farz et ki çok uzaklardaydim. 
 
ENTITY FourBitTest IS
END FourBitTest;
 
ARCHITECTURE behavior OF FourBitTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FourBitALU
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         M : IN  std_logic;
         S0 : IN  std_logic;
         S1 : IN  std_logic;
         C_in : IN  std_logic;
         C_out : OUT  std_logic;
         V : OUT  std_logic;
         F : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal M : std_logic := '0';
   signal S0 : std_logic := '0';
   signal S1 : std_logic := '0';
   signal C_in : std_logic := '0';

 	--Outputs
   signal C_out : std_logic;
   signal V : std_logic;
   signal F : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FourBitALU PORT MAP (
          A => A,
          B => B,
          M => M,
          S0 => S0,
          S1 => S1,
          C_in => C_in,
          C_out => C_out,
          V => V,
          F => F
        );
	
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
			A <= "0011";
			B <= "0101";
			M <= '1';
			S0 <= '0';
			S1 <= '1';
			C_in <= '1';
      wait for Clock_period*10;
			A <= "0000";
			B <= "0001";
			M <= '1';
			S0 <= '0';
			S1 <= '1';
			C_in <= '1';
      wait for Clock_period*10;
			A <= "0111";
			B <= "0100";
			M <= '1';
			S0 <= '1';
			S1 <= '0';
			C_in <= '0';
      wait for Clock_period*10;
			A <= "0001";
			B <= "1111";
			M <= '1';
			S0 <= '1'; 
			S1 <= '0';
			C_in <= '1';
      wait for Clock_period*10;
			A <= "0011";
			B <= "0101";
			M <= '0';
			S0 <= '0';
			S1 <= '1';
			C_in <= '1';
      wait for Clock_period*10;
			A <= "0011";
			B <= "0101";
			M <= '0';
			S0 <= '0';
			S1 <= '0';
			C_in <= '1';
      wait for Clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
