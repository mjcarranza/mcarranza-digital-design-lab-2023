-- TESTBENCH PARA SUMADOR DE 4 BITS

library IEEE;
use IEEE.std_logic_1164.all;

entity Sumador4Bits_tb is
end entity Sumador4Bits_tb;

architecture Test of Sumador4Bits_tb is
	component Sumador4Bits is
		Port ( A, B : in STD_LOGIC_VECTOR(3 downto 0); -- estos son los bits de entrada
				 Cin : in STD_LOGIC;
				 Sum : out STD_LOGIC_VECTOR(3 downto 0); -- estos son los bits de salida
				 Cout : out STD_LOGIC
		);
	end component Sumador4Bits;
	
	---------------------------------
	signal A_t : std_logic_vector(3 downto 0) := "0000";
	signal B_t : std_logic_vector(3 downto 0) := "0000";
	signal Cin_t : std_logic := '0';
	signal Sum_t : std_logic_vector(3 downto 0);
	signal Cout_t : std_logic;
	
	
-- cuerpo de la arquitectura
begin

dut: Sumador4Bits port map(A => A_t,
									B => B_t,
									Cin => Cin_t,
									Sum => Sum_t,
									Cout => Cout_t);
Prueba: 
	process begin
		report "Varificando sumador de 4 bits" -- imprime el mensaje
		severity note;
		
		------ Se definen los diferentes valores de operandos.
		
		A_t <= "0000";
		B_t <= "0000";
		Cin_t <= '0';
		wait for 1 ns;
		assert Sum_t = "0000"
			report "Falla para la combinacion 0000 0000"
			severity failure;
		assert Cout_t = '0'
			report "Falla acarreo para la combinacion 0000 0000"
			severity failure;
		------------------------------------------------------
		
		A_t <= "1010";
		B_t <= "0101";
		Cin_t <= '0';
		wait for 1 ns;
		assert Sum_t = "1111"
			report "Falla para la combinacion 1010 0101"
			severity failure;
		assert Cout_t = '0'
			report "Falla acarreo para la combinacion 1010 0101"
			severity failure;
		------------------------------------------------------
		
		A_t <= "1110";
		B_t <= "0111";
		Cin_t <= '0';
		wait for 1 ns;
		assert Sum_t = "0101"
			report "Falla para la combinacion 1110 0111"
			severity failure;
		assert Cout_t = '1'
			report "Falla acarreo para la combinacion 1110 0111"
			severity failure;
		------------------------------------------------------
		
		A_t <= "1111";
		B_t <= "1111";
		Cin_t <= '0';
		wait for 1 ns;
		assert Sum_t = "1110"
			report "Falla para la combinacion 1111 1111"
			severity failure;
		assert Cout_t = '1'
			report "Falla acarreo para la combinacion 1111 1111"
			severity failure;
		------------------------------------------------------
		
		report "Verificacion exitosa" -- imprime el mensaje
		severity note;
		wait; -- se da por terminada la simulacion
	
	end process Prueba;

end architecture Test;