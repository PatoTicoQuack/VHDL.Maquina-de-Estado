library ieee;
use ieee.std_logic_1164.all;

entity FPE is
    port(
        moedas : in std_logic_vector(1 downto 0);
        eAtual : in std_logic_vector(2 downto 0);
        eFinal : out std_logic_vector(2 downto 0)
        );
end entity;

architecture comportamento of FPE is
    begin
    eFinal(2) <= (moedas(1) and moedas(0)) or (eAtual(0) and moedas(0)) or (eAtual(1) and eAtual(0) and moedas(1));
    eFinal(1) <= (not(eAtual(1)) and moedas(1)) or (moedas(1) and moedas(0)) or (eAtual(1) and not(moedas(1)));
    eFinal(0) <= (moedas(1) and moedas(0)) or (not(eAtual(0)) and moedas(0)) or (eAtual(1) and eAtual(0) and not(moedas(1))) or (eAtual(1) and not(eAtual(0)) and moedas(1)) or (not(eAtual(1)) and eAtual(0) and not(moedas(0)));

end architecture;
