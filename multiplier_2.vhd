library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier_2 is
    Port ( n1, n2 : in  STD_LOGIC_VECTOR (1 downto 0);
           result : out  STD_LOGIC_VECTOR (3 downto 0));
end multiplier_2;

architecture Behavioral of multiplier_2 is

	COMPONENT fulladder_3
	PORT(
		n1 : IN std_logic_vector(2 downto 0);
		n2 : IN std_logic_vector(2 downto 0);          
		result : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	signal tmp1: STD_LOGIC_VECTOR (2 downto 0);
	signal tmp2: STD_LOGIC_VECTOR (2 downto 0);
	signal zero: STD_LOGIC_VECTOR (2 downto 0) := "000";

begin

	process(n2(0))
	begin
		if (n2(0) = '1') then
			tmp1 <= "0" & n1;
		else
			tmp1 <= zero;
		end if;
	end process;

	process(n2(1))
	begin
		if (n2(1) = '1') then
			tmp2(2) <= n1(1);
			tmp2(1) <= n1(0);
			tmp2(0) <= '0';
		else
			tmp2 <= zero;
		end if;
	end process;

	Inst_fulladder_3: fulladder_3 PORT MAP(
		n1 => tmp1,
		n2 => tmp2,
		result => result
	);

end Behavioral;

