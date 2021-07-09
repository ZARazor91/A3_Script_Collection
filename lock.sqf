/*
Name    : Lock Script
Version : 1.0.0
Date    : 26.01.2011
Author  : Razor
*/

If (!local player) exitWith {};
private ["_type","_rsco"];

_vehi = _this select 1;
_stat = (_this select 3) select 1;

Switch (_stat) do {

	case 1 : {_vehi setVehicleInit "this lock true"};

	case 0 : {_vehi setVehicleInit "this lock false"};

};