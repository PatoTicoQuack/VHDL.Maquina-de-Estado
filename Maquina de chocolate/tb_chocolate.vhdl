-- M.E. Exemplo 01
-- Estados com 3 bits
library ieee;
use ieee.std_logic_1164.all; 
entity tb_chocolate is
    port(
    rst, clk : in std_logic;
    str : in std_logic_vector(2 downto 0);
    choco : out std_logic
    );
end entity;
architecture doit of tb_chocolate is
    constant clock_period : time := 20 ns;

    component chocolate is
    port(
    dinheiro : in std_logic_vector (1 downto 0);
    rst, clk : in std_logic;
    str : in std_logic_vector(2 downto 0);
    choco : out std_logic
    );
    end component;
    signal s_dinheiro : std_logic_vector (1 downto 0);

    signal s_clock : std_logic:= '0';
    signal s_reset : std_logic:= '1';
    signal s_str : std_logic_vector (2 downto 0);
    signal s_choco: std_logic;

begin
    s_clock <= not(s_clock) after clock_period/2;
    u_chocolate : chocolate port map (s_dinheiro, s_reset, s_clock, s_str, s_choco);

    u_tb : process 
    begin
    s_reset <= '0';
    wait for clock_period;
    s_reset <= '1';
    
    -- Duas moedas ao mesmo tempo
    s_str <= "000";
    s_dinheiro <= "11";
    wait for clock_period;

    -- 50,50 
    s_dinheiro <= "01";
    wait for clock_period*2;
    
    -- 25,25,25,25
    s_dinheiro <= "10";
    wait for clock_period*4;

    -- 25,25,50
    s_dinheiro <= "10";
    wait for clock_period*2;
    s_dinheiro <= "01";
    wait for clock_period;

    -- 25,25,25,50 ERRO
    s_dinheiro <= "10";
    wait for clock_period*3;
    s_dinheiro <= "01"; 
    wait;
    end process;
end architecture;
