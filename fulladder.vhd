
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity fulladder is
    Port ( A, B, C : in  STD_LOGIC;
           S, Cout : out  STD_LOGIC);
end fulladder;

architecture Behavioral of fulladder is

	COMPONENT halfadder
		PORT(
			A : IN std_logic;
			B : IN std_logic;          
			S : OUT std_logic;
			C : OUT std_logic
			);
	END COMPONENT;

	signal T_S, T_C0, T_C1 : std_logic;

begin

	ha0: halfadder PORT MAP(
		A => A,
		B => B,
		S => T_S,
		C => T_C0
	);

	ha1: halfadder PORT MAP(
		A => T_S,
		B => C,
		S => S,
		C => T_C1
	);
	
	Cout <= T_C1 or T_C0;

end Behavioral;

