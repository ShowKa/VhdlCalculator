library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity devider_4 is
    Port ( n1, n2 : in  STD_LOGIC_VECTOR (3 downto 0);
           q, r : out  STD_LOGIC_VECTOR (3 downto 0));
end devider_4;

architecture Behavioral of devider_4 is

	COMPONENT subtractor_4
	PORT(
		n1 : IN std_logic_vector(3 downto 0);
		n2 : IN std_logic_vector(3 downto 0);
		b : IN std_logic;          
		d : OUT std_logic_vector(3 downto 0);
		b_out : OUT std_logic
		);
	END COMPONENT;

	signal t_devided_1: std_logic_vector(3 downto 0);
	signal t_remainder_1: std_logic_vector(3 downto 0);
	signal t_subtrahend_1: std_logic_vector(3 downto 0);
	signal t_d1: std_logic_vector(3 downto 0);
	signal t_b1: std_logic;
	
	signal t_devided_2: std_logic_vector(3 downto 0);
	signal t_remainder_2: std_logic_vector(3 downto 0);
	signal t_subtrahend_2: std_logic_vector(3 downto 0);
	signal t_d2: std_logic_vector(3 downto 0);
	signal t_b2: std_logic;
	
	signal t_devided_3: std_logic_vector(3 downto 0);
	signal t_remainder_3: std_logic_vector(3 downto 0);
	signal t_subtrahend_3: std_logic_vector(3 downto 0);
	signal t_d3: std_logic_vector(3 downto 0);
	signal t_b3: std_logic;
	
	signal t_devided_4: std_logic_vector(3 downto 0);
	signal t_remainder_4: std_logic_vector(3 downto 0);
	signal t_subtrahend_4: std_logic_vector(3 downto 0);
	signal t_d4: std_logic_vector(3 downto 0);
	signal t_b4: std_logic;
	
begin
	
	-- dicide Quotient(3) bit
	t_devided_1(3 downto 1) <= "000";
	t_devided_1(0) <= n1(3);
	subtractor_1_1: subtractor_4 PORT MAP(
		n1 => t_devided_1,
		n2 => n2,
		b => '0',
		d => t_d1,
		b_out => t_b1
	);
	q(3) <= not t_b1;
	
	-- decide remainder 1
	t_subtrahend_1(3) <= (not t_b1) and n2(3);
	t_subtrahend_1(2) <= (not t_b1) and n2(2);
	t_subtrahend_1(1) <= (not t_b1) and n2(1);
	t_subtrahend_1(0) <= (not t_b1) and n2(0);
	subtractor_1_2: subtractor_4 PORT MAP(
		n1 => t_devided_1,
		n2 => t_subtrahend_1,
		b => '0',
		d => t_remainder_1,
		b_out => open
	);

	-- dicide Quotient(2) bit
	t_devided_2(3 downto 1) <= t_remainder_1(2 downto 0);
	t_devided_2(0) <= n1(2);
	subtractor_2_1: subtractor_4 PORT MAP(
		n1 => t_devided_2,
		n2 => n2,
		b => '0',
		d => t_d2,
		b_out => t_b2
	);
	q(2) <= not t_b2;
	
	-- decide remainder 2
	t_subtrahend_2(3) <= (not t_b2) and n2(3);
	t_subtrahend_2(2) <= (not t_b2) and n2(2);
	t_subtrahend_2(1) <= (not t_b2) and n2(1);
	t_subtrahend_2(0) <= (not t_b2) and n2(0);
	subtractor_2_2: subtractor_4 PORT MAP(
		n1 => t_devided_2,
		n2 => t_subtrahend_2,
		b => '0',
		d => t_remainder_2,
		b_out => open
	);
	
	-- dicide Quotient(1) bit
	t_devided_3(3 downto 1) <= t_remainder_2(2 downto 0);
	t_devided_3(0) <= n1(1);
	subtractor_3_1: subtractor_4 PORT MAP(
		n1 => t_devided_3,
		n2 => n2,
		b => '0',
		d => t_d3,
		b_out => t_b3
	);
	q(1) <= not t_b3;
	
	-- decide remainder 3
	t_subtrahend_3(3) <= (not t_b3) and n2(3);
	t_subtrahend_3(2) <= (not t_b3) and n2(2);
	t_subtrahend_3(1) <= (not t_b3) and n2(1);
	t_subtrahend_3(0) <= (not t_b3) and n2(0);
	subtractor_3_2: subtractor_4 PORT MAP(
		n1 => t_devided_3,
		n2 => t_subtrahend_3,
		b => '0',
		d => t_remainder_3,
		b_out => open
	);
	
	-- dicide Quotient(0) bit
	t_devided_4(3 downto 1) <= t_remainder_3(2 downto 0);
	t_devided_4(0) <= n1(0);
	subtractor_4_1: subtractor_4 PORT MAP(
		n1 => t_devided_4,
		n2 => n2,
		b => '0',
		d => t_d4,
		b_out => t_b4
	);
	q(0) <= not t_b4;
	
	-- decide remainder 4
	t_subtrahend_4(3) <= (not t_b4) and n2(3);
	t_subtrahend_4(2) <= (not t_b4) and n2(2);
	t_subtrahend_4(1) <= (not t_b4) and n2(1);
	t_subtrahend_4(0) <= (not t_b4) and n2(0);
	subtractor_4_2: subtractor_4 PORT MAP(
		n1 => t_devided_4,
		n2 => t_subtrahend_4,
		b => '0',
		d => t_remainder_4,
		b_out => open
	);
	
	r <= t_remainder_4;

end Behavioral;

