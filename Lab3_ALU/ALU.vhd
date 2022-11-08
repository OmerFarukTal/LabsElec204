----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:32:19 04/21/2022 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           M : in  STD_LOGIC;
           S0 : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           C_in : in  STD_LOGIC;
           C_out : out  STD_LOGIC;
           Z : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is
	component ArithmeticUnit
	Port ( A,B, S0, S1, C_in : in  STD_LOGIC;
           C_out, Z : out  STD_LOGIC);
	end component;
	
	component LogicUnit
	Port ( A,B, S0, S1 : in  STD_LOGIC;
           Z : out  STD_LOGIC);
	end component;
	
	signal AU, LU : STD_LOGIC;
	
begin
	
	G1 : ArithmeticUnit port map (A ,B , S0, S1, C_in, C_out, AU);
	G2 : LogicUnit port map (A, B, S0, S1, LU);
	
	Z <= ((not M) and LU) or (M and AU);

end Behavioral;

