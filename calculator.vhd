
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity calculator is
    Port ( n1 : in  STD_LOGIC_VECTOR(3 downto 0);
           n2 : in  STD_LOGIC_VECTOR(3 downto 0);
			  ope : in  STD_LOGIC_VECTOR(1 downto 0);
           result : out  STD_LOGIC_VECTOR(7 downto 0)
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
	
	COMPONENT multiplier_4
	PORT(
		n1 : IN std_logic_vector(3 downto 0);
		n2 : IN std_logic_vector(3 downto 0);          
		result : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT subtractor_4
	PORT(
		n1 : IN std_logic_vector(3 downto 0);
		n2 : IN std_logic_vector(3 downto 0);
		b : IN std_logic;          
		d : OUT std_logic_vector(3 downto 0);
		b_out : OUT std_logic
		);
	END COMPONENT;

	signal t_result_add : std_logic_vector(4 downto 0);
	signal t_result_sub : std_logic_vector(4 downto 0);
	signal t_result_multi : std_logic_vector(7 downto 0);
	
begin
	
	-- add
	adder_4: fulladder_4 PORT MAP(
		n1 => n1,
		n2 => n2,
		result => t_result_add
	);
	-- subtract
	Inst_subtractor_4: subtractor_4 PORT MAP(
		n1 => n1,
		n2 => n2,
		b => '0',
		d => t_result_sub(3 downto 0),
		b_out => t_result_sub(4)
	);
	-- multiple
	multiplier: multiplier_4 PORT MAP(
		n1 => n1,
		n2 => n2,
		result => t_result_multi
	);
	-- with operator ?
	process(ope, t_result_add, t_result_multi, t_result_sub)
	begin
		if (ope = "00") then
			result <= "000" & t_result_add;
		elsif (ope = "01") then
			result <= "000" & t_result_sub;
		else 
			result <= t_result_multi;
		end if;
	end process;

end Behavioral;

