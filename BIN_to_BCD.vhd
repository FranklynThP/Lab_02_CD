library ieee;
use ieee.std_logic_1164.all;

entity BIN_to_BCD is
    port( SW: in std_logic_vector(7 downto 0);
        bcd: out std_logic_vector(11 downto 0));
end BIN_to_BCD;

architecture log of BIN_to_BCD is

component ADD3 is
    port (A0,A1,A2,A3: in  std_logic;
            S0,S1,S2,S3: out std_logic);
end component;

signal AS0,AS1,AS2,AS3,BS0,BS1,BS2,BS3,CS0,CS1,CS2,CS3,DS0,DS1,DS2,DS3,ES0,ES1,ES2 : std_logic;
begin

blocoA: ADD3 port map(SW(5), SW(6), SW(7), '0', AS0, AS1, AS2, AS3);

blocoB: ADD3 port map(SW(4), AS0, AS1, AS2, BS0, BS1, BS2, BS3);

blocoC: ADD3 port map(SW(3), BS0, BS1, BS2, CS0, CS1, CS2, CS3);

blocoD: ADD3 port map(SW(2), CS0,CS1,CS2, DS0, DS1, DS2, DS3);

blocoE: ADD3 port map(CS3, BS3, AS3, '0', ES0, ES1, ES2, bcd(9));

blocoF: ADD3 port map(SW(1), DS0, DS1, DS2, bcd(1), bcd(2), bcd(3), bcd(4));

blocoG: ADD3 port map(DS3, ES0, ES1, ES2, bcd(5), bcd(6), bcd(7), bcd(8));

bcd(0) <= SW(0);
bcd(10) <= '0';
bcd(11) <= '0';

end log;