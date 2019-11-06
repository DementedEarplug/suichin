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
        test : in             std_logic;
		clk : in 			  std_logic;
        leds : out            std_logic_vector(7 downto 0);
        sendsms : out         std_logic;
        bell : out            std_logic;
        lights : out          std_logic
    );

end systemcontroller;

architecture Behavioral of systemcontroller is

    signal startdelay : std_logic := '0';
    signal enddelay : std_logic := '0';
	 signal sensors : std_logic;

    signal A : std_logic := '0';
    signal B : std_logic := '0';
    signal C : std_logic := '0';
    signal Da : std_logic;
    signal An : std_logic := '0';
    signal Db : std_logic;
    signal Bn : std_logic := '0';
    signal Dc : std_logic;
    signal Cn : std_logic := '0';
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

    component timer
        port(
            clk : in std_logic;
            Start : in std_logic;
            Endtimer : out std_logic
        );
    end component;
    

begin
    sensors <= (doors or windows);
    f1 <= (arm and not sensors and not frontdoor);
    f2 <= (not test and not sensors and arm);

    f3 <= (not test  and arm and sensors);
	 f4 <= (B and Cn);
    --f4 <= arm  and (windows or doors) and not frontdoor;
    --f5 <= not test and arm  and (windows  or doors ) and not frontdoor;
    --f6 <= not test and arm  and (windows  or doors ) and frontdoor;
	 
    Da <= (An and  Bn and Cn and f1 ) or (f4 and test) or (A and Bn  and not enddelay);
    Db <= (A and enddelay) or (f2 and B  and Cn ) or (f4 and test) or (f4 and f3 and frontdoor) or (B  and C and not enddelay) or (A  and B );
    Dc <= (An and C and arm) or (f3 and not frontdoor and An and B)  or (An and B and f3 and frontdoor) or (B and C);
	 
	 
    startdelay <= (A  and Bn  and Cn ) or  (An and B and C);


    leds(7) <= startdelay;
	leds(6) <= doors;
	leds(5) <= windows;
	leds(4) <= frontdoor;
	leds(3) <= arm;
    leds(0) <= C;
    leds(1) <= B;
    leds(2) <= A;

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

    Inst_delaytimer : timer port map(
        clk => clk,
        Start => startdelay,
        Endtimer => enddelay
    );


	 
end Behavioral;

