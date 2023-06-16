----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:13:45 06/02/2023 
-- Design Name: 
-- Module Name:    PRODUCT_2_Vectors_4_Bits - Behavioral 
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

entity PRODUCT_2_Vectors_4_Bits is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           C : out  STD_LOGIC_VECTOR (7 downto 0));
end PRODUCT_2_Vectors_4_Bits;

architecture Behavioral of PRODUCT_2_Vectors_4_Bits is
signal x0: STD_LOGIC_VECTOR (3 downto 0);
signal x1: STD_LOGIC_VECTOR (3 downto 0);
signal x2: STD_LOGIC_VECTOR (3 downto 0);
signal x3 : STD_LOGIC_VECTOR (3 downto 0);
signal AT0 : STD_LOGIC_VECTOR (3 downto 0);
signal AT1 : STD_LOGIC_VECTOR (3 downto 0);
signal AT2 : STD_LOGIC_VECTOR (3 downto 0);
signal coutT0 : std_logic;
signal coutT1: std_logic;
signal coutT2 : std_logic;
signal CT0 : STD_LOGIC_VECTOR (3 downto 0);
signal CT1 : STD_LOGIC_VECTOR (3 downto 0);
signal CT2 : STD_LOGIC_VECTOR (3 downto 0);
signal CT3 : STD_LOGIC_VECTOR (3 downto 0);
signal vt0 : std_logic;
signal vt1 : std_logic;
signal vt2 : std_logic;
constant Cin : STD_LOGIC_VECTOR (0 downto 0) := "0";
	
	component PRODUCT_Vector_A_x_Bit_B
		port(A : in  STD_LOGIC_VECTOR (3 downto 0);
		B : in STD_LOGIC ;
		c : out STD_LOGIC_VECTOR (3 downto 0));
		
		end component;
		
		component SUM_2_Vectors_4_Bits
		port(a, b: in std_logic_vector(3 downto 0);
			cin: in std_logic;
			sum: out std_logic_vector(3 downto 0);
			cout,V: out std_logic);
		end component;

	
begin
	
	mu0 : PRODUCT_Vector_A_x_Bit_B port map ( a, b(0),x0);
	CT0(0) <= X0(0);
	CT0(1) <= X0(1);
	CT0(2) <= X0(2); 
	CT0(3) <= X0(3);
	
	C(0)<= ct0(0);
----------------------------------------------------------------------------	
	mu1 : PRODUCT_Vector_A_x_Bit_B port map( a, b(1),x1);
	 
	AT0(0) <= ct0(1);
	AT0(1) <= CT0(2);
	AT0(2) <= CT0(3); 
	AT0(3) <= cin(0);
	  
	fb0 :SUM_2_Vectors_4_Bits port map( At0,x1,cin(0),ct1,coutt0,vt0);
	C(1)<= ct1(0);
--------------------------------------------------------------------------	
	mu2 : PRODUCT_Vector_A_x_Bit_B port map( a, b(2),x2);
	 
	 
	at1(0) <= ct1(1);
	at1(1) <= ct1(2);
	at1(2) <= ct1(3); 
	at1(3) <= coutt0;
	   
	fb1 :SUM_2_Vectors_4_Bits port map( At1,x2,cin(0),Ct2,coutt1,vt1);
	C(2)<= Ct2(0);
---------------------------------------------------------------------------	
	mu3 : PRODUCT_Vector_A_x_Bit_B port map( a, b(3),x3);
	 
	AT2(0) <= Ct2(1);
	AT2(1) <= Ct2(2);
	AT2(2) <= Ct2(3); 
	AT2(3) <= coutt1;
	   
	fb2 :SUM_2_Vectors_4_Bits port map (At2,x3,cin(0),ct3,coutt2,vt2);
	C(3)<= ct3(0);	
	C(4)<= ct3(1);
	C(5)<= ct3(2);
	C(6)<= ct3(3);
	C(7) <= coutt2;
	
	
---end	
end Behavioral;
