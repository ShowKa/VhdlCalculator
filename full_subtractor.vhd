library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_subtractor is
    Port ( n1, n2 : in  STD_LOGIC;
           b : in  STD_LOGIC;
           d, b_out : out  STD_LOGIC);
end full_subtractor;

architecture Behavioral of full_subtractor is
	COMPONENT half_subtractor
	PORT(
		n1 : IN std_logic;
		n2 : IN std_logic;          
		d : OUT std_logic;
		b : OUT std_logic
		);
	END COMPONENT;

	signal t_d: std_logic;
	signal t_b1: std_logic;
	signal t_b2: std_logic;
	
begin

	half_1: half_subtractor PORT MAP(
		n1 => n1,
		n2 => n2,
		d => t_d,
		b => t_b1
	);
	
	half_2: half_subtractor PORT MAP(
		n1 => t_d,
		n2 => b,
		d => d,
		b => t_b2 
	);
	
	b_out <= t_b1 or t_b2;

end Behavioral;

