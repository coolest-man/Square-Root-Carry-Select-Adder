library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Carry_Select_Adder_4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);
end Carry_Select_Adder_4bit;

architecture Behavioral of Carry_Select_Adder_4bit is
    signal Sum0, Sum1 : STD_LOGIC_VECTOR (3 downto 0);
    signal Carry0, Carry1 : STD_LOGIC_VECTOR (2 downto 0);
    signal Cout0, Cout1 : STD_LOGIC;
begin
    -- "0" carry propagation
    FA0_1: entity work.Full_Adder port map(A(0), B(0), '0', Sum0(0), Carry0(0));
    FA0_2: entity work.Full_Adder port map(A(1), B(1), Carry0(0), Sum0(1), Carry0(1));
    FA0_3: entity work.Full_Adder port map(A(2), B(2), Carry0(1), Sum0(2), Carry0(2));
    FA0_4: entity work.Full_Adder port map(A(3), B(3), Carry0(2), Sum0(3), Cout0);

    -- "1" carry propagation
    FA1_1: entity work.Full_Adder port map(A(0), B(0), '1', Sum1(0), Carry1(0));
    FA1_2: entity work.Full_Adder port map(A(1), B(1), Carry1(0), Sum1(1), Carry1(1));
    FA1_3: entity work.Full_Adder port map(A(2), B(2), Carry1(1), Sum1(2), Carry1(2));
    FA1_4: entity work.Full_Adder port map(A(3), B(3), Carry1(2), Sum1(3), Cout1);

    -- Select the correct sum and carry outputs based on the carry-in signal
    Sum <= Sum1 when Cin = '1' else Sum0;
    Cout <= Cout1 when Cin = '1' else Cout0;
end Behavioral;

