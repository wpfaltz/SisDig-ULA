----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:35:53 06/15/2023 
-- Design Name: 
-- Module Name:    inputs - Behavioral 
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

entity inputs is
    Port ( Vetores : in  STD_LOGIC_VECTOR (3 downto 0);
        	CLK : in  STD_LOGIC;
        	ButtonN : in  STD_LOGIC; -- Armazena o A
        	ButtonE : in  STD_LOGIC; -- Armazena o B
			ButtonS : in  STD_LOGIC; -- Armazena a primeira operacao
			rst : in STD_LOGIC;
        	Outesquerda : out  STD_LOGIC_VECTOR (3 downto 0);
			OutDireita : out  STD_LOGIC_VECTOR (3 downto 0));
end inputs;

architecture Behavioral of inputs is

component SUM_2_Vectors_4_Bits 
port (a, b: in std_logic_vector(3 downto 0);
	Cin : in std_logic;
	sum: out std_logic_vector (3 downto 0);
	Cout, V: out std_logic);
end component;

component  DIFF_2_Vectors_4_Bits 
	port (a, b: in std_logic_vector(3 downto 0);
	sum: out std_logic_vector (3 downto 0);
	Cout, V: out std_logic);

end component;

component PRODUCT_2_Vectors_4_Bits 
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           C : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component DOUBLE_Vector_A
	port (A : in std_logic_vector(3 downto 0); --vetor de entrada
		s : out std_logic_vector (3 downto 0); --soma
		Cout : out std_logic); --carry out geral
end component;

component AND_2_Vectors_4_Bits 
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           C : out  STD_LOGIC_VECTOR (3 downto 0));
end component; 

component OR_2_Vectors_4_Bits 
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           C : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component XOR_2_Vectors_4_Bits 
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           C : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component NOT_Vector_A 
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

----> COMPONENTES, LER EMBAIXO OS VALORES PARA POR NAS SAIDAS
signal verifica: integer range 0 to 2 := 0;
signal A : std_logic_vector (3 downto 0); ----- valor do primeiro numero
signal B : std_logic_vector (3 downto 0); ----- valor do segundo numero
signal C : std_logic_vector (3 downto 0); ----- valor do estado inicial
signal Contador : integer range 0 to 100000000  :=0; ------ contar 2s
signal Selecionador_Fases : integer range 0 to 3 := 0;----- fase inicial da selecao de dados 
signal SOMA : std_logic_vector (3 downto 0); -------- resultado da soma
signal SUBTRACAO : std_logic_vector (3 downto 0); ------- resultado da subtracao
signal MULTIPLICACAO : std_logic_vector (7 downto 0); ----- resultado da multiplicacao
signal DOBRO : std_logic_vector (3 downto 0); -----resultado dobro de A
signal ANDE : std_logic_vector (3 downto 0);------resultado and de A e B
signal ORR : std_logic_vector (3 downto 0);-------resultado or de A e B
signal XORR : std_logic_vector (3 downto 0);--------------- resultado de xor de a e b
signal NOTT : std_logic_vector (3 downto 0);------------resultado Not de A
signal cout_DIFF : std_logic;
signal cout_DOBRO : std_logic;
signal cout_Soma : std_logic;
signal flag_soma : std_logic;
signal Flag_diff : std_logic;
signal continuar : integer range 0 to 9 := 9;

begin

SUM : SUM_2_Vectors_4_Bits port map(A, B,'0',SOMA, cout_Soma, flag_soma);
DIFF : DIFF_2_Vectors_4_Bits port map (A, B, SUBTRACAO, cout_DIFF, Flag_diff);
multi : PRODUCT_2_Vectors_4_Bits port map (A,B,MULTIPLICACAO);
A_2 : DOUBLE_Vector_A port map(A,DOBRO,cout_DOBRO);
AND_2 : AND_2_Vectors_4_Bits port map(A,B,ANDE);
OR_2 : OR_2_Vectors_4_Bits port map(A,B,ORR);
XOR_2 : XOR_2_Vectors_4_Bits port map(A,B,XORR);
NOT_A : NOT_Vector_A port map(A, NOTT);	

process(Clk,rst)
begin






-- DEFINIR VARIAVEIS QUE ESTAO FALTANDO 


-- RECURSIVIDADE 

If rising_edge(CLK) then 

-----------------------------
	if (buttonN = '1' and  Selecionador_Fases = 0) then
		A <= vetores;
		Selecionador_Fases <= 1;
	end if;

	if (buttonE = '1' and Selecionador_Fases = 1) then
		B <= vetores;
		Selecionador_Fases <= 2;
	end if;
	
	if (buttonS = '1' and Selecionador_Fases = 2) then
		c<= vetores;
		Selecionador_Fases <= 3;
	end if;
------------------------------

-- 1
	if c = "0000" or continuar = 8 then
		c<="1111";
		if verifica = 0 then
			if Contador < 100000000 then
				Contador <= Contador + 1;
				OutDireita <= A;    
				OutEsquerda <= "0000";
			else
				verifica <= 1;
				Contador <= 0;
			end if;
		end if;
		
		if verifica = 1 then
			if Contador < 100000000 then
				Contador <= Contador + 1;
				OutDireita<= B;
				OutEsquerda<= "0000";
			else
				verifica <= 2;
				Contador <= 0;
			end if;
		end if;
		
		if verifica = 2 then
			if Contador < 100000000 then
				Contador <= Contador + 1;
				OutDireita<= SOMA;               ---SAIDA
				OutEsquerda<= "0000";
				continuar<= 1;
			else
				verifica <= 0;
				Contador <= 0;
			end if;
		end if;
	end if;
	
-- 2
	if c = "0001" or continuar=1 then
		c<="1111";
		if verifica = 0 then
			if Contador < 100000000 then
				Contador <= Contador + 1;
				OutDireita<= A;
				OutEsquerda<= "0001";
			else
				verifica <= 1;
				Contador <= 0;
			end if;
		end if;
		
		if verifica = 1 then
			if Contador < 100000000 then
				Contador <= Contador + 1;
				OutDireita<= B;
				OutEsquerda<= "0001";
			else
				verifica <= 2;
				Contador <= 0;
			end if;
		end if;
		
		if verifica = 2 then
			if Contador < 100000000 then
				Contador <= Contador + 1;
				OutDireita<= SUBTRACAO;						---SAIDA
				OutEsquerda<= "0001";
				continuar<= 2;
			else
				verifica <= 0;
				Contador <= 0;
			end if;
		end if;
	end if;
	
-- 3
	if c = "0010" or continuar=2 then
		c<="1111";
		if verifica = 0 then
			if Contador < 100000000 then
				Contador <= Contador + 1;
				OutDireita<= A;
				OutEsquerda<= "0010";
			else
				verifica <= 1;
				Contador <= 0;
			end if;
		end if;
		
		if verifica = 1 then
			if Contador < 100000000 then
				Contador <= Contador + 1;
				OutDireita<= B;
				OutEsquerda<= "0010";
			else
				verifica <= 2;
				Contador <= 0;
			end if;
		end if;
		
		if verifica = 2 then
			if Contador < 100000000 then
				Contador <= Contador + 1;
				OutDireita(0)<= MULTIPLICACAO(0);	
				OutDireita(1)<= MULTIPLICACAO(1);
				OutDireita(2)<= MULTIPLICACAO(2);
				OutDireita(3)<= MULTIPLICACAO(3);				---SAIDA
				OutEsquerda<= "0010";
				continuar<= 3;
			else
				verifica <= 0;
				Contador <= 0;
			end if;
		end if;
	end if;
	
-- 4
	if c = "0011" or continuar=3 then
		c<="1111";
		if verifica = 0 then
			if Contador < 100000000 then
				Contador <= Contador + 1;
				OutDireita<= A;
				OutEsquerda<= "0011";
			else
				verifica <= 1;
				Contador <= 0;
			end if;
		end if;
		
		if verifica = 1 then
			if Contador < 100000000 then
				Contador <= Contador + 1;
				OutDireita<= B;
				OutEsquerda<= "0001";
			else
				verifica <= 2;
				Contador <= 0;
			end if;
		end if;	
			
		if verifica = 2 then
			if Contador < 100000000 then
				Contador <= Contador + 1;
				OutDireita<= ANDE;					---SAIDA
				OutEsquerda<= "0001";
				continuar<= 4;
			else
				verifica <= 0;
				Contador <= 0;
			end if;
		end if;
	end if;
	
-- 5
	if c = "0100" or continuar=4 then
		c<="1111";
		if verifica = 0 then
			if Contador < 100000000 then
				Contador <= Contador + 1;
				OutDireita<= A;
				OutEsquerda<= "0100";
			else
				verifica <= 1;
				Contador <= 0;
			end if;
		end if;
		
		if verifica = 1 then
			if Contador < 100000000 then
				Contador <= Contador + 1;
				OutDireita<= B;
				OutEsquerda<= "0100";
			else
				verifica <= 2;
				Contador <= 0;
			end if;
		end if;
			
		if verifica = 2 then
			if Contador < 100000000 then
				Contador <= Contador + 1;
				OutDireita<= ORR;					---SAIDA
				OutEsquerda<= "0100";
				continuar<= 5;
			else
				verifica <= 0;
				Contador <= 0;
			end if;
		end if;
	end if;

-- 6 

	if c = "0101" or continuar=5 then
		c<="1111";
		if verifica = 0 then
			if Contador < 100000000 then
				Contador <= Contador + 1;
				OutDireita<= A;
				OutEsquerda<= "0101";
			else
				verifica <= 1;
				Contador <= 0;
			end if;
		end if;	
		
		if verifica = 1 then
			if Contador < 100000000 then
				Contador <= Contador + 1;
				OutDireita<= B;
				OutEsquerda<= "0101";
			else
				verifica <= 2;
				Contador <= 0;
			end if;
		end if;
			
		if verifica = 2 then
			if Contador < 100000000 then
				Contador <= Contador + 1;
				OutDireita<= NOTT;					---SAIDA
				OutEsquerda<= "0101";
				continuar<= 6;
			else
				verifica <= 0;
				Contador <= 0;
			end if;
		end if;
	end if;

-- 7 
	if c = "0110" or continuar=6 then
		c<="1111";
		if verifica = 0 then
			if Contador < 100000000 then
				Contador <= Contador + 1;
				OutDireita<= A;
				OutEsquerda<= "0110";
			else
				verifica <= 1;
				Contador <= 0;
			end if;
		end if;
		
		if verifica = 1 then
			if Contador < 100000000 then
				Contador <= Contador + 1;
				OutDireita<= B;
				OutEsquerda<= "0110";
			else
				verifica <= 2;
				Contador <= 0;
			end if;
		end if;
			
		if verifica = 2 then
			if Contador < 100000000 then
				Contador <= Contador + 1;
				OutDireita<= XORR;					---SAIDA
				OutEsquerda<= "0110";
				continuar<= 7;
			else
				verifica <= 0;
				Contador <= 0;
			end if;
		end if;
	end if; 

--8
	if c = "0111" or continuar=7 then
		c<="1111";
		if verifica = 0 then
			if Contador < 100000000 then
				Contador <= Contador + 1;
				OutDireita<= A;
				OutEsquerda<= "0111";
			else
				verifica <= 1;
				Contador <= 0;
			end if;
		end if;
		
		if verifica = 1 then
			if Contador < 100000000 then
				Contador <= Contador + 1;
				OutDireita<= B;
				OutEsquerda<= "0111";
			else
				verifica <= 2;
				Contador <= 0;
			end if;
		end if;
			
		if verifica = 2 then
			if Contador < 100000000 then
				Contador <= Contador + 1;
				OutDireita<= DOBRO;					---SAIDA
				OutEsquerda<= "0111";
				continuar<= 8;
			else
				verifica <= 0;
				Contador <= 0;
			end if;
		end if; 
	end if;
	
	if (rst = '1') then
			-- FAZER BOTAO RESET 
			Selecionador_Fases <= 0;
			continuar <= 9;
	
	end if;
end if;

		
end process;
end Behavioral;
