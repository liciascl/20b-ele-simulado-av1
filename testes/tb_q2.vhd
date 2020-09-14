library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_q2 is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_q2 is

component q2 is port (
  x : in  STD_LOGIC_VECTOR(1 downto 0);
  y : in  STD_LOGIC_VECTOR(1 downto 0);
  z : out STD_LOGIC_VECTOR(3 downto 0));
end component;

signal X,Y : std_logic_vector(1 downto 0);
signal z : std_logic_vector(3 downto 0);

begin

  u1 : q2 port map(X,Y,Z);

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    X<= "00"; Y<= "11";
    wait for 200 ps;
    assert(Z = "0000")  report "Falha em teste: 1" severity error;

    X<= "11"; Y<= "11";
    wait for 200 ps;
    assert(Z = "1001")  report "Falha em teste: 1" severity error;

    X<= "10"; Y<= "10";
    wait for 200 ps;
    assert(Z = "0100")  report "Falha em teste: 1" severity error;

    X<= "11"; Y<= "10";
    wait for 200 ps;
    assert(Z = "0110")  report "Falha em teste: 1" severity error;

    X<= "01"; Y<= "01";
    wait for 200 ps;
    assert(Z = "0001")  report "Falha em teste: 1" severity error;

    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;
