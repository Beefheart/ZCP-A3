/*
	Zupa's Capture Points
	Configuration of ZCP
	Capture points and earn rewards.

	╔════╗─────────╔═══╗────────╔╗─────────────╔╗
	╚══╗═║─────────╚╗╔╗║────────║║────────────╔╝╚╗
	──╔╝╔╬╗╔╦══╦══╗─║║║╠══╦╗╔╦══╣║╔══╦╗╔╦══╦═╗╚╗╔╬══╗
	─╔╝╔╝║║║║╔╗║╔╗║─║║║║║═╣╚╝║║═╣║║╔╗║╚╝║║═╣╔╗╗║║║══╣
	╔╝═╚═╣╚╝║╚╝║╔╗║╔╝╚╝║║═╬╗╔╣║═╣╚╣╚╝║║║║║═╣║║║║╚╬══║
	╚════╩══╣╔═╩╝╚╝╚═══╩══╝╚╝╚══╩═╩══╩╩╩╩══╩╝╚╝╚═╩══╝
	────────║║
	────────╚╝
*/

// First person in the Cap zone is the capper (If he leaves, the closest on of the group is the new capper but time is reset!).
// When multiple people are in the zone and not in the same group, the zone is contested.
// Being first in the zone starts the timer.
// Holding a zone  gives you a reward after x Min.

ZCP_CapTime = 60; // Seconds to cap an area uncontested
ZCP_CapRadius = 70; // Meter radius of the capture circle around the first object.
ZCP_MinWaitTime = 2; // seconds to wait to spawn a new capturepoint when 1 was capped.
ZCP_BaseCleanupDelay = 300; // seconds to wait to delete a captured base.
ZCP_MaxMissions = 2; // Ammount of cap points at the same time.
ZCP_Minimum_Online_Players = 0; // Ammount of players to be online before it allows to spawn capture points. !!! O = always

ZCP_RewardRelativeToPlayersOnline = true; // This will recalculate the crypto reward according the amount of online players.
ZCP_KryptoReward = 1500; // Crypto reward for capping.
ZCP_ServerMaxPlayers = 60; // Only needed to recalcuate the reward.
ZCP_MinKryptoReward = 500; // The crypto reward can never be recalculated lower then this.

ZCP_VehicleReward = ["B_Truck_01_box_EPOCH","B_Truck_01_box_EPOCH","B_Truck_01_box_EPOCH"]; // Vehicle classes for vehicle reward

ZCP_WeaponReward = [
			[0,"m107_EPOCH",0.3,1,0],
			[0,"MultiGun",0.4,1,0],
			[0,"M14_EPOCH",0.6,1,0],
			[0,"m249_EPOCH",0.6,1,0],
			[0,"LMG_Mk200_F",0.6,1,0],
			[0,"m16_EPOCH",0.7,1,0],
			[0,"akm_EPOCH",0.7,1,0],
			[0,"m4a3_EPOCH",0.7,1,0],
			[0,"sr25_epoch",0.4,1,0],
			[0,"l85a2_epoch",0.8,1,0],
			[0,"arifle_MX_GL_F",0.5,1,0],
			[0,"srifle_DMR_02_F",0.2,1,0],
			[0,"srifle_DMR_02_camo_F",0.2,1,0],
			[0,"srifle_DMR_02_sniper_F",0.2,1,0],
			[0,"srifle_DMR_03_F",0.2,1,0],
			[0,"srifle_DMR_03_tan_F",0.2,1,0],
			[0,"srifle_DMR_03_khaki_F",0.2,1,0],
			[0,"srifle_DMR_03_multicam_F",0.2,1,0],
			[0,"srifle_DMR_03_woodland_F",0.2,1,0],
			[0,"srifle_DMR_04_F",0.2,1,0],
			[0,"srifle_DMR_04_Tan_F",0.2,1,0],
			[0,"srifle_DMR_05_blk_F",0.2,1,0],
			[0,"srifle_DMR_05_hex_F",0.2,1,0],
			[0,"srifle_DMR_05_tan_F",0.2,1,0],
			[0,"srifle_DMR_06_camo_F",0.2,1,0],
			[0,"srifle_DMR_06_olive_F",0.2,1,0],
			[0,"MMG_01_hex_F",0.1,1,0],
			[0,"MMG_01_tan_F",0.1,1,0],
			[0,"MMG_02_camo_F",0.1,1,0],
			[0,"MMG_02_sand_F",0.1,1,0],
			[0,"MMG_02_black_F",0.1,1,0],
			[2,"optic_AMS",0.5,1,0],
			[2,"optic_AMS_khk",0.5,1,0],
			[2,"optic_AMS_snd",0.5,1,0],
			[2,"optic_KHS_blk",0.5,1,0],
			[2,"optic_KHS_hex",0.5,1,0],
			[2,"optic_KHS_old",0.5,1,0],
			[2,"optic_KHS_tan",0.5,1,0]
		];

ZCP_BuildingReward = [['PartPlankPack',8],['KitStudWall',4],["KitFoundation",2],["KitWoodFloor",2],['KitPlotPole',1],['ItemLockbox',1],['KitShelf',1],['KitCinderWall',2],['CircuitParts',1]]; // Classname + amount in an array in the reward array for buildings

ZCP_StaticPoints = false; // If true, the missions will use the provided location as spawnpoint.

// Server will keep as many missions up as ZCP_MaxMissions, And they will be randomly choosen from the following list
// Location is ignored if not using static points. just put [0,0,0] then.
// valid rewards -> Crypto , WeaponBox , BuildBox , Vehicle
ZCP_CapPoints = [ // [name,[x,y,z],reward, varname,index]
	["Cap Point Alpha",[3085.37,8775.07,0],"Crypto","alpha",0],
	["Cap Point Bravo",[3085.37,8775.07,0],"WeaponBox","beta",1],
	["Cap Point Charlie",[3085.37,8775.07,0],"BuildBox","charlie",2],
	["Cap Point Delta",[3085.37,8775.07,0],"Vehicle","delta",3]
];

// For every spawned mission, 
ZCP_CapBases = [ // located in capbases folder
	"base1.sqf"
];

/* These are arma 3 colors, look up the color naming if you are going to change this */
ZCP_FreeColor = "ColorIndependent"; // uncontested marker color
ZCP_CappedColor = "ColorCivilian"; // uncontested capped marker color
ZCP_ContestColor = "ColorOPFOR"; // contested capped marker color

ZCP_DisableVehicleReward = false; // Because it doesnt save without changing epoch code.
/* Do not change this*/
ZCP_Version = "2.0";
ZCP_Data = [];
ZCP_MissionCounter = 0;


// Beefheart
Beef_fnc_addVehicleItem = {
	// _vehicle = _this select 0;
	// _itemtype = _this select 1
	// _item = _this select 2;
	// _numofitems = _this select 3;
	if ((_this select 1) == 0) then { (_this select 0) addWeaponCargoGlobal [(_this select 2),(_this select 3)]; };
	if ((_this select 1) == 1) then { (_this select 0) addMagazineCargoGlobal [(_this select 2),(_this select 3)]; };
	if ((_this select 1) == 2) then { (_this select 0) addItemCargoGlobal [(_this select 2),(_this select 3)]; };
	if ((_this select 1) == 3) then { (_this select 0) addBackpackCargoGlobal [(_this select 2),(_this select 3)]; };
};

Beef_fnc_setVehicleLoadout = {
	private ["_vehicle","_itemarray","_addnumofitems"];
	_vehicle = _this select 0;
	_itemarray = _this select 1;
	{
		//_itemtype = _x select 0 (where 0 = weapons (addweapon), 1 = magazines (addmagazines), 2 = items (additems), 3 = backpacks (addbackpacks))
		//_itemname = _x select 1;
		//_dropchance = _x select 2;
		//_numofitems = _x select 3;
		//_addnumofitems = _x select 4;
		_addnumofitems = 0;
		if (count _x > 4) then { _addnumofitems = _x select 4; };
		
		if ( (random 1) <= (_x select 2) ) then {
			[_vehicle, (_x select 0), (_x select 1), ( (round (random _addnumofitems)) + (_x select 3) )] call Beef_fnc_addVehicleItem;
		};
	} foreach _itemarray;
};