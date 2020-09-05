LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Counter IS

GENERIC (n : POSITIVE := 22);

PORT (clk,enable,reset:IN STD_LOGIC; -- ACTIVE LOW
      counter_output: OUT STD_LOGIc_VECTOR (n-1 DOWNTO 0)); -- INTEGER
END Counter;


ARCHITECTURE behav OF Counter IS

SIGNAL count : STD_LOGIC_VECTOR (n-1 DOWNTO 0);

BEGIN
	PROCESS (clk , reset)
	BEGIN
	   IF(reset = '0')THEN
	       count <= (OTHERS => '0');
	   ELSIF(clk'EVENT AND clk = '1')THEN   --- clk = 20ns
	       IF(enable = '1')THEN
		 count <= count +1;
		END IF;
	   END IF; 
	END PROCESS;
   counter_output <= count;
END behav;
