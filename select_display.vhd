library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity select_display is
    Port ( CLK : in STD_LOGIC;
				RESET: in STD_LOGIC;
				select_display : out std_logic_vector(1 downto 0));	
end select_display;
			  
architecture Behavioral of select_display is
    signal cnt: std_logic_vector(1 downto 0);
begin

	-- toggle: 00->01->10->11->00->...
	process(CLK, RESET) 
	begin
	   if (RESET = '1') then
			cnt <= "00";
		elsif (CLK' event and CLK = '1') then
			cnt <= cnt + 1;
		end if;
	end process;
	
	select_display <= cnt;

end Behavioral;
