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
	vars.Debug = true;

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
		for(int i = 0; i < 11; i++){
        	settings.Add("" + vars.BossID[i].ToString(), true, "" + vars.BossSet[i].ToString());

    	}
		settings.CurrentDefaultParent = null;
	
	settings.Add("StoryFlags", false, "Splits On Completing Story Flags");
		settings.CurrentDefaultParent = "StoryFlags";
		for(int i = 0; i < 10; i++){
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
	settings.Add("ExtraLocations", false, "Splits On Entering Extra Locations");
	settings.CurrentDefaultParent = "ExtraLocations";
	settings.Add("7_8_7", false, "Start Swamp Area Going To Running Man");
	settings.Add("7_9_4", false, "Finish Swamp Area Going To Running Man");
	settings.Add("7_4_9", false, "Start Swamp Area Coming From Running Man");
	settings.Add("7_7_8", false, "Finish Swamp Area Coming From Running Man");
	settings.Add("14_7_6", false, "Entering Tower 31F Rooftop");
	settings.Add("4_26_8", false, "Entering Freezer to Freeze Brooch");
	settings.Add("4_9_14", false, "Entering Sauna to Heat Brooch");
	settings.Add("16_12", false, "Start Tower Stair Chase");
	settings.Add("13_16", false, "End Tower Stair Chase");
	settings.Add("13_4_5", false, "Reach Tower Jump Point");
	settings.CurrentDefaultParent = null;


	settings.Add("Final", true, "Final Split (Always Active)");
	settings.CurrentDefaultParent = null;
}

init
{
	//This is used for our splits
	vars.completedSplits = new HashSet<string>();
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
}

onStart
{
	//resets the splits bools when a new run starts
	vars.completedSplits.Clear();
}

start
{
	return current.GameState != 8 && old.GameState == 8 && current.IGT > old.IGT;
}

split
{
	string setting = "";
	//Iterates through our splits and checks the bitmask for each one
	for(int i = 0; i < 8; i++){
		if(current.EQ1 != old.EQ1 && vars.bitCheck(current.EQ1, i)){
			if (vars.Debug) print("found changed bit in EQ1_" + i);
			setting = "EQ1_" + i;
		}
		if(current.EQ2 != old.EQ2 && vars.bitCheck(current.EQ2, i)){
			if (vars.Debug) print("found changed bit in EQ2_" + i);
			setting = "EQ2_" + i;
		}
		if(current.EQ3 != old.EQ3 && vars.bitCheck(current.EQ3, i)){
			if (vars.Debug) print("found changed bit in EQ3_" + i);
			setting = "EQ3_" + i;
		}
		if(current.EQ4 != old.EQ4 && vars.bitCheck(current.EQ4, i)){
			if (vars.Debug) print("found changed bit in EQ4_" + i);
			setting = "EQ4_" + i;
		}
		if(current.EQ5 != old.EQ5 && vars.bitCheck(current.EQ5, i)){
			if (vars.Debug) print("found changed bit in EQ5_" + i);
			setting = "EQ5_" + i;
		}
		if(current.EQ6 != old.EQ6 && vars.bitCheck(current.EQ6, i)){
			if (vars.Debug) print("found changed bit in EQ6_" + i);
			setting = "EQ6_" + i;
		}
		if(current.EV2 != old.EV2 && vars.bitCheck(current.EV2, i)){
			if (vars.Debug) print("found changed bit in EV2_" + i);
			setting = "EV2_" + i;
		}
		if(current.EV3 != old.EV3 && vars.bitCheck(current.EV3, i)){
			if (vars.Debug) print("found changed bit in EV3_" + i);
			setting = "EV3_" + i;
		}
		if(current.EV4 != old.EV4 && vars.bitCheck(current.EV4, i)){
			if (vars.Debug) print("found changed bit in EV4_" + i);
			setting = "EV4_" + i;
		}
		if(current.EV5 != old.EV5 && vars.bitCheck(current.EV5, i)){
			if (vars.Debug) print("found changed bit in EV5_" + i);
			setting = "EV5_" + i;
		}
		if(current.EV6 != old.EV6 && vars.bitCheck(current.EV6, i)){
			if (vars.Debug) print("found changed bit in EV6_" + i);
			setting = "EV6_" + i;
		}
		if(current.EV7 != old.EV7 && vars.bitCheck(current.EV7, i)){
			if (vars.Debug) print("found changed bit in EV7_" + i);
			setting = "EV7_" + i;
		}
		if(current.EV8 != old.EV8 && vars.bitCheck(current.EV8, i)){
			if (vars.Debug) print("found changed bit in EV8_" + i);
			setting = "EV8_" + i;
		}
		if(current.EV9 != old.EV9 && vars.bitCheck(current.EV9, i)){
			if (vars.Debug) print("found changed bit in EV9_" + i);
			setting = "EV9_" + i;
		}
		if(current.EV10 != old.EV10 && vars.bitCheck(current.EV10, i)){
			if (vars.Debug) print("found changed bit in EV10_" + i);
			setting = "EV10_" + i;
		}
		if(current.EV11 != old.EV11 && vars.bitCheck(current.EV11, i)){
			if (vars.Debug) print("found changed bit in EV11_" + i);
			setting = "EV11_" + i;
		}
		if(current.CodecsCalled != old.CodecsCalled && vars.bitCheck(current.CodecsCalled, i)){
			setting = "CodecsCalled_" + i;
		}
		if (setting.Length > 0 && settings.ContainsKey(setting) && settings[setting] && vars.completedSplits.Add(setting)){
			// Debug. Comment out before release.
			if (vars.Debug) print("split on " + setting);
			return true;
		}
	}
	
	if(current.SUBAREA != old.SUBAREA){
		setting = current.AREA + "_" + current.SUBAREA + "_" + old.SUBAREA;
		if(setting == "7_8_7" && !vars.bitCheck(current.EQ1, 6)) {
			setting = "";
		}
	}
		
	if(current.AREA != old.AREA){
		setting = current.AREA + "_" + old.AREA;
	}
		
		//final split - always active
	if(current.GameState == 24 && old.GameState != 24){
		setting = "Final";
	}
		
	
//	if (vars.Debug && setting.Length > 0) print(setting + " Contains Key " + settings.ContainsKey(setting) + " and part of setting " + settings[setting]);
	if (setting.Length > 0 && settings.ContainsKey(setting) && settings[setting] && vars.completedSplits.Add(setting)){
		// Debug. Comment out before release.
		if (vars.Debug) print("split on " + setting);
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
