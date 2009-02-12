library ieee;
use ieee.std_logic_1164.all;


entity mux2 is
  
  port (
    Mem        : in  std_logic;
    bus1, bus2 : in  std_logic_vector(7 downto 0);
    out_bus    : out std_logic_vector(7 downto 0));

end mux2;

architecture behav of mux2 is
  
begin  -- behav
  
  out_bus <= bus1 when mem = '1' else
             bus2;

end behav;
