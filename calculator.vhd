
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity calculator is
    Port ( n1 : in  STD_LOGIC_VECTOR(3 downto 0);
           n2 : in  STD_LOGIC_VECTOR(3 downto 0);
			  ope : in  STD_LOGIC_VECTOR(3 downto 0);
  			  clk : in std_logic;
           result : out  STD_LOGIC_VECTOR(7 downto 0);
			  seg7_display : out  STD_LOGIC_VECTOR(7 downto 0);
			  an : out  STD_LOGIC_VECTOR(3 downto 0)
			  );
end calculator;

architecture Behavioral of calculator is

	COMPONENT clk1milis
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;          
		DP : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT fulladder_4
	PORT(
		n1 : IN std_logic_vector(3 downto 0);
		n2 : IN std_logic_vector(3 downto 0);          
		result : OUT std_logic_vector(4 downto 0)
		);
	END COMPONENT;
	
	COMPONENT multiplier_4
	PORT(
		n1 : IN std_logic_vector(3 downto 0);
		n2 : IN std_logic_vector(3 downto 0);          
		result : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT subtractor_4
	PORT(
		n1 : IN std_logic_vector(3 downto 0);
		n2 : IN std_logic_vector(3 downto 0);
		b : IN std_logic;          
		d : OUT std_logic_vector(3 downto 0);
		b_out : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT devider_4
	PORT(
		n1 : IN std_logic_vector(3 downto 0);
		n2 : IN std_logic_vector(3 downto 0);          
		q : OUT std_logic_vector(3 downto 0);
		r : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	COMPONENT dec7seg
	PORT(
		A : IN std_logic_vector(3 downto 0);          
		Y : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT select_display
	PORT(
		CLK : IN std_logic;
		RESET : IN std_logic;          
		select_display : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;

	signal t_dp_1ms : std_logic;
	signal t_select_display : std_logic_vector(1 downto 0);
	--
	signal t_result : STD_LOGIC_VECTOR(7 downto 0);
	signal t_result_deg_1 : std_logic_vector(3 downto 0);
	signal t_result_deg_10 : std_logic_vector(3 downto 0);
	signal t_7seg_deg_1 : STD_LOGIC_VECTOR(7 downto 0);
	signal t_7seg_deg_10 : STD_LOGIC_VECTOR(7 downto 0);
	--
	signal t_result_add : std_logic_vector(4 downto 0);
	signal t_result_sub : std_logic_vector(4 downto 0);
	signal t_result_multi : std_logic_vector(7 downto 0);
	signal t_result_devide : std_logic_vector(3 downto 0);
	signal t_result_rem : std_logic_vector(3 downto 0);
	
begin
	
	-- timer
	Inst_clk1milis: clk1milis PORT MAP(
		CLK => clk,
		RST => '0',
		DP => t_dp_1ms
	);
	
	-- add
	Inst_adder_4: fulladder_4 PORT MAP(
		n1 => n1,
		n2 => n2,
		result => t_result_add
	);
	-- subtract
	Inst_subtractor_4: subtractor_4 PORT MAP(
		n1 => n1,
		n2 => n2,
		b => '0',
		d => t_result_sub(3 downto 0),
		b_out => t_result_sub(4)
	);
	-- multiple
	Inst_multiplier: multiplier_4 PORT MAP(
		n1 => n1,
		n2 => n2,
		result => t_result_multi
	);
	-- devide
	Inst_devider_4: devider_4 PORT MAP(
		n1 => n1,
		n2 => n2,
		q => t_result_devide,
		r => t_result_rem
	);
	-- with operator ?
	process(ope, t_result_add, t_result_multi, t_result_sub, t_result_devide, t_result_rem)
	begin
		if (ope = "0000") then
			t_result <= "000" & t_result_add;
		elsif (ope = "1000") then
			t_result <= "000" & t_result_sub;
		elsif (ope = "0100") then
			t_result <= t_result_multi;
		elsif (ope = "0010") then
			t_result <= "0000" & t_result_devide;
		else
			t_result <= "0000" & t_result_rem;
		end if;
	end process;
	result <= t_result;
	
	-- to deg
	-- FIXME: only 4 bit...
	Inst_to_deg: devider_4 PORT MAP(
		n1 => t_result(3 downto 0),
		n2 => "1010",
		q => t_result_deg_10,
		r => t_result_deg_1
	);

	-- decoding
	Inst_dec7seg_deg_1: dec7seg PORT MAP(
		A => t_result_deg_1,
		Y => t_7seg_deg_1
	);
	Inst_dec7seg_deg_10: dec7seg PORT MAP(
		A => t_result_deg_10,
		Y => t_7seg_deg_10
	);
	
	-- select display
	Inst_select_display: select_display PORT MAP(
		CLK => t_dp_1ms,
		RESET => '0',
		select_display => t_select_display
	);

	process(t_7seg_deg_1, t_7seg_deg_10, t_select_display)
	begin
		case t_select_display is 
			when "00" => seg7_display <= t_7seg_deg_1; an <= "1110";
			when "01" => seg7_display <= t_7seg_deg_10; an <= "1101";
			when "10" => seg7_display <=  "11000000"; an <= "1011";
			when others => seg7_display <= "11000000"; an <= "0111";
		end case;
	end process;
	
end Behavioral;

