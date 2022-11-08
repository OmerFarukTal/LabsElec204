----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Ömer Fauk TAL
-- 
-- Create Date:    14:45:36 03/15/2022 
-- Design Name: 
-- Module Name:    Lab2Code - Behavioral 
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

entity Lab2Code is
    Port ( A : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           B : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           E : out  STD_LOGIC;
           Gab : out  STD_LOGIC;
           Gba : out  STD_LOGIC);
end Lab2Code;

architecture Behavioral of Lab2Code is
	signal ind3,ind2,ind1,ind0 : STD_LOGIC;
	signal ab3,ab2,ab1,ab0 : STD_LOGIC;
	signal ba3,ba2,ba1,ba0 : STD_LOGIC;
begin
	ind3 <= A(3) xnor B(3);
	ind2 <= A(2) xnor B(2);
	ind1 <= A(1) xnor B(1);
	ind0 <= A(0) xnor B(0);
	E <= ind3 and ind2 and ind1 and ind0;
	ab3 <= (not B(3)) and A(3);
	ab2 <= (not B(2)) and A(2);
	ab1 <= (not B(1)) and A(1);
	ab0 <= (not B(0)) and A(0);
	Gab <= ((ab3) or (ind3 and ab2) or (ind3 and ind2 and ab1) or (ind3 and ind2 and ind1 and ab0));
	
	ba3 <= (not A(3)) and B(3);
	ba2 <= (not A(2)) and B(2);
	ba1 <= (not A(1)) and B(1);
	ba0 <= (not A(0)) and B(0);
	
	Gba <= ((ba3) or (ind3 and ba2) or (ind3 and ind2 and ba1) or (ind3 and ind2 and ind1 and ba0));
end Behavioral;

