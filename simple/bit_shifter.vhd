-- Eight bit shifter

library ieee;
use ieee.std_logic_1164.all;

entity rotate is
  port (
    clk, rst, load : in  std_logic;
    data           : in  std_logic_vector(0 to 7);
    Q              : out std_logic_vector);
end rotate;


architecture rotate1 of rotate is
  signal Qreg : std_logic_vector(0 to 7);
begin  -- rotate1
  reg : process (clk, rst)
  begin  -- process reg
    if rst = '1' then
      Qreg <= "00000000";
    elsif clk'event and clk = '1' then  -- rising clock edge
      if load = '1' then
        qreg <= Data;
      else
        qreg <= qreg(1 to 7) & qreg(0);
      end if;
    end if;
  end process reg;
  q <= qreg;

end rotate1;



architecture rotate2 of rotate is
  signal D, Qreg : std_logic_vector(0 to 7);

  procedure dff (
    signal RST, Clk : in  std_logic;
    signal d        : in  std_logic_vector(0 to 7);
    signal q        : out std_logic_vector(0 to 7)) is
  begin
    if rst = '1' then
      Q <= "00000000";
    elsif Clk = '1' and Clk'event then
      Q <= D;
    end if;
  end dff;  

  
begin  -- rotate2

  
  
  d <= data when (Load = '1') else
       qreg(1 to 7) & qreg(0);

  dff(rst, clk, d, qreg);

  q <= qreg;

end rotate2;
