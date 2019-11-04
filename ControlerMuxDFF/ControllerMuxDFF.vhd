----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:15:13 11/04/2019 
-- Design Name: 
-- Module Name:    ControllerMuxDFF - Behavioral 
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

entity ControllerMuxDFF is
    Port ( arm : in  STD_LOGIC;
           doors : in  STD_LOGIC;
           windows : in  STD_LOGIC;
           frontdoor : in  STD_LOGIC;
           enddelay : in  STD_LOGIC;
           test : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           leds : out  STD_LOGIC_vector(7 downto 0);
           sendsms : out  STD_LOGIC;
           bell : out  STD_LOGIC;
           lights : out  STD_LOGIC;
           startdelay : out  STD_LOGIC);
end ControllerMuxDFF;

architecture Behavioral of ControllerMuxDFF is
	 
	 signal A : std_logic := '0';
    signal B : std_logic := '0';
    signal C : std_logic := '0';
    signal Da : std_logic;
    signal An : std_logic;
    signal Db : std_logic;
    signal Bn : std_logic;
    signal Dc : std_logic;
    signal Cn : std_logic;
	 signal MA0 : std_logic;
	 signal MA1 : std_logic;
	 signal MA2 : std_logic;
	 signal MA3 : std_logic;
	 signal MAout : std_logic;
	 signal MB0 : std_logic;
	 signal MB1 : std_logic;
	 signal MB2 : std_logic;
	 signal MB3 : std_logic;
	 signal MBout : std_logic;
	 signal MC0 : std_logic;
	 signal MC1 : std_logic;
	 signal MC2 : std_logic;
	 signal MC3 : std_logic;
	 signal MCout : std_logic;
	 signal sel : std_logic_vector (1 downto 0);
    signal f1 : std_logic;
    signal f2 : std_logic; 
    signal f3 : std_logic;
    signal f4 : std_logic;
    signal f5 : std_logic;
    signal f6 : std_logic;
	 
	 component dflipflop
    port(
          d : in std_logic;
          clk : in std_logic;
          q : out std_logic;
          nq : out std_logic
    );
    end component;
	 
	 component mux	Port(  
			  A : in std_logic;
           B : in  std_logic;
           C : in  std_logic;
           D : in  std_logic;
           Switches : in std_logic_vector(1 downto 0);
           Q : out  std_logic;
           Leds: out std_logic_vector(3 downto 0));
	
	end component;

begin


end Behavioral;

