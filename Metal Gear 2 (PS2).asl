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
		emu.Make<byte>("PEF_MG2GameState", 0x26DCCC);
		//Playthrough Info
		emu.Make<uint>("PEF_MG2IGT", 0x26DB28);
		emu.Make<uint>("PEF_MG2Ration", 0x26DB2C);
		emu.Make<uint>("PEF_MG2Kills", 0x26DB30);
		emu.Make<uint>("PEF_MG2Alert", 0x26DB34);
		emu.Make<uint>("PEF_MG2Special", 0x26DB38);
		emu.Make<uint>("PEF_MG2Save", 0x26DB3C);
		emu.Make<uint>("PEF_MG2Continue", 0x26DB40);
		emu.Make<byte>("PEF_MG2Diff", 0x17A9C94);
		//Items In Inventory Bits
		emu.Make<byte>("PEF_MG2EQ1", 0x17A9C30);
		emu.Make<byte>("PEF_MG2EQ2", 0x17A9C31);
		emu.Make<byte>("PEF_MG2EQ3", 0x17A9C34);
		emu.Make<byte>("PEF_MG2EQ4", 0x17A9C35);
		emu.Make<byte>("PEF_MG2EQ5", 0x17A9C36);
		emu.Make<byte>("PEF_MG2EQ6", 0x17A9C37);
		//Event Flags for Bosses & Story
		emu.Make<byte>("PEF_MG2EV2", 0x26E099);
		emu.Make<byte>("PEF_MG2EV3", 0x26E09A);
		emu.Make<byte>("PEF_MG2EV4", 0x26E09B);
		emu.Make<byte>("PEF_MG2EV7", 0x26E09E);
		emu.Make<byte>("PEF_MG2EV8", 0x26E09F);
		emu.Make<byte>("PEF_MG2EV9", 0x26E0A0);
		emu.Make<byte>("PEF_MG2EV10", 0x26E0A1);
		emu.Make<byte>("PEF_MG2EV11", 0x26E0A2);
		
		//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		//These are for the NTSCU (American) Version of the game
		//Metal Gear 2: Solid Snake
		emu.Make<byte>("U_MG2GameState", 0x26AF94);
		//Playthrough Info
		emu.Make<uint>("U_MG2IGT", 0x26ADF0);
		emu.Make<uint>("U_MG2Ration", 0x26ADF4);
		emu.Make<uint>("U_MG2Kills", 0x26ADF8);
		emu.Make<uint>("U_MG2Alert", 0x26ADFC);
		emu.Make<uint>("U_MG2Special", 0x26AE00);
		emu.Make<uint>("U_MG2Save", 0x26AE04);
		emu.Make<uint>("U_MG2Continue", 0x26AE08);
		emu.Make<byte>("U_MG2Diff", 0x17A6BE4);
		//Items In Inventory Bits
		emu.Make<byte>("U_MG2EQ1", 0x17A6B80);
		emu.Make<byte>("U_MG2EQ2", 0x17A6B81);
		emu.Make<byte>("U_MG2EQ3", 0x17A6B84);
		emu.Make<byte>("U_MG2EQ4", 0x17A6B85);
		emu.Make<byte>("U_MG2EQ5", 0x17A6B86);
		emu.Make<byte>("U_MG2EQ6", 0x17A6B87);
		//Event Flags for Bosses
		emu.Make<byte>("U_MG2EV2", 0x26B361);
		emu.Make<byte>("U_MG2EV3", 0x26B362);
		emu.Make<byte>("U_MG2EV4", 0x26B363);
		emu.Make<byte>("U_MG2EV7", 0x26B366);
		emu.Make<byte>("U_MG2EV8", 0x26B367);
		emu.Make<byte>("U_MG2EV9", 0x26B368);
		emu.Make<byte>("U_MG2EV10", 0x26B369);
		emu.Make<byte>("U_MG2EV11", 0x26B36A);

		//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		//These are for the JPN (Japanese) Version of the game
		//Metal Gear 2: Solid Snake
		emu.Make<byte>("J_MG2GameState", 0x26A67C);
		//Playthrough Info
		emu.Make<uint>("J_MG2IGT", 0x26A4D8);
		emu.Make<uint>("J_MG2Ration", 0x26A4DC);
		emu.Make<uint>("J_MG2Kills", 0x26A4E0);
		emu.Make<uint>("J_MG2Alert", 0x26A4E4);
		emu.Make<uint>("J_MG2Special", 0x26A4E8);
		emu.Make<uint>("J_MG2Save", 0x26A4EC);
		emu.Make<uint>("J_MG2Continue", 0x26A4F0);
		emu.Make<byte>("J_MG2Diff", 0x1457B94);
		//Items In Inventory Bits
		emu.Make<byte>("J_MG2EQ1", 0x1457B30);
		emu.Make<byte>("J_MG2EQ2", 0x1457B31);
		emu.Make<byte>("J_MG2EQ3", 0x1457B34);
		emu.Make<byte>("J_MG2EQ4", 0x1457B35);
		emu.Make<byte>("J_MG2EQ5", 0x1457B36);
		emu.Make<byte>("J_MG2EQ6", 0x1457B37);
		//Event Flags for Bosses && Story
		emu.Make<byte>("J_MG2EV2", 0x26AA49);
		emu.Make<byte>("J_MG2EV3", 0x26AA4A);
		emu.Make<byte>("J_MG2EV4", 0x26AA4B);
		emu.Make<byte>("J_MG2EV7", 0x26AA4E);
		emu.Make<byte>("J_MG2EV8", 0x26AA4F);
		emu.Make<byte>("J_MG2EV9", 0x26AA50);
		emu.Make<byte>("J_MG2EV10", 0x26AA51);
		emu.Make<byte>("J_MG2EV11", 0x26AA52);
		
		//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		//These are for the JPN (Japanese 20th Anniversary) Version of the game
		//Metal Gear 2: Solid Snake
		emu.Make<byte>("JA_MG2GameState", 0x26A5FC);
		//Playthrough Info
		emu.Make<uint>("JA_MG2IGT", 0x26A458);
		emu.Make<uint>("JA_MG2Ration", 0x26A45C);
		emu.Make<uint>("JA_MG2Kills", 0x26A460);
		emu.Make<uint>("JA_MG2Alert", 0x26A464);
		emu.Make<uint>("JA_MG2Special", 0x26A468);
		emu.Make<uint>("JA_MG2Save", 0x26A46C);
		emu.Make<uint>("JA_MG2Continue", 0x26A470);
		emu.Make<byte>("JA_MG2Diff", 0x1457B94);
		//Items In Inventory Bits
		emu.Make<byte>("JA_MG2EQ1", 0x1457B30);
		emu.Make<byte>("JA_MG2EQ2", 0x1457B31);
		emu.Make<byte>("JA_MG2EQ3", 0x1457B34);
		emu.Make<byte>("JA_MG2EQ4", 0x1457B35);
		emu.Make<byte>("JA_MG2EQ5", 0x1457B36);
		emu.Make<byte>("JA_MG2EQ6", 0x1457B37);
		//Event Flags for Bosses && Story
		emu.Make<byte>("JA_MG2EV2", 0x26A9C9);
		emu.Make<byte>("JA_MG2EV3", 0x26A9CA);
		emu.Make<byte>("JA_MG2EV4", 0x26A9CB);
		emu.Make<byte>("JA_MG2EV7", 0x26A9CE);
		emu.Make<byte>("JA_MG2EV8", 0x26A9CF);
		emu.Make<byte>("JA_MG2EV9", 0x26A9D0);
		emu.Make<byte>("JA_MG2EV10", 0x26A9D1);
		emu.Make<byte>("JA_MG2EV11", 0x26A9D2);
		return true;
    });
	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	//Metal Gear 2: Solic Snake variables we can make settings from
	vars.mg2KeyID = new List<string>(){
	"MG2EQ5_1", "MG2EQ5_2", "MG2EQ5_3", "MG2EQ5_4", "MG2EQ5_5", "MG2EQ5_6", "MG2EQ5_7", "MG2EQ6_0", "MG2EQ6_1", "MG2EQ6_2", "MG2EQ6_3", "MG2EQ6_4"};
	
	vars.mg2KeySet = new List<string>(){
	"Card 1", "Card 2", "Card 3", "Card 4", "Card 5", "Card 6", "Card 7", "Card 8", "Card 9", "Red Card (1-3)", "Blue Card (4-6", "Green Card (7-9)"};
	
	vars.mg2GunID = new List<string>(){
	"MG2EQ1_0", "MG2EQ1_1", "MG2EQ1_2", "MG2EQ1_3", "MG2EQ1_4", "MG2EQ1_5", "MG2EQ1_6", "MG2EQ1_7", "MG2EQ2_0", "MG2EQ2_1", "MG2EQ2_2", "MG2EQ2_4"};
	
	vars.mg2GunSet = new List<string>(){
	"Handgun", "Submachine Gun", "Grenades", "Stinger Missiles", "RC Missiles", "Plastic Explosives", "Land Mines", "Camoflage Mat", "Gas Grenade", "Mouse", "Lighter", "Suppressor"};
	
	vars.mg2ItemID = new List<string>(){
	"MG2EQ3_2", "MG2EQ3_3", "MG2EQ3_4", "MG2EQ3_5", "MG2EQ3_6", "MG2EQ3_7", "MG2EQ4_0", "MG2EQ4_1", 
	"MG2EQ4_2", "MG2EQ4_3", "MG2EQ4_4", "MG2EQ4_5", "MG2EQ4_6", "MG2EQ4_7", "MG2EQ5_0", "MG2EQ6_5", "MG2EQ6_6"};
	
	vars.mg2ItemSet = new List<string>(){
	"Binoculars", "Night-Vision Goggles", "Infrared Goggles", "Gas Mask", "Body Armour", "Oxygen Tank", "Mine Detector", 
	"Hang Glider", "Cardboard Box", "Bucket", "Cold Medicine", "Cassette Tape", "Egg (Snake)", "Egg (Owl)", "Brooch", "Spray", "Cartridge"};
	
	vars.mg2BossID = new List<string>(){
	"MG2EV2_1", "MG2EV3_0", "MG2EV3_5", "MG2EV4_4", "MG2EV7_3", "MG2EV7_7", "MG2EV8_7", "MG2EV9_5", "MG2EV10_4", "MG2EV10_7", "MG2EV11_2"};
	
	vars.mg2BossSet = new List<string>(){
	"Black Ninja", "Running Man", "Hind D", "Red Blaster", "Four Horsemen", "Jungle Evil", "Night Fright", "Drago Pettrovich Madnar", "Metal Gear D", "Gray Fox", "Big Boss"};

	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	//Metal Gear 2: Solid Snake Splits
	settings.Add("mg2", false, "Metal Gear 2: Solid Snake Autosplitter");
	settings.CurrentDefaultParent = "mg2";
	
	settings.Add("MG2Item", false, "Splits On Equipment & Weapons Entering Inventory");
	settings.CurrentDefaultParent = "MG2Item";
	
	settings.Add("MG2Key", false, "Key Cards");
		settings.CurrentDefaultParent = "MG2Key";
		for(int i = 0; i < 12; i++){
        	settings.Add("" + vars.mg2KeyID[i].ToString(), false, "" + vars.mg2KeySet[i].ToString());
    	}
	settings.CurrentDefaultParent = "MG2Item";
	
	settings.Add("MG2Gun", false, "Weapons");
		settings.CurrentDefaultParent = "MG2Gun";
		for(int i = 0; i < 12; i++){
        	settings.Add("" + vars.mg2GunID[i].ToString(), false, "" + vars.mg2GunSet[i].ToString());
    	}
	settings.CurrentDefaultParent = "MG2Item";
	
	settings.Add("MG2Items", false, "General Items");
		settings.CurrentDefaultParent = "MG2Items";
		for(int i = 0; i < 17; i++){
        	settings.Add("" + vars.mg2ItemID[i].ToString(), false, "" + vars.mg2ItemSet[i].ToString());
    	}
	settings.CurrentDefaultParent = "MG2Item";
	settings.CurrentDefaultParent = "mg2";
	
	settings.Add("MG2Boss", false, "Splits On Boss Kills");
		settings.CurrentDefaultParent = "MG2Boss";
		for(int i = 0; i < 11; i++){
        	settings.Add("" + vars.mg2BossID[i].ToString(), false, "" + vars.mg2BossSet[i].ToString());
    	}
	settings.CurrentDefaultParent = "mg2";
	
	settings.Add("End2", true, "Final Split (Alway Active)");
	settings.CurrentDefaultParent = null;
}

init
{
	//This is used for our splits
	vars.mg2completedSplits = new bool[112];
}

update
{
	//Checks what version you are on via the regional gamecode, then casts the correct information for that version
	//PAL FE Subsistence Disc 2
	if(current.PGamecode == "SLES_820.43"){
		//Metal Gear 2
		current.MG2GameState = current.PEF_MG2GameState;
	
		current.MG2IGT = current.PEF_MG2IGT;
		current.MG2Ration = current.PEF_MG2Ration;
		current.MG2Kills = current.PEF_MG2Kills;
		current.MG2Alert = current.PEF_MG2Alert;
		current.MG2Special = current.PEF_MG2Special;
		current.MG2Save = current.PEF_MG2Save;
		current.MG2Continue = current.PEF_MG2Continue;
		current.MG2Diff = current.PEF_MG2Diff;
			
		current.MG2EQ1 = current.PEF_MG2EQ1;
		current.MG2EQ2 = current.PEF_MG2EQ2;
		current.MG2EQ3 = current.PEF_MG2EQ3;
		current.MG2EQ4 = current.PEF_MG2EQ4;
		current.MG2EQ5 = current.PEF_MG2EQ5;
		current.MG2EQ6 = current.PEF_MG2EQ6;
		
		current.MG2EV2 = current.PEF_MG2EV2;
		current.MG2EV3 = current.PEF_MG2EV3;
		current.MG2EV4 = current.PEF_MG2EV4;
		current.MG2EV7 = current.PEF_MG2EV7;
		current.MG2EV8 = current.PEF_MG2EV8;
		current.MG2EV9 = current.PEF_MG2EV9;
		current.MG2EV10 = current.PEF_MG2EV10;
		current.MG2EV11 = current.PEF_MG2EV11;
	}
	//US Subsistence Disc 2
	if(current.UGamecode == "SLUS_212.43"){
		//Metal Gear 2
		current.MG2GameState = current.U_MG2GameState;
	
		current.MG2IGT = current.U_MG2IGT;
		current.MG2Ration = current.U_MG2Ration;
		current.MG2Kills = current.U_MG2Kills;
		current.MG2Alert = current.U_MG2Alert;
		current.MG2Special = current.U_MG2Special;
		current.MG2Save = current.U_MG2Save;
		current.MG2Continue = current.U_MG2Continue;
		current.MG2Diff = current.U_MG2Diff;
			
		current.MG2EQ1 = current.U_MG2EQ1;
		current.MG2EQ2 = current.U_MG2EQ2;
		current.MG2EQ3 = current.U_MG2EQ3;
		current.MG2EQ4 = current.U_MG2EQ4;
		current.MG2EQ5 = current.U_MG2EQ5;
		current.MG2EQ6 = current.U_MG2EQ6;
		
		current.MG2EV2 = current.U_MG2EV2;
		current.MG2EV3 = current.U_MG2EV3;
		current.MG2EV4 = current.U_MG2EV4;
		current.MG2EV7 = current.U_MG2EV7;
		current.MG2EV8 = current.U_MG2EV8;
		current.MG2EV9 = current.U_MG2EV9;
		current.MG2EV10 = current.U_MG2EV10;
		current.MG2EV11 = current.U_MG2EV11;
	}
	//JPN Subsistence Disc 2
	if(current.JGamecode == "SLPM_662.21"){
		//Metal Gear 2
		current.MG2GameState = current.J_MG2GameState;
	
		current.MG2IGT = current.J_MG2IGT;
		current.MG2Ration = current.J_MG2Ration;
		current.MG2Kills = current.J_MG2Kills;
		current.MG2Alert = current.J_MG2Alert;
		current.MG2Special = current.J_MG2Special;
		current.MG2Save = current.J_MG2Save;
		current.MG2Continue = current.J_MG2Continue;
		current.MG2Diff = current.J_MG2Diff;
			
		current.MG2EQ1 = current.J_MG2EQ1;
		current.MG2EQ2 = current.J_MG2EQ2;
		current.MG2EQ3 = current.J_MG2EQ3;
		current.MG2EQ4 = current.J_MG2EQ4;
		current.MG2EQ5 = current.J_MG2EQ5;
		current.MG2EQ6 = current.J_MG2EQ6;
		
		current.MG2EV2 = current.J_MG2EV2;
		current.MG2EV3 = current.J_MG2EV3;
		current.MG2EV4 = current.J_MG2EV4;
		current.MG2EV7 = current.J_MG2EV7;
		current.MG2EV8 = current.J_MG2EV8;
		current.MG2EV9 = current.J_MG2EV9;
		current.MG2EV10 = current.J_MG2EV10;
		current.MG2EV11 = current.J_MG2EV11;
	}
	//JPN 20th Anniversary Disc 2
	if(current.JAGamecode == "SLPM_667.95"){
		//Metal Gear 2
		current.MG2GameState = current.J_MG2GameState;
	
		current.MG2IGT = current.JA_MG2IGT;
		current.MG2Ration = current.JA_MG2Ration;
		current.MG2Kills = current.JA_MG2Kills;
		current.MG2Alert = current.J_MG2Alert;
		current.MG2Special = current.JA_MG2Special;
		current.MG2Save = current.JA_MG2Save;
		current.MG2Continue = current.JA_MG2Continue;
		current.MG2Diff = current.JA_MG2Diff;
			
		current.MG2EQ1 = current.JA_MG2EQ1;
		current.MG2EQ2 = current.JA_MG2EQ2;
		current.MG2EQ3 = current.JA_MG2EQ3;
		current.MG2EQ4 = current.JA_MG2EQ4;
		current.MG2EQ5 = current.JA_MG2EQ5;
		current.MG2EQ6 = current.JA_MG2EQ6;
		
		current.MG2EV2 = current.JA_MG2EV2;
		current.MG2EV3 = current.JA_MG2EV3;
		current.MG2EV4 = current.JA_MG2EV4;
		current.MG2EV7 = current.JA_MG2EV7;
		current.MG2EV8 = current.JA_MG2EV8;
		current.MG2EV9 = current.JA_MG2EV9;
		current.MG2EV10 = current.JA_MG2EV10;
		current.MG2EV11 = current.JA_MG2EV11;
	}
}

onStart
{
	//resets the splits bools when a new run starts
	vars.mg2completedSplits = new bool[112];
}

start
{
	return current.MG2GameState != 8 && old.MG2GameState == 8 && current.MG2IGT > old.MG2IGT;
}

split
{
	//Iterates through our splits and checks the bitmask for each one
	//Metal Gear 2: Solid Snake Splits
	//Metal Gear 2: Solid Snake Splits
	if(settings["mg2"]){
		for(int i = 0; i < 8; i++){
			if(settings["MG2EQ1_" + i] && vars.bitCheck(current.MG2EQ1, i) && !vars.mg2completedSplits[0 + i]){
				return vars.mg2completedSplits[0 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EQ2_" + i] && vars.bitCheck(current.MG2EQ2, i) && !vars.mg2completedSplits[8 + i]){
				return vars.mg2completedSplits[8 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EQ3_" + i] && vars.bitCheck(current.MG2EQ3, i) && !vars.mg2completedSplits[16 + i]){
				return vars.mg2completedSplits[16 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EQ4_" + i] && vars.bitCheck(current.MG2EQ4, i) && !vars.mg2completedSplits[24 + i]){
				return vars.mg2completedSplits[24 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EQ5_" + i] && vars.bitCheck(current.MG2EQ5, i) && !vars.mg2completedSplits[32 + i]){
				return vars.mg2completedSplits[32 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EQ6_" + i] && vars.bitCheck(current.MG2EQ6, i) && !vars.mg2completedSplits[40 + i]){
				return vars.mg2completedSplits[40 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EV2_" + i] && vars.bitCheck(current.MG2EV2, i) && !vars.mg2completedSplits[48 + i]){
				return vars.mg2completedSplits[48 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EV3_" + i] && vars.bitCheck(current.MG2EV3, i) && !vars.mg2completedSplits[56 + i]){
				return vars.mg2completedSplits[56 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EV4_" + i] && vars.bitCheck(current.MG2EV4, i) && !vars.mg2completedSplits[64 + i]){
				return vars.mg2completedSplits[64 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EV7_" + i] && vars.bitCheck(current.MG2EV7, i) && !vars.mg2completedSplits[72 + i]){
				return vars.mg2completedSplits[72 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EV8_" + i] && vars.bitCheck(current.MG2EV8, i) && !vars.mg2completedSplits[80 + i]){
				return vars.mg2completedSplits[80 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EV9_" + i] && vars.bitCheck(current.MG2EV9, i) && !vars.mg2completedSplits[88 + i]){
				return vars.mg2completedSplits[88 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EV10_" + i] && vars.bitCheck(current.MG2EV10, i) && !vars.mg2completedSplits[96 + i]){
				return vars.mg2completedSplits[96 + i]  = true;
			}
		}
		
		for(int i = 0; i < 8; i++){
			if(settings["MG2EV11_" + i] && vars.bitCheck(current.MG2EV11, i) && !vars.mg2completedSplits[104 + i]){
				return vars.mg2completedSplits[104 + i]  = true;
			}
		}
		
		if(current.MG2GameState == 24 && old.MG2GameState != 24 && !vars.mgcompletedSplits[112])		{return vars.mgcompletedSplits[112]  = true;}
	}
}

gameTime
{
	//Game Time is 15fps so divide by 15
	if(current.PGamecode == "SLES_820.43"){
		return TimeSpan.FromSeconds(current.MG2IGT / 16.667);
	}
	else return TimeSpan.FromSeconds(current.MG2IGT / 15.0);
}

isLoading
{
	return true;
}

reset
{
		return current.MG2GameState != 8 && old.MG2GameState == 8;
}
