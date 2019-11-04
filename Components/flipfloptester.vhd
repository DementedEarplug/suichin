library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


	

	

entity DFlipFlopTester is 
    port ( 
			switches : in std_logic_vector(7 downto 0);
			CLK : in std_logic;        
         LEDs: out std_logic_vector(7 downto 0));	
     

end DFlipFlopTester;


architecture Behavioral of DFlipFlopTester is

    
	 
	 component dflipflop
		  port(
				d : in std_logic;
				clk : in std_logic;
				q : out std_logic;
				nq : out std_logic
		  );
	 end component;
	 
	 
	 
begin    	
    
    Inst_dff: dflipflop port map( 
      
        d => switches(0),
        clk => CLK,
        q => LEDs(0),
        nq => LEDs(1)    
    ); 

	
end Behavioral;





