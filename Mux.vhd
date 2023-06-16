----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:08:53 06/13/2023 
-- Design Name: 
-- Module Name:    mux - Behavioral 
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
entity Mux is
    Port ( a0 : in  STD_LOGIC_VECTOR (3 downto 0);
           a1 : in  STD_LOGIC_VECTOR (3 downto 0);
           a2 : in  STD_LOGIC_VECTOR (3 downto 0);
           a3 : in  STD_LOGIC_VECTOR (3 downto 0);
			  sel : in  STD_LOGIC_VECTOR (1 downto 0);
           aout : out  STD_LOGIC_VECTOR (3 downto 0));
end Mux;

architecture Behavioral of Mux is

begin
  aout <= a0 when (sel = "00")else 	 
  a1 when (sel = "01") else
  a2 when (sel = "10") else
  a3 when (sel = "11") ;

end Behavioral;