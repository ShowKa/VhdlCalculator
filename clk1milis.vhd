
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity clk1milis is
    Port ( CLK, RST : in  STD_LOGIC;
           DP : out  STD_LOGIC);
end clk1milis;

architecture Behavioral of clk1milis is
	signal CNT: std_logic_vector(27 downto 0);
	signal COUT:std_logic;
	signal DPP:std_logic;
begin
	process(CLK, RST)
	begin
		if (RST = '1') then
			CNT <= X"0000000";
		elsif (CLK' event and CLK='1') then
			if (CNT = X"00061A7") then
				COUT <= '1';
				CNT <= X"0000000";
			else 
				CNT <= CNT + 1;
				COUT <= '0';
			end if;
		end if;
	end process;
	
	process(Cout, RST)
	begin
		if (RST = '1') then
			DPP <= '0';
		elsif (COUT' event and COUT='1') then
			DPP <= not DPP;
		end if;
	end process;
	
	DP <= DPP;

end Behavioral;

