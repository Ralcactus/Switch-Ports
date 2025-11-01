testvariablenothing = false;
var _started = file_exists("campaign.sav");

if (_started)
    newgame = true;
else
    room_to = rm_map_opening;
