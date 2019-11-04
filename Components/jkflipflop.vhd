----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:00:29 10/09/2019 
-- Design Name: 
-- Module Name:    jkflipflop - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity jkflipflop is
    port(
          J : in std_logic;
          K : in std_logic;
          CLK : in std_logic;
          Q : out std_logic;
          nQ : out std_logic);
end jkflipflop;

architecture Behavioral of jkflipflop is

begin

    store : process(CLK)
    begin
        if rising_edge(CLK) then
            if J = 0 and K = 0 then
                Q <= Q;
            elsif J = 0 and K = 1 then
                Q <= 1;
                nQ <= 0;
            elsif J = 1 and K = 0 then 
                Q <= 0;
                nQ <= 1;
            else
                Q <= not Q;
                nQ <= not nQ;
            end if;
        end if;
    end process;               


end Behavioral;

