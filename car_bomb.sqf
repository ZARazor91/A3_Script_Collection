// =====================================================
//  Car Bomb Script  
//  Version: 1.02
//  Author: ZARazor91 (zarazor91@gmail.com)
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

_vehicle = _this select 0;
_timer = _this select 1;

WaitUntil {player in (crew _vehicle) && isEngineOn _vehicle};
While {_timer != 0} do {
	If (player in (crew _vehicle) && "text" in _this) then {hintSilent (str _timer)};
	_timer = _timer - 1;
	Sleep 1;
};

If (player in (crew _vehicle) && "text" in _this) then {hintSilent "Boom"};
If (isServer && alive _vehicle) then {"Bo_GBU12_LGB" createVehicle getPos _vehicle};
