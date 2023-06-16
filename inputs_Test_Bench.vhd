--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:45:06 06/16/2023
-- Design Name:   
-- Module Name:   /home/william/Downloads/PraticaSD1/inputs_Test_Bench.vhd
-- Project Name:  PraticaSD1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: inputs
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
 
ENTITY inputs_Test_Bench IS
END inputs_Test_Bench;
 
ARCHITECTURE behavior OF inputs_Test_Bench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT inputs
    PORT(
         Vetores : IN  std_logic_vector(3 downto 0);
         CLK : IN  std_logic;
         ButtonN : IN  std_logic;
         ButtonE : IN  std_logic;
         ButtonS : IN  std_logic;
         rst : IN  std_logic;
         Outesquerda : OUT  std_logic_vector(3 downto 0);
         OutDireita : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Vetores : std_logic_vector(3 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal ButtonN : std_logic := '0';
   signal ButtonE : std_logic := '0';
   signal ButtonS : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal Outesquerda : std_logic_vector(3 downto 0);
   signal OutDireita : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: inputs PORT MAP (
          Vetores => Vetores,
          CLK => CLK,
          ButtonN => ButtonN,
          ButtonE => ButtonE,
          ButtonS => ButtonS,
          rst => rst,
          Outesquerda => Outesquerda,
          OutDireita => OutDireita
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
