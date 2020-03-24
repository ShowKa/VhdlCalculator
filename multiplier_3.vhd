library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier_3 is
    Port ( n1, n2 : in  STD_LOGIC_VECTOR (2 downto 0);
           result : out  STD_LOGIC_VECTOR (5 downto 0));
end multiplier_3;

architecture Behavioral of multiplier_3 is

	COMPONENT fulladder_3
	PORT(
		n1 : IN std_logic_vector(2 downto 0);
		n2 : IN std_logic_vector(2 downto 0);          
		result : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	signal tmp1: STD_LOGIC_VECTOR (2 downto 0);
	signal tmp2: STD_LOGIC_VECTOR (2 downto 0);
	signal tmp3: STD_LOGIC_VECTOR (2 downto 0);
	
	signal tmp1_up: STD_LOGIC_VECTOR (2 downto 0);
	
	signal tmp_added_1: STD_LOGIC_VECTOR (3 downto 0);
	signal tmp_added_2: STD_LOGIC_VECTOR (3 downto 0);

begin

	process(n2(0), n1)
	begin
		if (n2(0) = '1') then
			tmp1 <= n1;
		else
			tmp1 <= "000";
		end if;
	end process;

	result(0) <= tmp1(0);
	
	process(n2(1), n1)
	begin
		if (n2(1) = '1') then
			tmp2 <= n1;
		else
			tmp2 <= "000";
		end if;
	end process;
	
	tmp1_up <= '0' & tmp1(2 downto 1);

	adder_1: fulladder_3 PORT MAP(
		n1 => tmp1_up,
		n2 => tmp2,
		result => tmp_added_1
	);
	
	result(1) <= tmp_added_1(0);

	process(n2(2), n1)
	begin
		if (n2(2) = '1') then
			tmp3 <= n1;
		else
			tmp3 <= "000";
		end if;
	end process;

	adder_2: fulladder_3 PORT MAP(
		n1 => tmp_added_1(3 downto 1),
		n2 => tmp3,
		result => tmp_added_2
	);
	
	result(5 downto 2) <= tmp_added_2;

end Behavioral;

