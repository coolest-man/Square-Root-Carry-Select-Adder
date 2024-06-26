library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ripple_Carry_Adder_4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);
end Ripple_Carry_Adder_4bit;

architecture Behavioral of Ripple_Carry_Adder_4bit is
    signal Carry : STD_LOGIC_VECTOR (2 downto 0);
begin
    FA1: entity work.Full_Adder port map(A(0), B(0), Cin, Sum(0), Carry(0));
    FA2: entity work.Full_Adder port map(A(1), B(1), Carry(0), Sum(1), Carry(1));
    FA3: entity work.Full_Adder port map(A(2), B(2), Carry(1), Sum(2), Carry(2));
    FA4: entity work.Full_Adder port map(A(3), B(3), Carry(2), Sum(3), Cout);
end Behavioral;

