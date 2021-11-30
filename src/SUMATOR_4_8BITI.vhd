library IEEE;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

entity SUMATOR_4_8_BITI is
	port(A: in std_logic_vector(7 downto 0);
	B: in std_logic_vector(7 downto 0);  
	C: in std_logic_vector(7 downto 0); 
	D: in std_logic_vector(7 downto 0); 
	CIN: in std_logic;
	S: out std_logic_vector(11 downto 0);
	COUT: out std_logic);
end SUMATOR_4_8_BITI;	

architecture sum of SUMATOR_4_8_BITI is	

component SUMATOR_1_BIT
	port(A,B,CIN:in std_logic;
	S,COUT: out std_logic);
end component;				 

component SUMATOR_2_8_BITI
	port(A: in std_logic_vector(7 downto 0);
	B: in std_logic_vector(7 downto 0);
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

signal SUM1: std_logic_vector(11 downto 0);
signal SUM2: std_logic_vector(11 downto 0);
signal SUM3: std_logic_vector(11 downto 0);

begin
	suma1_4: SUMATOR_2_8_BITI port map (A,B,CIN,SUM1,COUT); 
	suma2_4: SUMATOR_2_8_BITI port map (C,D,CIN,SUM2,COUT);
	suma3_4: SUMATOR_2_11BITI port map (SUM1,SUM2,CIN,S,COUT);
	
end sum;