library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity DISPLAY is
	port(clk: in std_logic;
	reset: in std_logic;
	clear: in std_logic;
	catod: out std_logic_vector(6 downto 0);
	anod: out std_logic_vector(3 downto 0));
end entity;

architecture lumini of DISPLAY is  

signal led: std_logic_vector(3 downto 0);
signal count: std_logic_vector(1 downto 0);

begin
	process(led)
	begin
		case led is
			when "1111" => catod <="0111000"; --F
			when "1110" => catod <="0110000"; --E
			when "1101" => catod <="1000010"; --D
			when "1100" => catod <="0110001"; --C
			when "1011" => catod <="1100000"; --B
			when "1010" => catod <="0001000"; --A
			when "1001" => catod <="0000100"; --9
			when "1000" => catod <="0000000"; --8
			when "0111" => catod <="0001111"; --7
			when "0110" => catod <="0100000"; --6
			when "0101" => catod <="0100100"; --5
			when "0100" => catod <="1001100"; --4
			when "0011" => catod <="0000110"; --3
			when "0010" => catod <="0010010"; --2
			when "0001" => catod <="1001111"; --1
			when "0000" => catod <="0000001"; --0 
			when others => catod <="1111111"; --OFF
		end case;
end process; 

process (clk,reset)
variable div: integer:=0;
begin
	if reset='1' then
		count<="00";
	else
		if(clk'event and clk='1')then
			div:=div+1;
			if(div=10000)then
				count<=count+1;
				div:=0;
			end if;
		end if;
	end if;
end process;			

end lumini;

			
	