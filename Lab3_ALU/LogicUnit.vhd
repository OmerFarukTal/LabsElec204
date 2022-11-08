----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:55:39 04/21/2022 
-- Design Name: 
-- Module Name:    LogicUnit - Behavioral 
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

entity LogicUnit is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S0 : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           Z : out  STD_LOGIC);
end LogicUnit;

architecture Behavioral of LogicUnit is
begin
	Z <= ((not S0) and (not S1) and (A and B)) or
			(S0 and (not S1) and (A or B)) or 
			((not S0) and S1 and (A xor B)) or 
			(S1 and S0 and (A xnor B));
end Behavioral;

