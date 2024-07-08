//emu-help tool created by jujstme - https://github.com/Jujstme

state("LiveSplit") {}

startup
{
	//Creates a persistent instance of the PS2 class (for PS2 emulators)
	//If you want to change it to another emulator type, change the "PS2" to say "PS1" if the splitter is for a PS1 Emu game
	Assembly.Load(File.ReadAllBytes("Components/emu-help-v2")).CreateInstance("PS2");
	
	//This allows is to look through a bitmask in order to get split information
	vars.bitCheck = new Func<byte, int, bool>((byte val, int b) => (val & (1 << b)) != 0);
	
	// You can look up for known IDs on https://psxdatacenter.com/
	vars.Helper.Load = (Func<dynamic, bool>)(emu => 
    {
		//Address of Gamecode (This can be multiple addresses in some cases but it seems this is all 1 for the Subsistence disks)
		emu.MakeString("UGamecode", 11, 0x20C0C8);		//SLUS_212.43, SLUS_213.59
		emu.MakeString("PGamecode", 11, 0x20CC8C);		//SLES_820.43,
		emu.MakeString("JGamecode", 11, 0x20BE0C);		//SLPM_662.21
		emu.MakeString("JAGamecode", 11, 0x20BEC8);		//SLPM_667.95
		//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		//Metal Gear 2: Solid Snake
		emu.Make<byte>("PEF_GameState", 0x26DCCC);
		//Playthrough Info
		emu.Make<uint>("PEF_IGT", 0x26DB28);
		emu.Make<uint>("PEF_Ration", 0x26DB2C);
		emu.Make<uint>("PEF_Kills", 0x26DB30);
		emu.Make<uint>("PEF_Alert", 0x26DB34);
		emu.Make<uint>("PEF_Special", 0x26DB38);
		emu.Make<uint>("PEF_Save", 0x26DB3C);
		emu.Make<uint>("PEF_Continue", 0x26DB40);
		emu.Make<byte>("PEF_Diff", 0x17A9C94);
		//Items In Inventory Bits
		emu.Make<byte>("PEF_EQ1", 0x17A9C30);
		emu.Make<byte>("PEF_EQ2", 0x17A9C31);
		emu.Make<byte>("PEF_EQ3", 0x17A9C34);
		emu.Make<byte>("PEF_EQ4", 0x17A9C35);
		emu.Make<byte>("PEF_EQ5", 0x17A9C36);
		emu.Make<byte>("PEF_EQ6", 0x17A9C37);
		//Event Flags for Bosses & Story
		emu.Make<byte>("PEF_EV2", 0x26E099);
		emu.Make<byte>("PEF_EV3", 0x26E09A);
		emu.Make<byte>("PEF_EV4", 0x26E09B);
		emu.Make<byte>("PEF_EV5", 0x26E09C);
		emu.Make<byte>("PEF_EV6", 0x26E09D);
		emu.Make<byte>("PEF_EV7", 0x26E09E);
		emu.Make<byte>("PEF_EV8", 0x26E09F);
		emu.Make<byte>("PEF_EV9", 0x26E0A0);
		emu.Make<byte>("PEF_EV10", 0x26E0A1);
		emu.Make<byte>("PEF_EV11", 0x26E0A2);
		//Codecs Data
		emu.Make<byte>("PEF_CodecsCalled", 0x26E0AD);
		//Location Data
		emu.Make<uint>("PEF_AREA",0x26DD94);
		emu.Make<uint>("PEF_SUBAREA",0x26DD98);
		
		//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		//These are for the NTSCU (American) Version of the game
		//Metal Gear 2: Solid Snake
		emu.Make<byte>("U_GameState", 0x26AF94);
		//Playthrough Info
		emu.Make<uint>("U_IGT", 0x26ADF0);
		emu.Make<uint>("U_Ration", 0x26ADF4);
		emu.Make<uint>("U_Kills", 0x26ADF8);
		emu.Make<uint>("U_Alert", 0x26ADFC);
		emu.Make<uint>("U_Special", 0x26AE00);
		emu.Make<uint>("U_Save", 0x26AE04);
		emu.Make<uint>("U_Continue", 0x26AE08);
		emu.Make<byte>("U_Diff", 0x17A6BE4);
		//Items In Inventory Bits
		emu.Make<byte>("U_EQ1", 0x17A6B80);
		emu.Make<byte>("U_EQ2", 0x17A6B81);
		emu.Make<byte>("U_EQ3", 0x17A6B84);
		emu.Make<byte>("U_EQ4", 0x17A6B85);
		emu.Make<byte>("U_EQ5", 0x17A6B86);
		emu.Make<byte>("U_EQ6", 0x17A6B87);
		//Event Flags for Bosses & Story
		emu.Make<byte>("U_EV2", 0x26B361);
		emu.Make<byte>("U_EV3", 0x26B362);
		emu.Make<byte>("U_EV4", 0x26B363);
		emu.Make<byte>("U_EV5", 0x26B364);
		emu.Make<byte>("U_EV6", 0x26B365);
		emu.Make<byte>("U_EV7", 0x26B366);
		emu.Make<byte>("U_EV8", 0x26B367);
		emu.Make<byte>("U_EV9", 0x26B368);
		emu.Make<byte>("U_EV10", 0x26B369);
		emu.Make<byte>("U_EV11", 0x26B36A);
		//Codecs Data
		emu.Make<byte>("U_CodecsCalled", 0x26B375);
		//Location Data
		emu.Make<uint>("U_AREA",0x26b05c);
		emu.Make<uint>("U_SUBAREA",0x26b060);

		//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		//These are for the JPN (Japanese) Version of the game
		//Metal Gear 2: Solid Snake
		emu.Make<byte>("J_GameState", 0x26A67C);
		//Playthrough Info
		emu.Make<uint>("J_IGT", 0x26A4D8);
		emu.Make<uint>("J_Ration", 0x26A4DC);
		emu.Make<uint>("J_Kills", 0x26A4E0);
		emu.Make<uint>("J_Alert", 0x26A4E4);
		emu.Make<uint>("J_Special", 0x26A4E8);
		emu.Make<uint>("J_Save", 0x26A4EC);
		emu.Make<uint>("J_Continue", 0x26A4F0);
		emu.Make<byte>("J_Diff", 0x1457B94);
		//Items In Inventory Bits
		emu.Make<byte>("J_EQ1", 0x1457B30);
		emu.Make<byte>("J_EQ2", 0x1457B31);
		emu.Make<byte>("J_EQ3", 0x1457B34);
		emu.Make<byte>("J_EQ4", 0x1457B35);
		emu.Make<byte>("J_EQ5", 0x1457B36);
		emu.Make<byte>("J_EQ6", 0x1457B37);
		//Event Flags for Bosses & Story
		emu.Make<byte>("J_EV2", 0x26AA49);
		emu.Make<byte>("J_EV3", 0x26AA4A);
		emu.Make<byte>("J_EV4", 0x26AA4B);
		emu.Make<byte>("J_EV5", 0x26AA4C);
		emu.Make<byte>("J_EV6", 0x26AA4D);
		emu.Make<byte>("J_EV7", 0x26AA4E);
		emu.Make<byte>("J_EV8", 0x26AA4F);
		emu.Make<byte>("J_EV9", 0x26AA50);
		emu.Make<byte>("J_EV10", 0x26AA51);
		emu.Make<byte>("J_EV11", 0x26AA52);
		//Codecs Data
		emu.Make<byte>("J_CodecsCalled", 0x26AA5D);
		//Location Data
		emu.Make<uint>("J_AREA",0x26A744);
		emu.Make<uint>("J_SUBAREA",0x26A748);
		
		//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		//These are for the JPN (Japanese 20th Anniversary) Version of the game
		//Metal Gear 2: Solid Snake
		emu.Make<byte>("JA_GameState", 0x26A5FC);
		//Playthrough Info
		emu.Make<uint>("JA_IGT", 0x26A458);
		emu.Make<uint>("JA_Ration", 0x26A45C);
		emu.Make<uint>("JA_Kills", 0x26A460);
		emu.Make<uint>("JA_Alert", 0x26A464);
		emu.Make<uint>("JA_Special", 0x26A468);
		emu.Make<uint>("JA_Save", 0x26A46C);
		emu.Make<uint>("JA_Continue", 0x26A470);
		emu.Make<byte>("JA_Diff", 0x1457B94);
		//Items In Inventory Bits
		emu.Make<byte>("JA_EQ1", 0x1457B30);
		emu.Make<byte>("JA_EQ2", 0x1457B31);
		emu.Make<byte>("JA_EQ3", 0x1457B34);
		emu.Make<byte>("JA_EQ4", 0x1457B35);
		emu.Make<byte>("JA_EQ5", 0x1457B36);
		emu.Make<byte>("JA_EQ6", 0x1457B37);
		//Event Flags for Bosses & Story
		emu.Make<byte>("JA_EV2", 0x26A9C9);
		emu.Make<byte>("JA_EV3", 0x26A9CA);
		emu.Make<byte>("JA_EV4", 0x26A9CB);
		emu.Make<byte>("JA_EV5", 0x26A9CC);
		emu.Make<byte>("JA_EV6", 0x26A9CD);
		emu.Make<byte>("JA_EV7", 0x26A9CE);
		emu.Make<byte>("JA_EV8", 0x26A9CF);
		emu.Make<byte>("JA_EV9", 0x26A9D0);
		emu.Make<byte>("JA_EV10", 0x26A9D1);
		emu.Make<byte>("JA_EV11", 0x26A9D2);
		//Codecs Data
		emu.Make<byte>("JA_CodecsCalled", 0x26A9DD);
		//Location Data
		emu.Make<uint>("JA_AREA",0x26A6C4);
		emu.Make<uint>("JA_SUBAREA",0x26A6C8);
		return true;
    });
	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	//Metal Gear 2: Solic Snake variables we can make settings from
	vars.KeyID = new List<string>(){
	"EQ5_1", "EQ5_2", "EQ5_3", "EQ5_4", "EQ5_5", "EQ5_6", "EQ5_7", "EQ6_0", "EQ6_1", "EQ6_2", "EQ6_3", "EQ6_4"};
	
	vars.KeySet = new List<string>(){
	"Card 1", "Card 2", "Card 3", "Card 4", "Card 5", "Card 6", "Card 7", "Card 8", "Card 9", "Red Card (1-3)", "Blue Card (4-6", "Green Card (7-9)"};
	
	vars.GunID = new List<string>(){
	"EQ1_0", "EQ1_1", "EQ1_2", "EQ1_3", "EQ1_4", "EQ1_5", "EQ1_6", "EQ1_7", "EQ2_0", "EQ2_1", "EQ2_2", "EQ2_4"};
	
	vars.GunSet = new List<string>(){
	"Handgun", "Submachine Gun", "Grenades", "Stinger Missiles", "RC Missiles", "Plastic Explosives", "Land Mines", "Camoflage Mat", "Gas Grenade", "Mouse", "Lighter", "Suppressor"};
	
	vars.ItemID = new List<string>(){
	"EQ3_2", "EQ3_3", "EQ3_4", "EQ3_5", "EQ3_6", "EQ3_7", "EQ4_0", "EQ4_1", 
	"EQ4_2", "EQ4_3", "EQ4_4", "EQ4_5", "EQ4_6", "EQ4_7", "EQ5_0", "EQ6_5", "EQ6_6"};
	
	vars.ItemSet = new List<string>(){
	"Binoculars", "Night-Vision Goggles", "Infrared Goggles", "Gas Mask", "Body Armour", "Oxygen Tank", "Mine Detector", 
	"Hang Glider", "Cardboard Box", "Bucket", "Cold Medicine", "Cassette Tape", "Egg (Snake)", "Egg (Owl)", "Brooch", "Spray", "Cartridge"};
	
	vars.BossID = new List<string>(){
	"EV2_0", "EV2_1", "EV2_7", "EV3_0", "EV3_4", "EV3_5", "EV4_3", "EV4_4",
	"EV7_2", "EV7_3", "EV7_6", "EV7_7", "EV8_6", "EV8_7", "EV9_4", "EV9_5",
	"EV10_3", "EV10_4", "EV10_6",  "EV10_7", "EV11_0", "EV11_3"};
	
	vars.BossSet = new List<string>(){
	"Started Black Ninja", "Defeated Black Ninja", "Started Running Man", "Defeated Running Man", "Started Hind D", "Defeated Hind D", "Started Red Blaster", "Defeated Red Blaster",
	"Started Four Horsemen", "Deafeated Four Horsemen", "Started Jungle Evil", "Defeated Jungle Evil", "Started Night Fright", "Defeated Night Fright", "Started Traitor Encounter", "Defeated Traitor",
	"Started Metal Gear D", "Defeated Metal Gear D", "Started Gray Fox", "Defeated Gray Fox", "Started Big Boss", "Defeated Big Boss"};

	vars.EventID = new List<string>(){
	"EV2_3", "EV2_6", "EV4_2", "EV5_1", "EV5_2", "EV5_3", "EV5_6", "EV6_3", "EV7_5", "EV8_5", "EV11_4"};
	
	vars.EventSet = new List<string>(){
	"Green Beret Tailed", "Contacted Dr. Madnar", "Rescued Holly", "Grabbed Pidgeon", "Contacted Dr. Marv", "Contacted Dr. Madnar about Marv", "Met Up With Gustava", "Bridge Destroyed", "Glided Across Crevice", "Entered Prison", "Meet up with Holly For Escape"};

	vars.CodecsID = new List<string>(){
	"CodecsCalled_0", "CodecsCalled_1", "CodecsCalled_2", "CodecsCalled_3", "CodecsCalled_4", "CodecsCalled_5", "CodecsCalled_6", "CodecsCalled_7"};

	vars.CodecsSet = new List<string>(){
	"Campbell" , "Holly", "Master Miller", "Kasler", "Jacobsen", "Dr. Madnar", "Marv", "Your Number One Fan"};

	vars.Rank = "";
	vars.Difficulty = "";
	// new easier Story Flag variable
	vars.Storyflag = 0;

	vars.StoryflagList = new List<string>(){
		"EV2_0", "EV2_1", "EV2_3", "EV2_6", "EQ1_6", "EV2_7", "EV3_0", "EV3_4", "EV3_5", "EV4_2",
		"EV4_3", "EV4_4", "EV5_1", "EV5_2", "EV5_3", "EV5_6", "EQ5_5", "EV6_3", "EQ4_2", "EV7_2",
		"EV7_3", "EV7_5", "EV7_6", "EV7_7", "EV8_5", "EV8_6", "EV8_7", "EQ6_1", "EV9_4", "EV9_5",
		"EV10_3", "EV10_4", "EV10_6", "EV10_7", "EV11_0", "EV11_3", "EV11_4"};
	/*
	Storyflag = 0 -> Start of game
	Storyflag = 1 -> Black Ninja started
	Storyflag = 2 -> Black Ninja defeated
	Storyflag = 3 -> Green Berret tailed
	Storyflag = 4 -> Dr. Madnar contacted
	Storyflag = 5 -> Land Mines Acquired
	Storyflag = 6 -> Running Man started
	Storyflag = 7 -> Running Man defeated
	Storyflag = 8 -> Hind D started
	Storyflag = 9 -> Hind D defeated
	Storyflag = 10 -> Holly rescued
	Storyflag = 11 -> Red Blaster started
	Storyflag = 12 -> Red Blaster defeated
	Storyflag = 13 -> Pidgeon grabbed
	Storyflag = 14 -> Dr Marv contacted 
	Storyflag = 15 -> Dr Madnar contacted again
	Storyflag = 16 -> Gustava met
	Storyflag = 17 -> Dr Mandar met
	Storyflag = 18 -> Bridge exploded
	Storyflag = 19 -> Glider acquired
	Storyflag = 20 -> Four Horsemen started
	Storyflag = 21 -> Four Horsemen deafeated
	Storyflag = 22 -> Crevice Flight taken
	Storyflag = 23 -> Jungle Evil started
	Storyflag = 24 -> Jungle Evil deafeated
	Storyflag = 25 -> Prison Entered
	Storyflag = 26 -> Night Fright started
	Storyflag = 27 -> Night Fright defeated
	Storyflag = 28 -> Level 9 Card acquired
	Storyflag = 29 -> Traitor started
	Storyflag = 30 -> Traitor defeated
	Storyflag = 31 -> Metal Gear D started
	Storyflag = 32 -> Metal Gear D defeated
	Storyflag = 33 -> Gray Fox started
	Storyflag = 34 -> Gray Fox defeated
	Storyflag = 35 -> Big Boss started
	Storyflag = 36 -> Big Boss defeated
	Storyflag = 37 -> Met up with Holly
	*/

	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	//Metal Gear 2: Solid Snake Splits
	settings.Add("Item", false, "Splits On Equipment & Weapons Entering Inventory");
	settings.CurrentDefaultParent = "Item";
	
	settings.Add("Key", false, "Key Cards");
		settings.CurrentDefaultParent = "Key";
		for(int i = 0; i < 12; i++){
        	settings.Add("" + vars.KeyID[i].ToString(), false, "" + vars.KeySet[i].ToString());
    	}
	settings.CurrentDefaultParent = "Item";
	
	settings.Add("Gun", false, "Weapons");
		settings.CurrentDefaultParent = "Gun";
		for(int i = 0; i < 12; i++){
        	settings.Add("" + vars.GunID[i].ToString(), false, "" + vars.GunSet[i].ToString());
    	}
	settings.CurrentDefaultParent = "Item";
	
	settings.Add("Items", false, "General Items");
		settings.CurrentDefaultParent = "Items";
		for(int i = 0; i < 17; i++){
        	settings.Add("" + vars.ItemID[i].ToString(), false, "" + vars.ItemSet[i].ToString());
    	}
		settings.CurrentDefaultParent = null;;
	
	settings.Add("Boss", false, "Splits On Boss Kills");
		settings.CurrentDefaultParent = "Boss";
		for(int i = 0; i < 22; i++){
        	settings.Add("" + vars.BossID[i].ToString(), true, "" + vars.BossSet[i].ToString());

    	}
		settings.CurrentDefaultParent = null;
	
	settings.Add("StoryFlags", false, "Splits On Completing Story Flags");
		settings.CurrentDefaultParent = "StoryFlags";
		for(int i = 0; i < 11; i++){
        	settings.Add("" + vars.EventID[i].ToString(), true, "" + vars.EventSet[i].ToString());
    	}
		settings.CurrentDefaultParent = null;

	settings.Add("Codecs", false, "Splits On Completing Codecs List");
		settings.CurrentDefaultParent = "Codecs";
		for(int i = 0; i < 8; i++){
        	settings.Add("" + vars.CodecsID[i].ToString(), false, "" + vars.CodecsSet[i].ToString());
    	}
		settings.CurrentDefaultParent = null;
		

	settings.Add("Locations", false, "Splits On Arriving at a specific location");

	settings.CurrentDefaultParent = "Locations";
	settings.Add("MapChanges", false, "Splits On Entering Specific Maps");
	settings.CurrentDefaultParent = "MapChanges";

	// Map Changes before having beaten Black Ninja
	settings.Add("1_0_0", false, "Zansibar Exterior -> Zansibar 1F");
	settings.SetToolTip("1_0_0", "Split on entering the Zansibar Building from the outside one time");
	settings.Add("2_1_0", false, "Zansibar 1F -> Zansibar 2F pre Black Ninja");
	settings.SetToolTip("2_1_0", "Split on entering the Zansibar Building 2F from Zansibar Building 1F one time before fighting Black Ninja");
	settings.Add("3_2_0", false, "Zansibar 2F -> Zansibar 3F pre Black Ninja");
	settings.SetToolTip("3_2_0", "Split on entering the Zansibar Building 3F from Zansibar Building 2F one time before fighting Black Ninja");
	
	// Map Changes after having beaten Black Ninja
	settings.Add("1_3_2", false, "Zansibar 3F -> Zansibar 1F post Black Ninja");
	settings.SetToolTip("1_3_2", "Split on entering the Zansibar Building 1F from Zansibar Building 3F one time after having fought Black Ninja");
	
	// Map Changes before having tailed Green Berret
	settings.Add("7_1_2", false, "Zansibar 1F -> Lost Woods/Desert pre Green Berret Tailed");
	settings.SetToolTip("7_1_2", "Split on entering Lost Woods from Zansibar Building 1 one time before having trailed Green Berret Guard");
	
	// Map Changes before having beaten Running Man
	settings.Add("1_7_7", false, "Lost Woods/Desert -> Zansibar 1F post Running Man");
	settings.SetToolTip("1_7_7", "Split on Zansibar Building 1 from Lost Woods one time after having fought Running Man");

	// Map Changes before having saved Holly
	settings.Add("11_9_9", false, "Tower Outside -> Tower 1F pre Saving Holly");
	settings.SetToolTip("11_9_9", "Split on entering Tower 1F from Tower Outside one time before having saved Holly");
	settings.Add("6_11_9", false, "Tower 1F -> Sewers pre Saving Holly");
	settings.SetToolTip("6_11_9", "Split on entering Sewers from Tower 1F one time before having saved Holly");
	
	// Map Changes before having beaten Red Blaster
	settings.Add("5_6_10", false, "Sewers > Zansibar Building B2 pre Red Blaster");
	settings.SetToolTip("5_6_10", "Split on entering Zansibar Building B2 from Sewers one time before having beaten Red Blaster");
	settings.Add("6_5_10", false, "Zansibar Building B2 > Sewers pre Red Blaster");
	settings.SetToolTip("6_5_10", "Split on entering Sewers from Zansibar Building B2 one time before having beaten Red Blaster");
	settings.Add("11_6_10", false, "Sewers > Tower 1F pre Red Blaster");
	settings.SetToolTip("11_6_10", "Split on entering Tower 1F from Sewers one time before having beaten Red Blaster");
	settings.Add("14_11_10", false, "Tower 1F > Tower 30F pre Red Blaster");
	settings.SetToolTip("14_11_10", "Split on entering Tower 1F from Sewers one time before having beaten Red Blaster");

	// Map Changes before meeting Gustava
	settings.Add("11_14_15", false, "Tower 30F > Tower 1F pre Gustava meetup");
	settings.SetToolTip("11_14_15", "Split on Tower 1F From Tower 30F one time before meeting with Gustava");
	settings.Add("6_11_15", false, "Tower 1F > Sewers pre Gustava meetup");
	settings.SetToolTip("6_11_15", "Split on Sewers From Tower 1F one time before meeting with Gustava");
	settings.Add("2_6_15", false, "Zansibar Build. Sewers > Zansibar Build. 2F pre Gustava meetup");
	settings.SetToolTip("2_6_15", "Split on Zansibar Build. 2F From Zansibar Build. Sewers one time before meeting with Gustava");
	settings.Add("4_2_15", false, "Zansibar Build. 2F > Zansibar Build. 4F pre Gustava meetup");
	settings.SetToolTip("4_2_15", "Split on Zansibar Build. 4F from Zansibar Build. 2F one time before meeting with Gustava");

	// Map Changes after having met Gustava
	settings.Add("8_4_16", false, "Zansibar Build. 2F > Zansibar Build. 4F post Gustava meetup");
	settings.SetToolTip("8_4_16", "Split on Zansibar Build. 4F from Zansibar Build. 2F one time after meeting with Gustava");

	// Map Changes after having met Dr. Madnar
	settings.Add("15_8_17", false, "Zansibar Build. B3 > Crevice North post Madnar meetup");
	settings.SetToolTip("15_8_17", "Split on Crevice North from Zansibar Build. B3 one time before meeting with Madnar");

	// Map Changes after having Bridge explosion happen
	settings.Add("11_15_18", false, "Crevice North > Tower 1F Post Bridge Cutscene");
	settings.SetToolTip("11_15_18", "Split on Tower 1F from Crevice North one time before meeting with Gustava");
	settings.Add("9_11_18", false, "Tower 1F > Tower Outside Post Bridge Cutscene");
	settings.SetToolTip("9_11_18", "Split on Tower Outside from Tower 1F one time before meeting with Gustava");
	settings.Add("7_9_18", false, "Tower 1F > Singing Sands Post Bridge Cutscene");
	settings.SetToolTip("7_9_18", "Split on Singing Sands from Tower Outside one time before meeting with Gustava");
	settings.Add("1_7_18", false, "Singing Sands > Zansibar Building 1F Post Bridge Cutscene");
	settings.SetToolTip("1_7_18", "Split on Zansibar Build. 1F from Singing Sands one time before meeting with Gustava");

	// Map Changes after acquiring hang glider
	settings.Add("4_1_19", false, "Zansibar Build. 1F > Zansibar Build. 4F Post Hang Glider acquisition");
	settings.SetToolTip("4_1_19", "Split on Zansibar Build. 4F from Zansibar Build. 1F one time after acquiring the hang glider");
	settings.Add("8_4_19", false, "Zansibar Build. 4F > Zansibar Build. B3 Post Hang Glider acquisition");
	settings.SetToolTip("8_4_19", "Split on Zansibar Build. B4 from Zansibar Build. 4F one time after acquiring the hang glider");
	settings.Add("15_8_19", false, "Zansibar Build. B3 > Crevice North Post Hang Glider acquisition");
	settings.SetToolTip("15_8_19", "Split on Crevice North from Zansibar Build. B3 one time after acquiring the hang glider");
	settings.Add("11_15_19", false, "Crevice North > Tower 1F Post Hang Glider acquisition");
	settings.SetToolTip("11_15_19", "Split on Tower 1F from Crevice North one time after acquiring the hang glider");

	// Map Changes after having beaten four horsemen
	settings.Add("12_11_21", false, "Tower 1F > Tower 10F post Four Horsemen");
	settings.SetToolTip("12_11_21", "Split on Tower 10F from Tower 1F one time after having fought four Horsemen");
	settings.Add("16_12_21", false, "Tower 10F > Tower Stair Chase post Four Horsemen");
	settings.SetToolTip("16_12_21", "Split on Tower Stair Chase one time after having fought four Horsemen");
	settings.Add("13_16_21", false, "Tower Stair Chase > Tower 20F post Four Horsemen");
	settings.SetToolTip("13_16_21", "Split on entering Tower 20F after Tower Stair Chase one time after having fought four Horsemen");

	// Map Changes before fighting jungle evil
	settings.Add("10_15_22", false, "Crevice North > Grass Fields pre Jungle Evil");
	settings.SetToolTip("10_15_22", "Split on entering Grass Fields after Crevice North one time before having fought Jungle Evil");

	// Map Changes after fighting jungle evil
	settings.Add("15_10_24", false, "Bio Lab > Crevice North after Jungle Evil");
	settings.SetToolTip("15_10_24", "Split on entering Crevice North after Bio Lab one time after having fought Night Fright");
	settings.Add("10_15_24", false, "Crevice North > Prison Camp after Jungle Evil");
	settings.SetToolTip("10_15_24", "Split on entering Prison Camp after Crevice North one time after having fought Night Fright");

	// Map Changes before fighting Night Fright
	settings.Add("19_10_24", false, "Bio Lab > Crevice North after Jungle Evil");
	settings.SetToolTip("19_10_24", "Split on entering Crevice North after Bio Lab one time after having fought Night Fright");

	// Map Changes after fighting night fright
	settings.Add("10_19_27", false, "Prison Camp B3 > 1F after Night Fright");
	settings.SetToolTip("10_19_27", "Split on entering Prison Camp 1F after Prison Camp B3 one time after having fought Night Fright");
	settings.Add("15_10_27", false, "Prison Camp 1F > Crevice North after Night Fright");
	settings.SetToolTip("15_10_27", "Split on entering Crevice North after Prison Camp 1F one time after having fought Night Fright");

	// Map Changes after acquiring Level 9 Card
	settings.Add("15_10_28", false, "Prison Camp 1F > Crevice North after acquiring Level 9 Card");
	settings.SetToolTip("15_10_28", "Split on entering Crevice North after Prison Camp 1F one time after acquiring Level 9 Card");
	settings.Add("19_10_28", false, "Prison Camp B3 > 1F after acquiring Level 9 Card");
	settings.SetToolTip("19_10_28", "Split on entering Prison Camp 1F after Prison Camp B3 one time after acquiring Level 9 Card");

	// Map Changes after beating Dr. Madnar
	settings.Add("18_19_30", false, "Prison Camp B3 > Underground Base after beating the traitor");
	settings.SetToolTip("18_19_30", "Split on entering Underground Base after Prison Camp B3 one time after beating the traitor");

	// Map Changes after having met Holly
	settings.Add("17_18_37", false, "Underground Base > Jungle Escape after meeting with Holly");
	settings.SetToolTip("17_18_37", "Split on Jungle Escape after Prison Camp B3 one time after meeting with Holly");

	settings.CurrentDefaultParent = "Locations";
	settings.Add("RoomChanges", false, "Splits On Entering Specific Rooms");
	settings.CurrentDefaultParent = "RoomChanges";
	settings.Add("7_8_7_5", false, "Start Swamp Area Going To Running Man");
	settings.Add("7_9_4_5", false, "Finish Swamp Area Going To Running Man");
	settings.Add("7_4_9_7", false, "Start Swamp Area Coming From Running Man");
	settings.Add("7_7_8_7", false, "Finish Swamp Area Coming From Running Man");
	settings.Add("5_1_4_10", false, "Entering Armory 1st time before Red Blaster");
	settings.Add("5_4_1_10", false, "Leaving Armory 1st time before Red Blaster");
	settings.Add("5_1_4_2", false, "Entering Armory 2nd time after Red Blaster");
	settings.Add("5_4_1_2", false, "Leaving Armory 2nd time after Red Blaster");
	settings.Add("14_7_12", false, "Entering Tower 31F Rooftop");
	settings.Add("4_26_8_19", false, "Entering Freezer to Freeze Brooch");
	settings.Add("4_9_14_19", false, "Entering Sauna to Heat Brooch");
	settings.Add("13_4_5_21", false, "Reach Tower Jump Point");
	settings.Add("17_5_4_37", false, "Reach Final Screen");
	settings.CurrentDefaultParent = null;


	settings.Add("Final", true, "Final Split (Always Active)");
	settings.CurrentDefaultParent = null;
}

init
{
	//This is used for our splits
	vars.completedSplits = new HashSet<string>();
	vars.Storyflagqueue = new HashSet<string>();
}

update
{
	// get a casted (to dictionary) reference to current
	// so we can manipulate it using dynamic keynames
	var cur = current as IDictionary<string, object>;

	// list of pc address names to be recreated when on emu
	var names = new List<string>() { 
		"GameState",
		"IGT",
		"Ration",
		"Kills",
		"Alert",
		"Special",
		"Save",
		"Continue",
		"Diff",
		"EQ1",
		"EQ2",
		"EQ3",
		"EQ4",
		"EQ5",
		"EQ6",
		"EV2",
		"EV3",
		"EV4",
		"EV5",
		"EV6",
		"EV7",
		"EV8",
		"EV9",
		"EV10",
		"EV11",
		"CodecsCalled",
		"AREA",
		"SUBAREA"
	};

	// (placeholder) have some logic to work out the version and create the prefix
	string ver = null;

	// assign version based on gamecode
	if (current.PGamecode == "SLES_820.43") ver = "PEF_";
	else if (current.UGamecode == "SLUS_212.43") ver = "U_";
	else if (current.JGamecode == "SLPM_662.21") ver = "J_";
	else if (current.JAGamecode == "SLPM_667.95") ver = "JA_";

	// if in a supported version of the game...
	if (ver == null) return false;
	// loop through each desired address...
	foreach(string name in names) {
		// set e.g. current.GameTime to the value at e.g. current.US_GameTime
		cur[name] = cur[ver + name];
	}

	//function to display the current rank
	if(current.IGT>=1296000) {
		vars.Rank = "Chicken";
	} else if ((current.IGT>971999)&&(current.IGT<1296000)) {
		vars.Rank = "Turtle";
	} else if ((current.IGT>809999)&&(current.IGT<=971999)) {
		vars.Rank = "Hippopotamus";
	} else if ((current.IGT>647999)&&(current.IGT<=809999)) {
		vars.Rank = "Elephant";
	} else if ((current.IGT>431999)&&(current.IGT<=647999)) {
		vars.Rank = "Deer";
	} else if (current.Kills >= 11) {
		vars.Rank = "Zebra";
	} else if (current.Kills < 11) {
		if ((current.IGT>215999)&&(current.IGT<=431999)) {
			vars.Rank = "Zebra";
		} else if ((current.IGT>135499)&&(current.IGT<=215999)) {
			vars.Rank = "Jackal";
		} else if ((current.IGT>94499)&&(current.IGT<=135499)) {
			vars.Rank = "Panther";
		} else if ((current.Kills > 5) ||(current.Continue > 0) || (current.Alert > 6) ||(current.Ration > 0) || (current.Special == 1)) {
			vars.Rank = "Eagle";
		} else {
			if (current.Diff == 1) {
			vars.Rank = "Fox";
			} else {
			vars.Rank = "Big Boss";
			}
		}
	}

	vars.Difficulty = current.Diff == 0?"Original":"Easy";
}

onStart
{
	//resets the splits bools when a new run starts
	vars.completedSplits.Clear();
	vars.Storyflagqueue.Clear();
	vars.Storyflag = 0;
}

start
{
	return current.GameState != 8 && old.GameState == 8 && current.IGT > old.IGT;
}

split
{
	string setting = "";
	//Iterates through our splits and checks the bitmask for each one
	for(int i = 7; i > -1; i--){
		if(current.EQ1 != old.EQ1 && vars.bitCheck(current.EQ1, i)){
			setting = "EQ1_" + i;
		}
		if(current.EQ2 != old.EQ2 && vars.bitCheck(current.EQ2, i)){
			setting = "EQ2_" + i;
		}
		if(current.EQ3 != old.EQ3 && vars.bitCheck(current.EQ3, i)){
			setting = "EQ3_" + i;
		}
		if(current.EQ4 != old.EQ4 && vars.bitCheck(current.EQ4, i)){
			setting = "EQ4_" + i;
		}
		if(current.EQ5 != old.EQ5 && vars.bitCheck(current.EQ5, i)){
			setting = "EQ5_" + i;
		}
		if(current.EQ6 != old.EQ6 && vars.bitCheck(current.EQ6, i)){
			setting = "EQ6_" + i;
		}
		if(current.EV2 != old.EV2 && vars.bitCheck(current.EV2, i)){
			setting = "EV2_" + i;
		}
		if(current.EV3 != old.EV3 && vars.bitCheck(current.EV3, i)){
			setting = "EV3_" + i;
		}
		if(current.EV4 != old.EV4 && vars.bitCheck(current.EV4, i)){
			setting = "EV4_" + i;
		}
		if(current.EV5 != old.EV5 && vars.bitCheck(current.EV5, i)){
			setting = "EV5_" + i;
		}
		if(current.EV6 != old.EV6 && vars.bitCheck(current.EV6, i)){
			setting = "EV6_" + i;
		}
		if(current.EV7 != old.EV7 && vars.bitCheck(current.EV7, i)){
			setting = "EV7_" + i;
		}
		if(current.EV8 != old.EV8 && vars.bitCheck(current.EV8, i)){
			setting = "EV8_" + i;
		}
		if(current.EV9 != old.EV9 && vars.bitCheck(current.EV9, i)){
			setting = "EV9_" + i;
		}
		if(current.EV10 != old.EV10 && vars.bitCheck(current.EV10, i)){
			setting = "EV10_" + i;
		}
		if(current.EV11 != old.EV11 && vars.bitCheck(current.EV11, i)){
			setting = "EV11_" + i;
		}
		if(current.CodecsCalled != old.CodecsCalled && vars.bitCheck(current.CodecsCalled, i)){
			setting = "CodecsCalled_" + i;
		}
		//up story flag regardless if split condition is met
		if (setting.Length > 0 && (vars.StoryflagList.IndexOf(setting) > -1 && vars.StoryflagList.IndexOf(setting) > vars.Storyflag -1) && vars.Storyflagqueue.Add(setting)){
			vars.Storyflag = vars.StoryflagList.IndexOf(setting) +1;
		}
		if (setting.Length > 0 && settings.ContainsKey(setting) && settings[setting] && vars.completedSplits.Add(setting)){
			return true;
		}
	}
	
	if(current.SUBAREA != old.SUBAREA){
		setting = current.AREA + "_" + current.SUBAREA + "_" + old.SUBAREA + "_" + vars.Storyflag;
	}

	if(current.AREA != old.AREA){
		setting = current.AREA + "_" + old.AREA + "_" + vars.Storyflag;
	}
		
		//final split - always active
	if(current.GameState == 24 && old.GameState != 24){
		setting = "Final";
	}
		
	
	if (settings.ContainsKey(setting) && settings[setting] && vars.completedSplits.Add(setting)) {
		return true;
	}
}

gameTime
{
	//Game Time is 15fps so divide by 15
	if(current.PGamecode == "SLES_820.43"){
		return TimeSpan.FromSeconds(current.IGT / 16.667);
	}
	else return TimeSpan.FromSeconds(current.IGT / 15.0);
}

isLoading
{
	return true;
}

reset
{
	return current.GameState == 8 && old.GameState != 8;
}
