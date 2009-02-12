-- Eight-bit comparator

library ieee;
use ieee.std_logic_1164.all;

entity compare is
  
  port (
    A, B : in  std_logic_vector;
    EQ   : out std_logic);

end compare;

architecture compare1 of compare is

begin  -- compare1

  EQ <= '1' when (A = B) else '0';

end compare1;
