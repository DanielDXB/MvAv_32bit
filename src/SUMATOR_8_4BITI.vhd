library IEEE;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

entity SUMATOR_8_4_BITI is
	port(A: in std_logic_vector(3 downto 0);
	B: in std_logic_vector(3 downto 0);  
	C: in std_logic_vector(3 downto 0); 
	D: in std_logic_vector(3 downto 0);
	E: in std_logic_vector(3 downto 0); 
	F: in std_logic_vector(3 downto 0); 
	G: in std_logic_vector(3 downto 0);
	H: in std_logic_vector(3 downto 0); 
	CIN: in std_logic;
	S: out std_logic_vector(11 downto 0);
	COUT: out std_logic);
end SUMATOR_8_4_BITI;

architecture sum of SUMATOR_8_4_BITI is	

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

component SUMATOR_4_4_BITI
	port(A: in std_logic_vector(3 downto 0);
	B: in std_logic_vector(3 downto 0);  
	C: in std_logic_vector(3 downto 0); 
	D: in std_logic_vector(3 downto 0); 
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

signal SUMA1_8: std_logic_vector(11 downto 0);
signal SUMA2_8: std_logic_vector(11 downto 0);

begin
	suma1_4_8: SUMATOR_4_4_BITI port map (A,B,C,D,CIN,SUMA1_8,COUT); 
	suma2_4_8: SUMATOR_4_4_BITI port map (E,F,G,H,CIN,SUMA2_8,COUT);
	suma3_4_8: SUMATOR_2_11BITI port map (SUMA1_8,SUMA2_8,CIN,S,COUT);
end sum;