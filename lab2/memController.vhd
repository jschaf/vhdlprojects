library ieee;
use ieee.std_logic_1164.all;

entity memController is
  
  port (
    addr         : in    std_logic_vector(2 downto 0);
    bus_in       : in    std_logic_vector(7 downto 0);
    ld_op, st_op : in    std_logic;
    mem_out      : out   std_logic_vector(7 downto 0);
    addr_bus     : out   std_logic_vector(2 downto 0);
    data_bus     : inout std_logic_vector(7 downto 0));

end memController;

architecture behav of memController is

begin  -- behav

  process (addr, ld_op, st_op, data_bus)
  begin  -- process
    if ld_op = '1' then
      addr_bus <= addr;
      mem_out  <= data_bus;
    elsif st_op = '1' then
      addr_bus <= addr;
      data_bus <= bus_in;
    else
      data_bus <= "ZZZZZZZZ";
      addr_bus <= "ZZZ";
    end if;
    

    
  end process;

end behav;
