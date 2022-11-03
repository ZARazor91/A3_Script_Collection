/*
Name    : Buy Script
Version : 1.0.0
Date    : 26.01.2011
Author  : Razor
*/

If (!local player) exitWith {};
private ["_type","_rsco","_spos","_time"];

_type = _this select 0;
_rsco = _this select 1;
_spos = _this select 2;
_time = _this select 3;

While {_time != 0} do {
	hint format ["Vehicle ready in:\n%1 seconds",_time];
	_time = _time - 1;
};

hint format ["Your vehicle is ready, %1",(name player)];
_car = _type createVehicle (getPos _spos);
_car addAction ["Lock vehicle","scripts\lock.sqf",[1],+3,false,false,"","locked _target == false"];
_car addAction ["Unlock Vehicle","scripts\lock.sqf",[0],+3,false,false,"","locked _target == true"];