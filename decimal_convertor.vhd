
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity decimal_convertor is
    Port ( value : in  STD_LOGIC_VECTOR (7 downto 0);
           deg_1, deg_10, deg_100 : out  STD_LOGIC_VECTOR (3 downto 0));
end decimal_convertor;

architecture Behavioral of decimal_convertor is

begin

end Behavioral;

