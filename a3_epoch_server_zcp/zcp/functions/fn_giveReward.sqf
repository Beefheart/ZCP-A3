/*
	Zupa's Capture Points
	Reward giver of ZCP
	Capture points and earn money over time.

	╔════╗─────────╔═══╗────────╔╗─────────────╔╗
	╚══╗═║─────────╚╗╔╗║────────║║────────────╔╝╚╗
	──╔╝╔╬╗╔╦══╦══╗─║║║╠══╦╗╔╦══╣║╔══╦╗╔╦══╦═╗╚╗╔╬══╗
	─╔╝╔╝║║║║╔╗║╔╗║─║║║║║═╣╚╝║║═╣║║╔╗║╚╝║║═╣╔╗╗║║║══╣
	╔╝═╚═╣╚╝║╚╝║╔╗║╔╝╚╝║║═╬╗╔╣║═╣╚╣╚╝║║║║║═╣║║║║╚╬══║
	╚════╩══╣╔═╩╝╚╝╚═══╩══╝╚╝╚══╩═╩══╩╩╩╩══╩╝╚╝╚═╩══╝
	────────║║
	────────╚╝
*/

private["_ZCP_currentCapper","_ZCP_name","_capturePosition","_reward"];
_ZCP_currentCapper = _this select 0;
_ZCP_name = _this select 1;
_capturePosition = _this select 2;
_reward = _this select 3;
ZCP_Loot_Multiplicator = 1 / (ZCP_ServerMaxPlayers / count playableUnits);

switch (_reward) do {
	case "Crypto" : {
		[] call ZCP_fnc_Reward_Crypto;	
	};
	case "BuildBox" : {
		private["_box"];
		PV_ZCP_zupastic = ["ZCP",format["%2 captured %1 and received his buildbox. The base will dismantle in %4 seconds.",_ZCP_name,name _ZCP_currentCapper,"",ZCP_BaseCleanupDelay]];
		publicVariable "PV_ZCP_zupastic";	
		diag_log text format ["[ZCP]: %1 won %2, received a buildbox.",name _ZCP_currentCapper,_ZCP_name];
		_box = "Box_IND_AmmoVeh_F" createVehicle [0,0,150];
		clearWeaponCargoGlobal _box;
		clearMagazineCargoGlobal _box;
		clearBackpackCargoGlobal _box;
		clearItemCargoGlobal _box;
		{
			_box addItemCargoGlobal [_x select 0,_x select 1];
		}count ZCP_BuildingReward;
		_box setDir random 360;
		_box setPos [_capturePosition select 0,_capturePosition select 1,150];
		_box call ZCP_fnc_paraDrop;
	};
	case "WeaponBox" : {
		private["_box","_loadout"];
		
		//_loadout = ZCP_WeaponReward
		
		PV_ZCP_zupastic = ["ZCP",format["%2 captured %1 and received his weaponbox. The base will dismantle in %4 seconds.",_ZCP_name,name _ZCP_currentCapper,"",ZCP_BaseCleanupDelay]];
		publicVariable "PV_ZCP_zupastic";	
		diag_log text format ["[ZCP]: %1 won %2, received a weaponbox.",name _ZCP_currentCapper,_ZCP_name];
		_box = "Box_IND_AmmoVeh_F" createVehicle [0,0,150];
		clearWeaponCargoGlobal _box;
		clearMagazineCargoGlobal _box;
		clearBackpackCargoGlobal _box;
		clearItemCargoGlobal _box;
		
		[_box, ZCP_WeaponReward] call Beef_fnc_setVehicleLoadout;
		
		_box setDir random 360;
		_box setPos [_capturePosition select 0,_capturePosition select 1,150];
		_box call ZCP_fnc_paraDrop;
	};
	case "Vehicle" : {
		private["_vehicle","_vehicleClass","_cfg","_name"];		

		if(ZCP_DisableVehicleReward)then{
			[_ZCP_currentCapper,_ZCP_name,_capturePosition,"Crypto"] call ZCP_fnc_giveReward;
		}else{
			_vehicleClass = ZCP_VehicleReward call BIS_fnc_selectRandom;
			_cfg  = (configFile >>  "CfgVehicles" >>  _vehicleClass);	
		    _name = if (isText(_cfg >> "displayName")) then {
		        getText(_cfg >> "displayName")
		   		 }
		    else {
		        _vehicleClass
		    };
			PV_ZCP_zupastic = ["ZCP",format["%2 captured %1 and received a %3. The base will dismantle in %4 seconds.",_ZCP_name,name _ZCP_currentCapper,_name,ZCP_BaseCleanupDelay]];
			publicVariable "PV_ZCP_zupastic";	
			diag_log text format ["[ZCP]: %1 won %2, received a %3.",name _ZCP_currentCapper,_ZCP_name,_name];
			_vehicle = _vehicleClass createVehicle [0,0,150];
			clearWeaponCargoGlobal _vehicle;
			clearMagazineCargoGlobal _vehicle;
			clearBackpackCargoGlobal _vehicle;
			clearItemCargoGlobal _vehicle;			
			_vehicle call EPOCH_server_setVToken;
			_vehicle call EPOCH_server_save_vehicle;
			_vehicle call EPOCH_server_vehicleInit;
			_vehicle setDir random 360;
			_vehicle setPos [_capturePosition select 0,_capturePosition select 1,150];
			_vehicle call ZCP_fnc_paraDrop;
		};
	};
	case "Random" : {
		[] spawn ZCP_fnc_Reward_Crypto;	
	};
	default {
		diag_log text format["[ZCP] %1 has no valid reward name. Falling back on Crypto reward.",_ZCP_name];
		//Crypto fallback.
		[_ZCP_currentCapper,_ZCP_name,_capturePosition,"Crypto"] call ZCP_fnc_giveReward;
	};
};
