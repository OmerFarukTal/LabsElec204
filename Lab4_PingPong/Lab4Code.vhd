----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    15:31:00 05/26/2022
-- Design Name:
-- Module Name:    Lab4Code - Behavioral
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Lab4Code is
    Port ( Led : out  STD_LOGIC_vector (5 downto 0);
           Right_Button : in  STD_LOGIC;
           Left_Button : in  STD_LOGIC;
           MCLK : in  STD_LOGIC;
           Right_Score : out  STD_LOGIC_vector (3 downto 0);
           Left_Score : out  STD_LOGIC_vector (3 downto 0));
end Lab4Code;

architecture Behavioral of Lab4Code is

signal l_score : std_logic_vector (3 downto 0) := "0000";
signal r_score : std_logic_vector (3 downto 0) := "0000";
signal leds : std_logic_vector (5 downto 0) := "100000";
signal direction : std_logic := '1';
signal counter : std_logic_vector (4 downto 0) := "00000";

begin

 process(MCLK, Right_Button, Left_Button)
begin
if rising_edge(MCLK) then
	if (counter<"00101") then
		counter <= counter + 1;
	else
	counter <= "00000";
			leds(5) <= (not direction) and leds(4);

			leds(4) <= (direction and leds(5)) or ((not direction) and leds(3));
			leds(3) <= (direction and leds(4)) or ((not direction) and leds(2));
			leds(2) <= (direction and leds(3)) or ((not direction) and leds(1));
			leds(1) <= (direction and leds(2)) or ((not direction) and leds(0));

			leds(0) <= direction and leds(1);

			direction <= (direction and (leds(5) or leds(4) or leds(3) or leds(2))) or ((not direction) and leds(4));

			if (Left_Button='1') then
				if (leds="100000") then
					l_score <= l_score + 1;
				end if;
			end if;

			if (Right_Button='1') then
				if (leds="000001") then
					r_score <= r_score + 1;
				end if;
			end if;
	end if;
end if;
 end process;




Led<=leds;
Left_Score<=l_score;
Right_Score<=r_score;

end Behavioral;
