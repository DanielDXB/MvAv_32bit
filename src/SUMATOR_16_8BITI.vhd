library IEEE;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

entity SUMATOR_16_8_BITI is
	port(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P: in std_logic_vector(7 downto 0);
	CIN: in std_logic;
	S: out std_logic_vector(11 downto 0);
	COUT: out std_logic);
end SUMATOR_16_8_BITI;	 

architecture sum of SUMATOR_16_8_BITI is	

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

component SUMATOR_4_8_BITI
	port(A: in std_logic_vector(7 downto 0);
	B: in std_logic_vector(7 downto 0);  
	C: in std_logic_vector(7 downto 0); 
	D: in std_logic_vector(7 downto 0); 
	CIN: in std_logic;
	S: out std_logic_vector(11 downto 0);
	COUT: out std_logic);
end component; 

component SUMATOR_8_8_BITI
	port(A: in std_logic_vector(7 downto 0);
	B: in std_logic_vector(7 downto 0);  
	C: in std_logic_vector(7 downto 0); 
	D: in std_logic_vector(7 downto 0);
	E: in std_logic_vector(7 downto 0); 
	F: in std_logic_vector(7 downto 0); 
	G: in std_logic_vector(7 downto 0);
	H: in std_logic_vector(7 downto 0); 
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

signal SUMA1: std_logic_vector(11 downto 0);
signal SUMA2: std_logic_vector(11 downto 0);
signal SUMA3: std_logic_vector(11 downto 0);	   

begin
	suma1_16: SUMATOR_8_8_BITI port map (A,B,C,D,E,F,G,H,CIN,SUMA1,COUT); 
	suma2_16: SUMATOR_8_8_BITI port map (I,J,K,L,M,N,O,P,CIN,SUMA2,COUT);
	suma3_16: SUMATOR_2_11BITI port map (SUMA1,SUMA2,CIN,S,COUT);
end sum;