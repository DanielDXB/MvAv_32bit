library IEEE;

use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;   

entity MUX_6_2 is
	port(I0, I1, I2, I3, I4: in std_logic;
	sel: in std_logic_vector(2 downto 0);
	output: out std_logic);
end MUX_6_2;

architecture comportamental of MUX_6_2 is
begin
	output <= (I0 and not(sel(2)) and not(sel(1)) and not(sel(0))) or
	(I1 and sel(2) and not(sel(1)) and not(sel(0))) or
	(I2 and sel(2) and not(sel(1)) and sel(0)) or
	(I3 and sel(2) and sel(1) and not(sel(0))) or
	(I4 and sel(2) and sel(1) and sel(0));
end comportamental;