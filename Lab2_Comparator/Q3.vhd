----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:58:33 03/18/2022 
-- Design Name: 
-- Module Name:    Q3 - Behavioral 
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

entity Q3 is
    Port ( C : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           D : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           E : out  STD_LOGIC;
           Gcd : out  STD_LOGIC;
           Gdc : out  STD_LOGIC);
end Q3;

architecture Behavioral of Q3 is
	signal ind3,ind2,ind1,ind0 : STD_LOGIC;
	signal cd3,cd2,cd1,cd0 : STD_LOGIC;
	signal dc3,dc2,dc1,dc0 : STD_LOGIC;
	signal isCPos,isDPos : STD_LOGIC;
begin
	ind3 <= C(3) xnor D(3);
	ind2 <= C(2) xnor D(2);
	ind1 <= C(1) xnor D(1);
	ind0 <= C(0) xnor D(0);
	
	E <= ind3 and ind2 and ind1 and ind0;
	
	cd3 <= (not D(3)) and C(3);
	cd2 <= (not D(2)) and C(2);
	cd1 <= (not D(1)) and C(1);
	cd0 <= (not D(0)) and C(0);

	dc3 <= (not C(3)) and D(3);
	dc2 <= (not C(2)) and D(2);
	dc1 <= (not C(1)) and D(1);
	dc0 <= (not C(0)) and D(0);
	
	isCPos <= not C(3);
	isDPos <= not D(3);

	Gcd <= (isCPos and (not isDPos)) or ((ind3) and (cd2 or (ind2 and cd1) or (ind2 and ind1 and cd0)));
	Gdc <= (isDPos and (not isCPos)) or ((ind3) and (dc2 or (ind2 and dc1) or (ind2 and ind1 and dc0)));

end Behavioral;

