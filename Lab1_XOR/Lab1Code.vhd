----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:20:54 03/08/2022 
-- Design Name: 
-- Module Name:    Lab1Code - Behavioral 
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

entity Lab1Code is
    Port ( X : in  STD_LOGIC;
           Y : in  STD_LOGIC;
           Z : out  STD_LOGIC);
end Lab1Code;	

architecture Behavioral of Lab1Code is

	signal NX : STD_LOGIC;
	signal NY : STD_LOGIC;
	signal yAndNX : STD_LOGIC;
	signal xAndNY : STD_LOGIC;


begin
	NX <= not X;
	NY <= not Y;
	yAndNX <= Y and NX;
	xAndNY <= X and NY;
	Z <= xAndNY or yAndNX;
end Behavioral;

