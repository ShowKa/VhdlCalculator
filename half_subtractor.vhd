library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_subtractor is
    Port ( n1, n2 : in  STD_LOGIC;
           d, b : out  STD_LOGIC);
end half_subtractor;

architecture Behavioral of half_subtractor is
	signal t_d : std_logic;
begin

	t_d <= n1 xor n2;
	
	d <= t_d;
	b <= t_d and n2;

end Behavioral;
