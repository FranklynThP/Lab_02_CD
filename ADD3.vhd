library ieee;
use ieee.std_logic_1164.all;

entity ADD3 is
    port (A0,A1,A2,A3: in  std_logic;
            S0,S1,S2,S3: out std_logic);
end ADD3;

architecture ckt of ADD3 is
begin
    S0 <= (not A3 and not A2 and A0) or (A2 and A1 and not A0) or  (A3 and not A0);
    S1 <= (not A2 and A1) or (A1 and A0) or (A3 and not A0);
    S2 <= (A2 and not A1 and not A0) or (A3 and A0);
    S3 <= (A2 and A0) or (A2 and A1) or A3;
end ckt;
