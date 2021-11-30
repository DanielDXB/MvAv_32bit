library IEEE;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

entity SUMATOR_2_11BITI is
	port(A: in std_logic_vector(11 downto 0);
	B: in std_logic_vector(11 downto 0);  
	CIN: in std_logic;
	S: out std_logic_vector(11 downto 0);
	COUT: out std_logic);
end SUMATOR_2_11BITI;	

architecture sum of SUMATOR_2_11BITI is	
begin
	S<=A+B;
end sum;