----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:08:10 03/17/2020 
-- Design Name: 
-- Module Name:    dec7seg - Behavioral 
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

entity dec7seg is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out  STD_LOGIC_VECTOR (7 downto 0));
end dec7seg;

architecture Behavioral of dec7seg is

begin
	process (A)
	begin
		case A is

			when "0000" => Y <= "11000000";
			when "0001" => Y <= "11111001";
			when "0010" => Y <= "10100100";
			when "0011" => Y <= "10110000";
			when "0100" => Y <= "10011001";
			
			when "0101" => Y <= "10010010";
			when "0110" => Y <= "10000010";
			when "0111" => Y <= "11011000";
			when "1000" => Y <= "10000000";
			when "1001" => Y <= "10010000";
		
			when others => Y <= "--------";
		end case;
	end process;

end Behavioral;

