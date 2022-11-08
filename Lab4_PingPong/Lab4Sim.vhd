--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:27:53 05/26/2022
-- Design Name:   
-- Module Name:   C:/Users/otal19/Desktop/Teq/Lab4/Lab4Sim.vhd
-- Project Name:  Lab4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Lab4Code
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
 
ENTITY Lab4Sim IS
END Lab4Sim;
 
ARCHITECTURE behavior OF Lab4Sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Lab4Code
    PORT(
         Led : OUT  std_logic_vector(5 downto 0);
         Right_Button : IN  std_logic;
         Left_Button : IN  std_logic;
         MCLK : IN  std_logic;
         Right_Score : OUT  std_logic_vector(3 downto 0);
         Left_Score : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Right_Button : std_logic := '0';
   signal Left_Button : std_logic := '0';
   signal MCLK : std_logic := '0';

 	--Outputs
   signal Led : std_logic_vector(5 downto 0);
   signal Right_Score : std_logic_vector(3 downto 0);
   signal Left_Score : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant MCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Lab4Code PORT MAP (
          Led => Led,
          Right_Button => Right_Button,
          Left_Button => Left_Button,
          MCLK => MCLK,
          Right_Score => Right_Score,
          Left_Score => Left_Score
        );

   -- Clock process definitions
   MCLK_process :process
   begin
		MCLK <= '0';
		wait for MCLK_period/2;
		MCLK <= '1';
		wait for MCLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      Right_Button <= '0'; Left_Button <= '0';
		wait for MCLK_period;
		 Right_Button <= '0'; Left_Button <= '1';
		wait for MCLK_period;
		 Right_Button <= '1'; Left_Button <= '0';
		wait for MCLK_period;
		 Right_Button <= '1'; Left_Button <= '1';
		wait for MCLK_period;
		

      -- insert stimulus here 

      wait;
   end process;

END;
