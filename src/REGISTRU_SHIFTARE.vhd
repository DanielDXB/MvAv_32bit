library IEEE;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all; 
use ieee.numeric_std.all;
library work;
use work.vectorul8.all; 

entity REGISTRU_SHIFTARE is
	port(clk: in std_logic;
	sel: inout std_logic_vector(2 downto 0);	
	suma: in std_logic_vector(11 downto 0);
	rezultat: out std_logic_vector(11 downto 0));
end entity;	

architecture shift of REGISTRU_SHIFTARE is
begin
	process(sel,suma,clk)
	begin 
	if rising_edge(clk) then
	case sel is 	
		when "000"=> rezultat<=suma; --HOLD
		when "100"=> rezultat<="0" & suma(11 downto 1); --DIV 2
		when "101"=> rezultat<="00" & suma(11 downto 2); --DIV 4
		when "110"=> rezultat<="000" & suma(11 downto 3); --DIV 8
		when "111"=> rezultat<="0000" & suma(11 downto 4); --DIV 16
		when others=> null;
	end case;	
	end if;
	end process;
end shift;
	
