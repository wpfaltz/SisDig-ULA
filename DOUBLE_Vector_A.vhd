----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:15:36 06/15/2023 
-- Design Name: 
-- Module Name:    DOUBLE_Vector_A - Behavioral 
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

entity DOUBLE_Vector_A is

port (A : in std_logic_vector(3 downto 0); --vetor de entrada
		--Cin : in std_logic; -- carry in geral
		s : out std_logic_vector (3 downto 0); --soma
		Cout : out std_logic); --carry out geral

end DOUBLE_Vector_A;

architecture Behavioral of DOUBLE_Vector_A is

	signal v: std_logic_vector(3 downto 1);

	component Full_Adder

		port (a, b, c: in std_logic;
				sum, carry: out std_logic);
			
	end component;

	begin

	soma0 : Full_Adder PORT MAP(A(0), A(0), '0', s(0), v(1));
	soma1 : Full_Adder PORT MAP(A(1), A(1), v(1), s(1), v(2));
	soma2 : Full_Adder PORT MAP(A(2), A(2), v(2), s(2), v(3));
	soma3 : Full_Adder PORT MAP(A(3), A(3), v(3), s(3), Cout);
	


end Behavioral;

