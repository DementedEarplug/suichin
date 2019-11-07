----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:18:55 11/05/2019 
-- Design Name: 
-- Module Name:    timer - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity timer is
	port(		
		clk  : in std_logic;
		start : in std_logic;
		timelimit : in std_logic_vector(27 downto 0);
		endtimer : out std_logic		
	);
	
end timer;

architecture Behavioral of timer is

	
	signal count: std_logic_vector(27 downto 0) :=    "0000000000000000000000000000";

begin
	
	counter : process(clk)
	begin 
		if rising_edge(clk) then
			if(start = '1') then
				if(count = timelimit-1) then					
					endtimer <= '1';
				else 
					count <= count + 1;
				end if;
				
			elsif(start = '0') then 
				endtimer <= '0';
				count <= "0000000000000000000000000000";
			end if;
			
		end if;
		
	end process;
		


end Behavioral;

