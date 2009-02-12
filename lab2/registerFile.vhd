library ieee;
use ieee.std_logic_1164.all;

entity registerFile is
  
  port (
    clk, r_we      : in  std_logic;
    rd_reg, wr_reg : in  std_logic_vector(1 downto 0);
    data_in        : in  std_logic_vector(7 downto 0);
    bus_out        : out std_logic_vector(7 downto 0));

end registerFile;

architecture behav of registerFile is
  -- The four registers
  signal r0, r1, r2, r3 : std_logic_vector(7 downto 0);
begin  -- behav
  
  process (clk, wr_reg, rd_reg)
  begin  -- process
    if clk'event and clk = '1' then  -- rising clock edge
      if r_we = '1' then
        case wr_reg is
          when "00" => r0 <= data_in;
          when "01" => r1 <= data_in;
          when "10" => r2 <= data_in;
          when "11" => r3 <= data_in;
        end case;
      else
        case wr_reg is
          when "00" => bus_out <= r0;
          when "01" => bus_out <= r1;
          when "10" => bus_out <= r2;
          when "11" => bus_out <= r3;
        end case;
      end if;
    end if;
  end process;
end behav;
