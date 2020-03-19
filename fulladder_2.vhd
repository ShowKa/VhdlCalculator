
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;
--library UNISIM;
--use UNISIM.VComponents.all;

entity fulladder_2 is
    Port ( n1, n2 : in  STD_LOGIC_VECTOR (1 downto 0);
           result : out  STD_LOGIC_VECTOR (2 downto 0)
			  );
end fulladder_2;

architecture Behavioral of fulladder_2 is

	COMPONENT fulladder
	PORT(
		A : IN std_logic;
		B : IN std_logic;
		C : IN std_logic;          
		S : OUT std_logic;
		Cout : OUT std_logic
		);
	END COMPONENT;
	
	signal t_c : std_logic;
begin

	fulladder_1: fulladder PORT MAP(
		A => n1(0),
		B => n2(0),
		C => '0',
		S => result(0),
		Cout => t_c
	);

	fulladder_2: fulladder PORT MAP(
		A => n1(1),
		B => n2(1),
		C => t_c,
		S => result(1),
		Cout => result(2)
	);

end Behavioral;

