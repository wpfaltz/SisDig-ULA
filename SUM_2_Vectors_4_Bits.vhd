----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:06:09 05/12/2023 
-- Design Name: 
-- Module Name:    FOURbitADD - Behavioral 
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

entity SUM_2_Vectors_4_Bits is
port (a, b: in std_logic_vector(3 downto 0);
	Cin : in std_logic;
	sum: out std_logic_vector (3 downto 0);
	Cout, V: out std_logic);
end SUM_2_Vectors_4_Bits;

architecture fouradder_structure of SUM_2_Vectors_4_Bits is
	signal c: std_logic_vector (4 downto 0);
		
	component Full_Adder
		port(a, b, c: in std_logic;
			sum, carry: out std_logic);
	end component;
	
	begin
	FA0: Full_Adder port map (a(0), b(0), Cin, sum(0), c(1));
	FA1: Full_Adder port map (a(1), b(1), C(1), sum(1), c(2));
	FA2: Full_Adder port map (a(2), b(2), C(2), sum(2), c(3));
	FA3: Full_Adder port map (a(3), b(3), C(3), sum(3), c(4));
	V <= c(3) xor c(4);
	Cout <= c(4);
end fouradder_structure;