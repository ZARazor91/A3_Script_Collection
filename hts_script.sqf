// ================================================================================================
//  Helicopter Transport Script
//  Version: 1.11
//  Author: ZARazor91 (zarazor91@gmail.com)
// ------------------------------------------------------------------------------------------------
//  Required parameters:
//    helicopter       = Type of the helicopter.
//    vehicle          = Type of the cargo.
//    pilot            = Type of the pilot.
//    height           = Altitude for the helicopter.
//    start position   = Start position for the helicopter.
//    target position  = Target position for the helicopter (player is possible too).
//    end position     = End position for the helicopter.
//    (e.g. scr = ["B_Heli_Transport_03_F","B_MRAP_01_F","B_Pilot_F",70,start,target,end] execVM "hts_script.sqf")
// ================================================================================================

private ["_heli","_veh","_pil","_hei","_sta","_pla","_end"];

If (!isServer) then {
  _heli = _this select 0;
  _veh = _this select 1;
  _pil = _this select 2;
  _hei = _this select 3;
  _sta = _this select 4;
  _pla = _this select 5;
  _end = _this select 6;

  _helo = createvehicle [_heli,[(getpos _sta select 0),(getpos _sta select 1),_hei], [], 0, "FLY"];
  _helo setdir getdir _sta;
  _cargo = _veh createvehicle getpos _helo;
  _grp = createGroup WEST;
  _pilot = _pil createUnit [[0,0,0],_grp,"this moveinDriver _helo"];
  _helo flyinheight _hei;

  _helo setSlingLoad _cargo;
  _grp setSpeedMode "Full";
  _wp1 = _grp addWaypoint [_pla,-1];
  _wp1 setWaypointType "UNHOOK";
  _wp2 = _grp addWaypoint [_end,-1];
  _wp2 setWaypointType "MOVE";
  player moveInCargo _helo;

  WaitUntil {_helo distance _end < 150};
  deletevehicle (driver _helo);
  deletevehicle _helo;
  player setPos getPos  _end;
};