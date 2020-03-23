
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity calculator is
    Port ( n1 : in  STD_LOGIC_VECTOR(3 downto 0);
           n2 : in  STD_LOGIC_VECTOR(3 downto 0);
			  --ope : in  STD_LOGIC_VECTOR(3 downto 0);
           result : out  STD_LOGIC_VECTOR(4 downto 0)
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
begin
	Inst_fulladder_4: fulladder_4 PORT MAP(
		n1 => n1,
		n2 => n2,
		result => result
	);
end Behavioral;

