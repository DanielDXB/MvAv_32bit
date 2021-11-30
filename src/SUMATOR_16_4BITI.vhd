library IEEE;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

entity SUMATOR_16_4_BITI is
	port(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P: in std_logic_vector(3 downto 0);
	CIN: in std_logic;
	S: out std_logic_vector(11 downto 0);
	COUT: out std_logic);
end SUMATOR_16_4_BITI;	 

architecture sum of SUMATOR_16_4_BITI is	

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

component SUMATOR_8_4_BITI
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
end component;

component SUMATOR_2_11BITI
	port(A: in std_logic_vector(11 downto 0);
	B: in std_logic_vector(11 downto 0);  
	CIN: in std_logic;
	S: out std_logic_vector(11 downto 0);
	COUT: out std_logic);
end component;

signal SUMA1_16: std_logic_vector(11 downto 0);
signal SUMA2_16: std_logic_vector(11 downto 0);
signal SUMA3_16: std_logic_vector(11 downto 0);	   

begin
	suma1_4_16: SUMATOR_8_4_BITI port map (A,B,C,D,E,F,G,H,CIN,SUMA1_16,COUT); 
	suma2_4_16: SUMATOR_8_4_BITI port map (I,J,K,L,M,N,O,P,CIN,SUMA2_16,COUT);
	suma3_4_16: SUMATOR_2_11BITI port map (SUMA1_16,SUMA2_16,CIN,S,COUT);
end sum;