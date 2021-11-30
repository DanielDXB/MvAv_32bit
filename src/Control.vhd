library IEEE;

use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;

entity control is
	port(
	sel: in std_logic_vector(2 downto 0));
end control;

architecture comportamental of control is
type type_states is (test_mode,square_wave,repeated_six_student1,repeated_six_student2,pseudo_0_15,pseudo_0_255,error,neinitializat);
signal output: type_states;	
begin		  
CLC:process(sel)
begin	  
			case sel is
				when "000" => output <= test_mode;
				when "001" => output <= square_wave;
			   	when "010" => output <= repeated_six_student2;
				when "011" => output <=	repeated_six_student1;
				when "110" => output <=	pseudo_0_15;
				when "111" => output <= pseudo_0_255;
				when others => output <= error;
			end case;
			end process;
end comportamental;

