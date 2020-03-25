library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- subtractor 4bit
entity subtractor_4 is
    Port ( n1, n2 : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC;
           d : out  STD_LOGIC_VECTOR (3 downto 0);
           b_out : out  STD_LOGIC);
end subtractor_4;

architecture Behavioral of subtractor_4 is
	COMPONENT subtractor_3
	PORT(
		n1 : IN std_logic_vector(2 downto 0);
		n2 : IN std_logic_vector(2 downto 0);
		b : IN std_logic;          
		d : OUT std_logic_vector(2 downto 0);
		b_out : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT full_subtractor
	PORT(
		n1 : IN std_logic;
		n2 : IN std_logic;
		b : IN std_logic;          
		d : OUT std_logic;
		b_out : OUT std_logic
		);
	END COMPONENT;

	signal t_d1: std_logic_vector(2 downto 0);
	signal t_b1: std_logic;
	signal t_d2: std_logic;
	signal t_b2: std_logic;
	
begin
	Inst_subtractor_3: subtractor_3 PORT MAP(
		n1 => n1(2 downto 0),
		n2 => n2(2 downto 0),
		b => b,
		d => t_d1,
		b_out => t_b1
	);
	Inst_full_subtractor: full_subtractor PORT MAP(
		n1 => n1(3),
		n2 => n2(3),
		b => t_b1,
		d => t_d2,
		b_out =>  t_b2
	);

	d <= t_d2 & t_d1;
	b_out <= t_b2;
	
end Behavioral;

