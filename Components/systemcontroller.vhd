----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:36:24 10/29/2019 
-- Design Name: 
-- Module Name:    systemcontroller - Behavioral 
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

entity systemcontroller is
    port(
        arm : in              std_logic;
        doors : in            std_logic;
        windows : in          std_logic;
        frontdoor : in        std_logic;
        enddelay : in         std_logic;
        test : in             std_logic;
		clk : in 			  std_logic;
        leds : out            std_logic_vector(7 downto 0);
        sendsms : out         std_logic;
        bell : out            std_logic;
        lights : out          std_logic;
        startdelay : out      std_logic

    );

end systemcontroller;

architecture Behavioral of systemcontroller is

    signal A : std_logic := '0';
    signal B : std_logic := '0';
    signal C : std_logic := '0';
    signal Da : std_logic;
    signal An : std_logic;
    signal Db : std_logic;
    signal Bn : std_logic;
    signal Dc : std_logic;
    signal Cn : std_logic;
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

begin

    f1 <= (arm = '1' and (doors = '0' and windows = '0' and frontdoor = '0')) or (arm = '1' and (doors = '0' and windows = '0' and frontdoor = '1'));
    f2 <= (test = '0' and doors = '0' and windows = '0' and arm = '1') or (test = '1') or (test = '0' and arm = '1' and (windows = '1' or doors = '1') and frontdoor = '1');
    f3 <= (test = '0' and arm = '1' and (windows = '1' or doors = '1'));
    f4 <= arm = 1 and (windows = '1' or doors = '1') and frontdoor = '0';
    f5 <= test = '0' and arm = '1' and (windows = '1' or doors = '1') and frontdoor = '0';
    f6 <= test = '0' and arm = '1' and (windows = '1' or doors = '1') and frontdoor = '1';
	 
    Da <= (An= '1' and  Bn= '1' and Cn = '1' and f1 = '1') or (B = '1' and Cn = '1' and test = '1') or (A = '1' and Bn = '1' and enddelay = '1');
    Db <= (A = '1' and enddelay = '1') or (B = '1' and Cn = '1' and f2 = '1') or (B = '1' and C = '1' and enddelay = '0') or (A = '1' and B = '1');
    Dc <= (An = '1' and C = '1' and arm = '1') or (An = '1' and B = '1' and  f3 = '1') or (B = '1' and C = '1');

    startdelay <= (A = '1' and Bn = '1' and Cn = '1') or not(A = '1' and B = '1' and C = '1');

    Inst_DA : dflipflop port map(
        d => Da,
        clk => clk,
        q => A,
        nq => An
    );
	 
	 Inst_DB : dflipflop port map(
        d => Db,
        clk => clk,
        q => B,
        nq => Bn
    );
	 
	 Inst_DC : dflipflop port map(
        d => Dc,
        clk => clk,
        q => C,
        nq => Cn
    );
	 
end Behavioral;

