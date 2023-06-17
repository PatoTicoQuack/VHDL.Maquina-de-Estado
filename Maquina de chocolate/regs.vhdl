library ieee;
use ieee.std_logic_1164.all; 
entity regs is
    port(
    din : in std_logic_vector(2 downto 0);
    clear, clock : in std_logic;
    dout : out std_logic_vector(2 downto 0):= "000"
    );
end entity;
architecture storage of regs is
    component ffd is
    port(
    d : in std_logic;
    clk : in std_logic;
    pr, cl : in std_logic;
    q, nq : out std_logic
    );
end component;
    begin
    --u_ffd2 : ffd port map (din(2), clock, '1', clear, dout(2));
    --u_ffd1 : ffd port map (din(1), clock, '1', clear, dout(1));
    --u_ffd0 : ffd port map (din(0), clock, '1', clear, dout(0));
    reg : for i in 2 downto 0 generate
     r : ffd port map(din(i), clock, '1', clear, dout(i));
     end generate reg;
end architecture;
