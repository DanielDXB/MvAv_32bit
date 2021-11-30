library IEEE;

use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;

entity length is
	port(
	sel: in std_logic_vector(2 downto 0));
end length;

architecture comportamental of length is
type type_states is (stop_hold,two_sample_average,four_sample_average,eight_sample_average,sixteen_sample_average,error,neinitializat);
signal output: type_states;	
begin		  
CLC:process(sel)
begin	  
			case sel is
				when "000" => output <= stop_hold;
				when "100" => output <= two_sample_average;
			   	when "101" => output <= four_sample_average;
				when "110" => output <=	eight_sample_average;
				when "111" => output <=	sixteen_sample_average;
				when others => output <= error;
			end case;
			end process;
end comportamental;