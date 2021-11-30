library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all; 
use ieee.numeric_std.all;
library work;
use work.vectorul8.all; 
use work.vectorul4.all; 

entity sumator is
	port(clk: inout std_logic;	  
	reset: in std_logic;
	sel: inout std_logic_vector(2 downto 0);
	ctrl: in std_logic_vector(2 downto 0);
	matrice8: inout tip_matrice8;
	matrice4: inout tip_matrice4;
	suma: inout std_logic_vector(11 downto 0)
	);
end entity;	  

architecture suma of sumator is

component prng8  
	port(	
	clk: in std_logic;
	reset: in std_logic;
	output8: out tip_matrice8
	);
end component;

component prng 
	port(
	clk: in std_logic;
	reset: in std_logic;
	output4: out tip_matrice4
	);
end component; 

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

component SUMATOR_16_8_BITI
	port(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P: in std_logic_vector(7 downto 0);
	CIN: in std_logic;
	S: out std_logic_vector(11 downto 0);
	COUT: out std_logic);
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

component SUMATOR_16_4_BITI
	port(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P: in std_logic_vector(3 downto 0);
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

component CLK_DIV
	port( clk: in std_logic;
	clk_new: out std_logic);
end component;

signal SUMA8_2: std_logic_vector(11 downto 0);
signal SUMA8_4: std_logic_vector(11 downto 0);
signal SUMA8_8: std_logic_vector(11 downto 0);
signal SUMA8_16: std_logic_vector(11 downto 0);

signal SUMA4_2: std_logic_vector(11 downto 0);
signal SUMA4_4: std_logic_vector(11 downto 0);
signal SUMA4_8: std_logic_vector(11 downto 0);
signal SUMA4_16: std_logic_vector(11 downto 0);

signal CIN42,COUT42,CIN44,COUT44,CIN48,COUT48,CIN416,COUT416,CIN82,COUT82,CIN84,COUT84,CIN88,COUT88,CIN816,COUT816: std_logic; 	   
signal SUMAX: std_logic_vector(11 downto 0);
signal clk_nou: std_logic;

begin	   	
	adauga4: prng port map(clk,reset,matrice4);	
	adauga8: prng8 port map(clk,reset,matrice8); 
	
	adaugaclock: CLK_DIV port map(clk,clk_nou);
	
	suma8_2nr: SUMATOR_2_8_BITI port map (matrice8(0),matrice8(1),CIN84,SUMA8_2,COUT84);
	suma8_4nr: SUMATOR_4_8_BITI port map (matrice8(0),matrice8(1),matrice8(2),matrice8(3),CIN84,SUMA8_4,COUT84);
	suma8_8nr: SUMATOR_8_8_BITI port map (matrice8(0),matrice8(1),matrice8(2),matrice8(3),matrice8(4),matrice8(5),matrice8(6),matrice8(7),CIN88,SUMA8_8,COUT88);
	suma8_16nr: SUMATOR_16_8_BITI port map (matrice8(0),matrice8(1),matrice8(2),matrice8(3),matrice8(4),matrice8(5),matrice8(6),matrice8(7),matrice8(8),matrice8(9),matrice8(10),matrice8(11),matrice8(12),matrice8(13),matrice8(14),matrice8(15),CIN816,SUMA8_16,COUT816);
	
	suma4_2nr: SUMATOR_2_4_BITI port map (matrice4(0),matrice4(1),CIN42,SUMA4_2,COUT42);
	suma4_4nr: SUMATOR_4_4_BITI port map (matrice4(0),matrice4(1),matrice4(2),matrice4(3),CIN44,SUMA4_4,COUT44);
	suma4_8nr: SUMATOR_8_4_BITI port map (matrice4(0),matrice4(1),matrice4(2),matrice4(3),matrice4(4),matrice4(5),matrice4(6),matrice4(7),CIN84,SUMA4_8,COUT84);
	suma4_16nr: SUMATOR_16_4_BITI port map (matrice4(0),matrice4(1),matrice4(2),matrice4(3),matrice4(4),matrice4(5),matrice4(6),matrice4(7),matrice4(8),matrice4(9),matrice4(10),matrice4(11),matrice4(12),matrice4(13),matrice4(14),matrice4(15),CIN416,SUMA4_16,COUT416);
	
	process (clk,suma,sel,ctrl)		 
	begin
	if reset ='1' then
		suma<="000000000000";
		end if;
	case ctrl is
		when "000"=> suma<="000000000000";
		when "001"=> clk<=clk_nou;
		when "010"=> SUMAX<="000000000100"+"000000000010"+"000000001000"+"000000000011"+"000000010000"+"010000001100"+"010001101100"+"010010001100";
					 suma<="000" & SUMAX(11 downto 3);		
		when "011"=> SUMAX<="00000101010"+"000001101010"+"000000001001"+"000000000111"+"000000011000"+"010000001110"+"010000001100"+"010000011100";
					 suma<="000" & SUMAX(11 downto 3);
		when "110"=>	
					case sel is 	
					when "000"=> null;
					when "100"=> suma<=SUMA4_2;  
					when "101"=> suma<=SUMA4_4;
					when "110"=> suma<=SUMA4_8;
					when "111"=> suma<=SUMA4_16;
					when others=> null;
					end case;
		when "111"=> 
					case sel is 	
					when "000"=> null;
					when "100"=> suma<=SUMA8_2;
					when "101"=> suma<=SUMA8_4;
					when "110"=> suma<=SUMA8_8;
					when "111"=> suma<=SUMA8_16; 
					when others=> null;
					end case;
		when others=> null;
	end case;
	end process;
end suma;