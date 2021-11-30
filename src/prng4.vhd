library IEEE;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;
library work;
use work.vectorul4.all; 

entity prng is
	port(
	clk: in std_logic;
	reset: in std_logic;
	output4: out tip_matrice4
	);
end entity;

architecture behavioral of prng is
signal temp: std_logic_vector(3 downto 0); 
signal index: integer:=0;
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				temp <= "0001";
			else
				temp(3) <= temp(2);
				temp(2) <= temp(1);
				temp(1) <= temp(0);
				temp(0) <= temp(3) xor temp(2);
			end if;
		end if;	
		if falling_edge(clk)then 
				output4(index)<=temp;	
			index<=index+1;
		end if;
		if index = 16 then
			index<=0;
			end if;
	end process;	 
	
end architecture;