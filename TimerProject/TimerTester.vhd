----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:18:24 11/05/2019 
-- Design Name: 
-- Module Name:    TimerTester - Behavioral 
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

entity TimerTester is
	port(
		switches : in std_logic_vector(7 downto 0);
		CLK  : in std_logic;					
		LEDs : out std_logic_vector(7 downto 0)
	);

end TimerTester;

architecture Behavioral of TimerTester is
	component timer
		port(				
				Clk  : in std_logic;
				Start : in std_logic;
				Endtimer : out std_logic);
	end component;
		
				
begin

	Inst_timer : timer port map(
			Clk => CLK,
			Start => switches(3),
			Endtimer => LEDs(0)	
	);
	LEDs(1) <= '0';
	LEDs(2) <= '0';
	LEDs(3) <= '0';
	LEDs(4) <= '0';
	LEDs(5) <= '0';
	LEDs(6) <= '0';
	LEDs(7) <= switches(3);
	
	


end Behavioral;

