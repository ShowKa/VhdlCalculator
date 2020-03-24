
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity calculator is
    Port ( n1 : in  STD_LOGIC_VECTOR(3 downto 0);
           n2 : in  STD_LOGIC_VECTOR(3 downto 0);
			  ope : in  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR(5 downto 0)
			  );
end calculator;

architecture Behavioral of calculator is

	COMPONENT fulladder_4
	PORT(
		n1 : IN std_logic_vector(3 downto 0);
		n2 : IN std_logic_vector(3 downto 0);          
		result : OUT std_logic_vector(4 downto 0)
		);
	END COMPONENT;
	
	COMPONENT multiplier_3
	PORT(
		n1 : IN std_logic_vector(2 downto 0);
		n2 : IN std_logic_vector(2 downto 0);          
		result : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	signal t_result_add : std_logic_vector(4 downto 0);
	signal t_result_multi : std_logic_vector(5 downto 0);

begin
	
	-- add
	Inst_fulladder_4: fulladder_4 PORT MAP(
		n1 => n1,
		n2 => n2,
		result => t_result_add
	);
	-- multiple
	Inst_multiplier_3: multiplier_3 PORT MAP(
		n1 => n1(2 downto 0),
		n2 => n2(2 downto 0),
		result => t_result_multi
	);
	-- with operator ?
	process(ope, t_result_add, t_result_multi)
	begin
		if (ope = '0') then
			result <= '0' & t_result_add;
		else 
			result <= t_result_multi;
		end if;
	end process;

end Behavioral;

