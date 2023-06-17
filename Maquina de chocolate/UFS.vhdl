library ieee;
use ieee.std_logic_1164.all;

entity UFS is
    port(
            e : in std_logic_vector (2 downto 0);
            dev, cof, disp : out std_logic
        );
end UFS;

architecture ff of UFS is
begin
    dev <= e(2) and e(1);
    cof <= e(2) and not(e(1));
    disp <= e(2) and not(e(1));
end architecture ff;
