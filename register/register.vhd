library ieee;
use ieee.std_logic_1164.all;


entity reg is
  
  generic (
    n : natural := 2);

  port (
    I     : in  std_logic_vector(n-1 downto 0);
    clock : in  std_logic;
    load  : in  std_logic;
    clear : in  std_logic;
    Q     : out std_logic_vector(n-1 downto 0));
  
end reg;

architecture behv of reg is
  signal Q_tmp : std_logic_vector(n-1 downto 0);
begin  -- behv

  process (clock, clear)
  begin  -- process
    if clear = '0' then                 -- asynchronous reset (active low)
      Q_tmp <= (Q_tmp'range => '0');
    elsif clock'event and clock = '1' then  -- rising clock edge
      if load = '1' then
        Q_tmp <= I;
      end if;
    end if;
  end process;

  Q <= Q_tmp;
  

end behv;
