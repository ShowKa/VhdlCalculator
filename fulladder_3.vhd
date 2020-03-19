library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fulladder_3 is
    Port ( n1, n2 : in  STD_LOGIC_VECTOR (2 downto 0);
           result : out  STD_LOGIC_VECTOR (3 downto 0));
end fulladder_3;

architecture Behavioral of fulladder_3 is

	COMPONENT fulladder
	PORT(
		A : IN std_logic;
		B : IN std_logic;
		C : IN std_logic;          
		S : OUT std_logic;
		Cout : OUT std_logic
		);
	END COMPONENT;

	COMPONENT fulladder_2
	PORT(
		n1 : IN std_logic_vector(1 downto 0);
		n2 : IN std_logic_vector(1 downto 0);          
		result : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;

	signal t_r: std_logic_vector(2 downto 0);

begin

	Inst_fulladder_2: fulladder_2 PORT MAP(
		n1 => n1(1 downto 0),
		n2 => n2(1 downto 0),
		result => t_r
	);
	
	result(0) <= t_r(0);
	result(1) <= t_r(1);

	Inst_fulladder: fulladder PORT MAP(
		A => n1(2),
		B => n2(2),
		C => t_r(2),
		S => result(2),
		Cout => result(3)
	);

end Behavioral;

