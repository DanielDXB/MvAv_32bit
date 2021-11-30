library IEEE;

use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;

entity SUMATOR_1_BIT is
	port(A,B,CIN: in std_logic;
	S,COUT: out std_logic);
end SUMATOR_1_BIT;

architecture SUMATOR_1_BIT of SUMATOR_1_BIT is

signal int_S: std_logic;
signal int_c1,int_c2,int_c3:std_logic;

begin
	int_s<=A xor B;
	S<=int_s xor CIN;
	int_c1<=A and CIN;
	int_c2<=B and CIN;
	int_c3<=A and B;
	COUT<=int_c1 or int_c2 or int_c3;
end SUMATOR_1_BIT;