----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:00:43 05/12/2023 
-- Design Name: 
-- Module Name:    FullAdder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Full_Adder is
	port (a,b,c: in std_logic;
	sum,carry: out std_logic);
end Full_Adder;

architecture fulladder_behav of Full_Adder is
signal halfSum: std_logic;

	component Half_Adder
	port(a, b: in std_logic;
			sum: out std_logic);
	end component;

		
begin
	HA0: Half_Adder port map (a, b, halfSum);
	HA1: Half_Adder port map (c,halfSum , sum);
	carry<= (a and b) or (c and (a or b));
end fulladder_behav;

