library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier_3 is
    Port ( n1, n2 : in  STD_LOGIC_VECTOR (2 downto 0);
           result : out  STD_LOGIC_VECTOR (5 downto 0));
end multiplier_3;

architecture Behavioral of multiplier_3 is

	signal tmp1: STD_LOGIC_VECTOR (4 downto 0);
	signal tmp2: STD_LOGIC_VECTOR (4 downto 0);
	signal tmp3: STD_LOGIC_VECTOR (4 downto 0);
	signal zero: STD_LOGIC_VECTOR (4 downto 0) := "00000";

begin

	process(n2(0))
	begin
		if (n2(0) = '1') then
			tmp1 <= "00" & n1;
		else
			tmp1 <= zero;
		end if;
	end process;
	
	process(n2(1))
	begin
		if (n2(1) = '1') then
			tmp2 <= '0' & n1 & '0';
		else
			tmp2 <= zero;
		end if;
	end process;

	process(n2(2))
	begin
		if (n2(2) = '1') then
			tmp3 <= n1 & "00";
		else
			tmp3 <= zero;
		end if;
	end process;

end Behavioral;

