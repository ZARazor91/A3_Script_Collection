// =====================================================
//  Car Bomb Script  
//  Version: 1.0
//  Author: Bier AIG Razor (zarazor91@hotmail.de)
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
_num = _tim;

WaitUntil {player in (crew _veh)};
While {_num != 0} do {
	If (player in (crew _veh) && "text" in _this) then {hintSilent (str _num)};
	_num = _num - 1;
	Sleep 1;
};

If (player in (crew _veh) && "text" in _this) then {hintSilent "0"};
If (isServer && alive _veh) then {"Bo_GBU12_LGB" createVehicle getPos _veh};