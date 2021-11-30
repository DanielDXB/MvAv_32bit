library IEEE;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;

entity SUMATOR_2_8_BITI is
	port(A: in std_logic_vector(7 downto 0);
	B: in std_logic_vector(7 downto 0);
	CIN: in std_logic;
	S: out std_logic_vector(11 downto 0);
	COUT: out std_logic);
end SUMATOR_2_8_BITI;

architecture sum of SUMATOR_2_8_BITI is
component SUMATOR_1_BIT
	port(A,B,CIN:in std_logic;
	S,COUT: out std_logic);
end component;

signal C: std_logic_vector(7 downto 0);

begin
	suma0: SUMATOR_1_BIT port map (A(0),B(0),'0',S(0),C(0));
	suma1: SUMATOR_1_BIT port map (A(1),B(1),C(0),S(1),C(1));
	suma2: SUMATOR_1_BIT port map (A(2),B(2),C(1),S(2),C(2));
	suma3: SUMATOR_1_BIT port map (A(3),B(3),C(2),S(3),C(3));	 
	suma4: SUMATOR_1_BIT port map (A(4),B(4),C(3),S(4),C(4));
	suma5: SUMATOR_1_BIT port map (A(5),B(5),C(4),S(5),C(5));
	suma6: SUMATOR_1_BIT port map (A(6),B(6),C(5),S(6),C(6));
	suma7: SUMATOR_1_BIT port map (A(7),B(7),C(6),S(7),C(7));
	suma8: SUMATOR_1_BIT port map ('0','0',C(7),S(8),COUT);	
	S(9)<='0';
	S(10)<='0';
	s(11)<='0';
end sum;