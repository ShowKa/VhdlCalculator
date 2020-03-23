library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fulladder_4 is
    Port ( n1, n2 : in  STD_LOGIC_VECTOR (3 downto 0);
           result : out  STD_LOGIC_VECTOR (4 downto 0));
end fulladder_4;

architecture Behavioral of fulladder_4 is
	
	COMPONENT fulladder_3
	PORT(
		n1 : IN std_logic_vector(2 downto 0);
		n2 : IN std_logic_vector(2 downto 0);          
		result : OUT std_logic_vector(3 downto 0)
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

	signal t_result: std_logic_vector(3 downto 0);
	
begin
	
	Inst_fulladder_3: fulladder_3 PORT MAP(
		n1 => n1(2 downto 0),
		n2 => n2(2 downto 0),
		result => t_result
	);
	
	result(0) <= t_result(0);
	result(1) <= t_result(1);
	result(2) <= t_result(2);

	Inst_fulladder: fulladder PORT MAP(
		A => n1(3),
		B => n2(3),
		C => t_result(3),
		S => result(3),
		Cout => result(4)
	);

end Behavioral;

