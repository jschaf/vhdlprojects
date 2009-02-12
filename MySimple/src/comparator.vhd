entity compare is
  
  port (
    A, B : in  bit_vector(0 to 7);
    EQ   : out bit);

end compare;

architecture compare1 of compare is

begin  -- compare1

  EQ <= '1' when (A=B) else '0';

end compare1;
