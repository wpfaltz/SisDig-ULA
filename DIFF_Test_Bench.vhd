--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:52:45 06/15/2023
-- Design Name:   
-- Module Name:   /home/william/Downloads/PraticaSD1/DIFF_Test_Bench.vhd
-- Project Name:  PraticaSD1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DIFF_2_Vectors_4_Bits
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY DIFF_Test_Bench IS
END DIFF_Test_Bench;
 
ARCHITECTURE behavior OF DIFF_Test_Bench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DIFF_2_Vectors_4_Bits
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         sum : OUT  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic;
         V : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
	signal clock: std_logic ;

 	--Outputs
   signal sum : std_logic_vector(3 downto 0);
   signal Cout : std_logic;
   signal V : std_logic;
   -- No clocks detected in port list. Replace clock below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DIFF_2_Vectors_4_Bits PORT MAP (
          a => a,
          b => b,
          sum => sum,
          Cout => Cout,
          V => V
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		A <= "0011";
		B <= "0101";
      wait for 100 ns;	
		A <= "0000";
		B <= "1111";
      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
