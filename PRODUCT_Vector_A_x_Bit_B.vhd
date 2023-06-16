----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:29:32 06/02/2023 
-- Design Name: 
-- Module Name:    PRODUCT_Vector_A_x_Bit_B - Behavioral 
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

entity PRODUCT_Vector_A_x_Bit_B is
	  Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC;
           C : out  STD_LOGIC_VECTOR (3 downto 0));
end PRODUCT_Vector_A_x_Bit_B;

architecture Behavioral of PRODUCT_Vector_A_x_Bit_B is
begin

	c(0) <= A(0) and b;
	c(1) <= A(1) and b;
	c(2) <= A(2) and b;
	c(3) <= A(3) and b;
	
end Behavioral;
