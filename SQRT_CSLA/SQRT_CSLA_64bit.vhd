library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SQRT_CSLA_64bit is
    Port ( A : in STD_LOGIC_VECTOR (63 downto 0);
           B : in STD_LOGIC_VECTOR (63 downto 0);
           Cin : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (63 downto 0);
           Cout : out STD_LOGIC);
end SQRT_CSLA_64bit;

architecture Behavioral of SQRT_CSLA_64bit is
    signal Carry : STD_LOGIC_VECTOR (7 downto 0);
begin
    RCA_4bit_0_3: entity work.Ripple_Carry_Adder_4bit port map(A(3 downto 0), B(3 downto 0), Cin, Sum(3 downto 0), Carry(0));
    SQRT_CSLA_4bit_4_7: entity work.Carry_Select_Adder_4bit port map(A(7 downto 4), B(7 downto 4), Carry(0), Sum(7 downto 4), Carry(1));
    SQRT_CSLA_5bit_8_12: entity work.Carry_Select_Adder_5bit port map(A(12 downto 8), B(12 downto 8), Carry(1), Sum(12 downto 8), Carry(2));
    SQRT_CSLA_6bit_13_18: entity work.Carry_Select_Adder_6bit port map(A(18 downto 13), B(18 downto 13), Carry(2), Sum(18 downto 13), Carry(3));
    SQRT_CSLA_7bit_19_25: entity work.Carry_Select_Adder_7bit port map(A(25 downto 19), B(25 downto 19), Carry(3), Sum(25 downto 19), Carry(4));
    SQRT_CSLA_8bit_26_33: entity work.Carry_Select_Adder_8bit port map(A(33 downto 26), B(33 downto 26), Carry(4), Sum(33 downto 26), Carry(5));
    SQRT_CSLA_9bit_34_42: entity work.Carry_Select_Adder_9bit port map(A(42 downto 34), B(42 downto 34), Carry(5), Sum(42 downto 34), Carry(6));
    SQRT_CSLA_10bit_43_52: entity work.Carry_Select_Adder_10bit port map(A(52 downto 43), B(52 downto 43), Carry(6), Sum(52 downto 43), Carry(7));
    SQRT_CSLA_11bit_53_63: entity work.Carry_Select_Adder_11bit port map(A(63 downto 53), B(63 downto 53), Carry(7), Sum(63 downto 53), Cout);
end Behavioral;
