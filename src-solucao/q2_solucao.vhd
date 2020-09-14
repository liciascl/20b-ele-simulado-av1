------------------------------
-- Elementos de Sistemas
-- Avaliacao Pratica 1
--
-- 10/2019
--
-- Questão 5
------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Questao5 is
  port (
    x : in  STD_LOGIC_VECTOR(1 downto 0);
    y : in  STD_LOGIC_VECTOR(1 downto 0);
    z : out STD_LOGIC_VECTOR(3 downto 0));
end entity;

architecture  rtl OF Questao5 IS

begin

  z(3) <= x(1) and x(0) and y(1) and y(0);
  z(2) <= (x(1) and x(0) and y(1) and (not y(0))) or
          (x(1) and (not x(0)) and y(1));
  z(1) <= ((not x(1)) and x(0) and y(1)) or
          ((not x(1)) and x(0) and y(1)) or
          (x(1) and x(0) and y(1) and (not y(0))) or
          (x(1) and (not x(0)) and y(1) and y(0));
  z(0) <= ((not x(1)) and x(0) and y(0)) or
        (x(1) and (not y(1)) and y(0));



end architecture;
