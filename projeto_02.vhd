library ieee;
use ieee.std_logic_1164.all;

entity projeto_02 is
    port( SW: in std_logic_vector(7 downto 0);
    HEX0,HEX1,HEX2: out std_logic_vector(6 downto 0));
end projeto_02;

architecture log of projeto_02 is

component SEG_7 is
	 port(A,B,C,D: in std_logic;
        s : out std_logic_vector(0 to 6));
end component;

component BIN_to_BCD is
	port( SW: in std_logic_vector(7 downto 0);
        bcd: out std_logic_vector(11 downto 0));
end component;

signal S_BCD : std_logic_vector(11 downto 0);
signal U0,U1,U2,U3,D0,D1,D2,D3,C0,C1,C2,C3: std_logic;
begin

BINBCD: BIN_to_BCD port map(SW, S_BCD);

U0<=S_BCD(0);
U1<=S_BCD(1);
U2<=S_BCD(2);
U3<=S_BCD(3);
D0<=S_BCD(4);
D1<=S_BCD(5);
D2<=S_BCD(6);
D3<=S_BCD(7);
C0<=S_BCD(8);
C1<=S_BCD(9);
C2<=S_BCD(10);
C3<=S_BCD(11);

Unidade: SEG_7 port map(U3,U2,U1,U0,HEX0);
Dezena: SEG_7 port map(D3,D2,D1,D0,HEX1);
Centena: SEG_7 port map(C3,C2,C1,C0,HEX2);
end log;