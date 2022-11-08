----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:13:21 04/21/2022 
-- Design Name: 
-- Module Name:    ArithmeticUnit - Behavioral 
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

entity ArithmeticUnit is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S0 : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           C_in : in  STD_LOGIC;
           C_out : out  STD_LOGIC;
           Z : out  STD_LOGIC);
end ArithmeticUnit;

architecture Behavioral of ArithmeticUnit is
	component FullAdder
	port(
	A, B , C_in : in STD_LOGIC;
	C_out , Z: out STD_LOGIC);
	end component;
	signal A_star, B_star : STD_LOGIC;
begin
	
	A_star <= A xor (S1 and S0);
	B_star <= (S1 or S0) and (B xor (S1 and (not S0)));
	
	T1 : FullAdder port map (A_star, B_star, C_in, C_out, Z);


end Behavioral;

