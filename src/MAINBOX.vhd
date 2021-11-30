library IEEE;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;
library work;
use work.vectorul4.all;
use work.vectorul8.all;

entity MAINBOX is
	port(clk: inout std_logic;
	reset: in std_logic;
	ctrl: in std_logic_vector(2 downto 0);
	sel: inout std_logic_vector(2 downto 0);
	matrice8: inout tip_matrice8;	  
	matrice4: inout tip_matrice4;
	rezultat: out std_logic_vector(11 downto 0):="000000000000");
end entity;	  

architecture main of MAINBOX is 

component prng8 is 
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

component sumator 
	port(clk: inout std_logic;	  
	reset: in std_logic;
	ctrl: in std_logic_vector(2 downto 0);
	sel: inout std_logic_vector(2 downto 0);
	matrice8: inout tip_matrice8;
	matrice4: inout tip_matrice4;
	suma: inout std_logic_vector(11 downto 0)
	);
end component;

component REGISTRU_SHIFTARE 
	port(clk: in std_logic;
	sel: inout std_logic_vector(2 downto 0);	
	suma: in std_logic_vector(11 downto 0);
	rezultat: out std_logic_vector(11 downto 0)
	);
end component;														  

signal suma: std_logic_vector(11 downto 0):="000000000000";

begin	
	
	eticheta1: sumator port map (clk,reset,ctrl,sel,matrice8,matrice4,suma);
	eticheta2: REGISTRU_SHIFTARE port map(clk,sel,suma,rezultat);
	

end main;