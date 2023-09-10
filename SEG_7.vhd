library IEEE;
use IEEE.std_logic_1164.all;

entity SEG_7 is
    port(A,B,C,D: in std_logic;
        s : out std_logic_vector(0 to 6));
end SEG_7;

architecture log of SEG_7 is

begin
    s(0) <= (not B and not D) or C or (B and D) or A; --a
    s(1) <= not B or (not C and not D) or (C and D); --b
    s(2) <= not C or D or B; --c
    s(3) <= (not B and not D) or (not B and C) or (C and not D) or (B and not C and D) or A;--d
    s(4) <= (not B and not D) or (C and not D);--e
    s(5) <= (not C and not D) or (B and not C) or (B and not D) or A;--f
    s(6) <= (not B and C) or (B and not C) or (B and not D) or A;--g

end log;