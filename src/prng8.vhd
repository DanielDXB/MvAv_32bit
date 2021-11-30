library IEEE;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;
library work;
use work.vectorul8.all; 

entity prng8 is
	port(	
	clk: in std_logic;
	reset: in std_logic;
	output8: out tip_matrice8
	);
end entity;

architecture behavioral of prng8 is
signal temp: std_logic_vector(7 downto 0); 
signal index: integer:=0;
begin	 
	process(clk)	
	begin
		if rising_edge(clk) then
			if reset = '1' then
				temp <= "00000001";
				output8(0)<="00000001";
			else		
				temp(7)	<= temp(6);
				temp(6)	<= temp(5);
				temp(5)	<= temp(4);
				temp(4)	<= temp(3);
				temp(3) <= temp(2);
				temp(2) <= temp(1);
				temp(1) <= temp(0);
				temp(0) <= temp(7) xor temp(6);	
			end if;
		end if;	
		if falling_edge(clk)then 
				output8(index)<=temp;	
			index<=index+1;
		end if;
		if index = 16 then
			index<=0;
			end if;
	end process;	
end architecture;
		