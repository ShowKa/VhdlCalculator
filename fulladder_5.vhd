library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fulladder_5 is
    Port ( n1, n2 : in  STD_LOGIC_VECTOR (4 downto 0);
           result : out  STD_LOGIC_VECTOR (5 downto 0));
end fulladder_5;

architecture Behavioral of fulladder_5 is
	COMPONENT fulladder_4
	PORT(
		n1 : IN std_logic_vector(3 downto 0);
		n2 : IN std_logic_vector(3 downto 0);          
		result : OUT std_logic_vector(4 downto 0)
		);
	END COMPONENT;

	COMPONENT fulladder
	PORT(
		A : IN std_logic;
		B : IN std_logic;
		C : IN std_logic;          
		S : OUT std_logic;
		Cout : OUT std_logic
		);
	END COMPONENT;

	signal t_result : std_logic_vector(4 downto 0);

begin

	Inst_fulladder_4: fulladder_4 PORT MAP(
		n1 => n1(3 downto 0),
		n2 => n2(3 downto 0),
		result => t_result
	);

	result(3 downto 0) <= t_result(3 downto 0);

	Inst_fulladder: fulladder PORT MAP(
		A => n1(4),
		B => n2(4),
		C => t_result(4),
		S => result(4),
		Cout => result(5)
	);	

end Behavioral;

