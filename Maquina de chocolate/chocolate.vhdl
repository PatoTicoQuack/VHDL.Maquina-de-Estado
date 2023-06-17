-- M.E. Exemplo 01
-- Estados com 3 bits
library ieee;
use ieee.std_logic_1164.all; 
entity chocolate is
    port(
    dinheiro : in std_logic_vector (1 downto 0);
    rst, clk : in std_logic;
    str : in std_logic_vector(2 downto 0);
    choco : out std_logic
    );
end entity;
architecture doit of chocolate is
    -- Função de Próximo Estado
    component FPE is
    port(
        moedas : in std_logic_vector(1 downto 0);
        eAtual : in std_logic_vector(2 downto 0);
        eFinal : out std_logic_vector(2 downto 0)
    );
    end component;
    -- Banco de Registradores
    component regs is
    port(
        din : in std_logic_vector(2 downto 0);
        clear, clock : in std_logic;
        dout : out std_logic_vector(2 downto 0)
        );
    end component;
    component UFS is
        port(
            e : in std_logic_vector (2 downto 0);
            dev, cof, disp : out std_logic
        );
    end component;

    signal s_moedas : std_logic_vector (1 downto 0);
    signal s_eFinal : std_logic_vector (2 downto 0);
    signal spe_reg : std_logic_vector(2 downto 0);
    signal ea, pe : string(1 to 3);
    
    signal s_dev, s_cof, s_disp : std_logic;
begin
     u_fpe : FPE port map(dinheiro, spe_reg, s_eFinal);
     u_reg : regs port map(s_eFinal, rst, clk, spe_reg);
     u_ufs : UFS port map(spe_reg, s_dev, s_cof, s_disp); 
     -- s(ea)
 
     -- helper
     -- utilizado para observar estado atual e próximo estado no ghw
     ea <= "e00" when spe_reg="000" else
     "e25" when spe_reg="010" else
     "e50" when spe_reg="001" else
     "e75" when spe_reg="011" else
     "e99" when spe_reg="100" else "ZZZ";
     pe <= "e00" when s_eFinal="000" else
     "e25" when s_eFinal="010" else
     "e50" when s_eFinal="001" else
     "e75" when s_eFinal="011" else
     "e99" when s_eFinal="100" else "ZZZ";
end architecture;
