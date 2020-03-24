
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier_4 is
    Port ( n1, n2 : in  STD_LOGIC_VECTOR (3 downto 0);
           result : out  STD_LOGIC_VECTOR (7 downto 0));
end multiplier_4;

architecture Behavioral of multiplier_4 is
	COMPONENT fulladder_4
	PORT(
		n1 : IN std_logic_vector(3 downto 0);
		n2 : IN std_logic_vector(3 downto 0);          
		result : OUT std_logic_vector(4 downto 0)
		);
	END COMPONENT;
	
	signal tmp1 : std_logic_vector(3 downto 0);
	signal tmp2 : std_logic_vector(3 downto 0);
	signal tmp3 : std_logic_vector(3 downto 0);
	signal tmp4 : std_logic_vector(3 downto 0);
	signal tmp_added_1_2 : std_logic_vector(4 downto 0);
	signal tmp_added_1_2_3 : std_logic_vector(4 downto 0);
	signal tmp_added_1_2_3_4 : std_logic_vector(4 downto 0);

begin

	process(n2(0), n1)
	begin
		if (n2(0) = '1') then
			result(0) <= n1(0);
			tmp1 <= '0' & n1(3 downto 1);
		else
			result(0) <= '0';
			tmp1 <= "0000";
		end if;
	end process;

	process(n1, n2)
	begin
		if (n2(1) = '1') then
			tmp2 <= n1;
		else
			tmp2 <= "0000";
		end if;
	end process;
	
	adder_1: fulladder_4 PORT MAP(
		n1 => tmp1,
		n2 => tmp2,
		result => tmp_added_1_2
	);
	
	result(1) <= tmp_added_1_2(0);
	
	process(n1, n2)
	begin
		if (n2(2) = '1') then
			tmp3 <= n1;
		else
			tmp3 <= "0000";
		end if;
	end process;
	
	adder_2: fulladder_4 PORT MAP(
		n1 => tmp_added_1_2(4 downto 1),
		n2 => tmp3,
		result => tmp_added_1_2_3
	);
	
	result(2) <= tmp_added_1_2_3(0);
	
	process(n1, n2)
	begin
		if (n2(3) = '1') then
			tmp4 <= n1;
		else
			tmp4 <= "0000";
		end if;
	end process;
	
	adder_3: fulladder_4 PORT MAP(
		n1 => tmp_added_1_2_3(4 downto 1),
		n2 => tmp4,
		result => tmp_added_1_2_3_4
	);
	
	result(7 downto 3) <= tmp_added_1_2_3_4;
	
end Behavioral;

