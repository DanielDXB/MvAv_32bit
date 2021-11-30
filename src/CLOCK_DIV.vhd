library IEEE;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

entity CLK_DIV is
	port( clk: in std_logic;
	clk_new: out std_logic);
end CLK_DIV;

architecture bhv of CLK_DIV is	
signal contor:integer:=1;
signal temp: std_logic:='0';
begin
	process(clk)

	begin
	if(clk'event and clk='1')then
		contor<=contor+1; 
	if(contor=4)then
		temp<=NOT temp;
		contor<=1;
	end if;
	end if;
	clk_new<=temp;
end process;
end bhv;