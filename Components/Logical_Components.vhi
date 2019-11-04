
-- VHDL Instantiation Created from source file Logical_Components.vhd -- 13:59:48 10/09/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Logical_Components
	PORT(
		a : IN std_logic;
		b : IN std_logic;
		c : IN std_logic;
		d : IN std_logic;
		switches : IN std_logic_vector(1 downto 0);          
		q : OUT std_logic;
		LEDs : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_Logical_Components: Logical_Components PORT MAP(
		a => ,
		b => ,
		c => ,
		d => ,
		switches => ,
		q => ,
		LEDs => 
	);


