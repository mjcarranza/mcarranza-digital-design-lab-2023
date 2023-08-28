-- primero se llama la librer[ia y los modulos a usar
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Se crea la entidad 
entity Sumador4Bits is
	-- Se definen las entradas y salidas del circuito logico
   Port ( A, B : in STD_LOGIC_VECTOR(3 downto 0); -- estos son los bits de entrada
          Cin : in STD_LOGIC;
          Sum : out STD_LOGIC_VECTOR(3 downto 0); -- estos son los bits de salida
          Cout : out STD_LOGIC
	);
	
end Sumador4Bits; -- Se cierra la entidad.


-- se crea la arquitectura
architecture Sumador4Bits of Sumador4Bits is
signal carry: std_logic_Vector(4 downto 0);
begin
	process (A,B,Cin, carry)
	begin
		carry(0) <= Cin;
		for i in 0 to 3 loop
			Sum(i) <= A(i) xor B(i) xor carry(i);
			carry(i+1) <= (A(i) and B(i)) or (A(i) and carry(i)) or (carry(i) and B(i));
		end loop;
		Cout <= carry(4);
	end process;
end Sumador4Bits;