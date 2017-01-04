// =====================================================
//  Car Bomb Script
//  Version: 1.1
//  Author: ZARazor91 (zarazor91@hotmail.de)
// -----------------------------------------------------
//  Required parameters:
//    vehicle  = Vehicle with the bomb
//    timer    = Timer until the bom explode.
//    (e.g. nul=[this,30] execVM "car_bomb.sqf")
//
//  Optional parameters:
//    "text"   = Shows the timer for the crew.
//    (e.g. nul=[this,30,"text"] execVM "car_bomb.sqf")
// =====================================================

_veh = _this select 0;
_tim = _this select 1;

WaitUntil {count (crew _veh) > 0};
While {_tim != 0} do {
	If ("text" in _this) then {
		{hintSilent (str _tim)} forEach (crew _veh);
	};
	_tim = _tim - 1;
	Sleep 1;
};

If (isServer && alive _veh) then {"Bo_GBU12_LGB" createVehicle getPos _veh};
