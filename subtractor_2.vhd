library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- subtroctor for 2bit
entity subtractor_2 is
    Port ( n1, n2 : in  STD_LOGIC_VECTOR (1 downto 0);
           b : in  STD_LOGIC;
           d : out  STD_LOGIC_VECTOR (1 downto 0);
           b_out : out  STD_LOGIC);
end subtractor_2;

architecture Behavioral of subtractor_2 is
	COMPONENT full_subtractor
	PORT(
		n1 : IN std_logic;
		n2 : IN std_logic;
		b : IN std_logic;          
		d : OUT std_logic;
		b_out : OUT std_logic
		);
	END COMPONENT;
	
	signal t_d1: std_logic;
	signal t_b1: std_logic;
	signal t_d2: std_logic;
	signal t_b2: std_logic;
	
begin

	subtractor_1: full_subtractor PORT MAP(
		n1 => n1(0),
		n2 => n2(0),
		b => b,
		d => t_d1,
		b_out => t_b1
	);
	subtractor_2: full_subtractor PORT MAP(
		n1 => n1(1),
		n2 => n2(1),
		b => t_b1,
		d => t_d2,
		b_out => t_b2
	);

	d <= t_d2 & t_d1;
	b_out <= t_b2;

end Behavioral;
