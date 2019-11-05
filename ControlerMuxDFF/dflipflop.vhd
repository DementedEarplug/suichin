----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:34:36 10/09/2019 
-- Design Name: 
-- Module Name:    dflipflop - Behavioral 
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

entity dflipflop is
    port(
            D : in std_logic;
            CLK : in std_logic;
            Q : out std_logic;
            nQ : out std_logic);
    
end dflipflop;

architecture Behavioral of dflipflop is

begin

    store : process(CLK)
    begin 
        if rising_edge(CLK) then 
          Q  <= D;
          nQ <= not D;
        end if;
    end process;



end Behavioral;

