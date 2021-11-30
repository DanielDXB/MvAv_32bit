library IEEE;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

entity SUMATOR_4_4_BITI is
	port(A: in std_logic_vector(3 downto 0);
	B: in std_logic_vector(3 downto 0);  
	C: in std_logic_vector(3 downto 0); 
	D: in std_logic_vector(3 downto 0); 
	CIN: in std_logic;
	S: out std_logic_vector(11 downto 0);
	COUT: out std_logic);
end SUMATOR_4_4_BITI;	

architecture sum of SUMATOR_4_4_BITI is	

component SUMATOR_1_BIT
	port(A,B,CIN:in std_logic;
	S,COUT: out std_logic);
end component;				 

component SUMATOR_2_4_BITI
	port(A: in std_logic_vector(3 downto 0);
	B: in std_logic_vector(3 downto 0);
	CIN: in std_logic;
	S: out std_logic_vector(11 downto 0);
	COUT: out std_logic);
end component; 

component SUMATOR_2_11BITI
	port(A: in std_logic_vector(11 downto 0);
	B: in std_logic_vector(11 downto 0);  
	CIN: in std_logic;
	S: out std_logic_vector(11 downto 0);
	COUT: out std_logic);
end component;

signal SUM1_4: std_logic_vector(11 downto 0);
signal SUM2_4: std_logic_vector(11 downto 0);
signal SUM3_4: std_logic_vector(11 downto 0);

begin
	suma1_4_4: SUMATOR_2_4_BITI port map (A,B,CIN,SUM1_4,COUT); 
	suma2_4_4: SUMATOR_2_4_BITI port map (C,D,CIN,SUM2_4,COUT);
	suma3_4_4: SUMATOR_2_11BITI port map (SUM1_4,SUM2_4,CIN,S,COUT);
	
end sum;