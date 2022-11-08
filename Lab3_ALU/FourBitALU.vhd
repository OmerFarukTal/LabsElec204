----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:39:18 04/22/2022 
-- Design Name: 
-- Module Name:    FourBitALU - Behavioral 
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

entity FourBitALU is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
           M : in  STD_LOGIC;
           S0 : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           C_in : in  STD_LOGIC;
           C_out : out  STD_LOGIC;
           V : out  STD_LOGIC;
           F : out  STD_LOGIC_VECTOR(3 downto 0));
end FourBitALU;

architecture Behavioral of FourBitALU is
component ALU
	Port ( A, B, M, S0, S1, C_in : in  STD_LOGIC;
           C_out, Z : out  STD_LOGIC);
end component;

	signal C_out_0, C_out_1, C_out_2, C_out_3 : STD_LOGIC;
	signal F_0, F_1, F_2, F_3 : STD_LOGIC; 
begin
	K1: ALU port map (A(0), B(0), M, S0, S1, C_in   , C_out_0, F_0);
	K2: ALU port map (A(1), B(1), M, S0, S1, C_out_0, C_out_1, F_1);
	K3: ALU port map (A(2), B(2), M, S0, S1, C_out_1, C_out_2, F_2);
	K4: ALU port map (A(3), B(3), M, S0, S1, C_out_2, C_out_3, F_3);
	
	V <= C_out_3 xor C_out_2;
	C_out <= C_out_3;
	F(3) <= F_3; F(2) <= F_2; F(1) <= F_1; F(0) <= F_0; 
end Behavioral;

