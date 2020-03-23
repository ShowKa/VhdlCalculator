library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier is
    Port ( n1, n2 : in  STD_LOGIC;
           result : out  STD_LOGIC);
end multiplier;

architecture Behavioral of multiplier is

begin

	result <= n1 and n2;

end Behavioral;

