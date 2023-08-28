-- decodificador de 4 bits a 7 segmentos

-- primero se llama la librer[ia y los modulos a usar
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Se crea la entidad 
entity Decodificador is
	-- Se definen las entradas y salidas del circuito logico
   Port ( Entrada : in STD_LOGIC_VECTOR(3 downto 0); -- pines de entrada
          Salida : out STD_LOGIC_VECTOR(6 downto 0) -- pines de salida
			);
end Decodificador; -- Se cierra la entidad.


-- se crea la arquitectura
architecture Concurrente of Decodificador is
begin
	with Entrada select
	Salida <= "1000000" when "0000", --0
				 "1111001" when "0001", --1
				 "0100100" when "0010", --2
				 "0110000" when "0011", --3
				 "0011001" when "0100", --4
				 "0010010" when "0101", --5
				 "0000010" when "0110", --6
				 "1111000" when "0111", --7
				 "0000000" when "1000", --8
				 "0011000" when "1001", --9
				 "0001000" when "1010", --A
				 "0000011" when "1011", --B
				 "1000110" when "1100", --C
				 "0100001" when "1101", --D
				 "0000110" when "1110", --E
				 "0001110" when others; --F

end Concurrente;