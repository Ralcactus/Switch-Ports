save_open();
ini_write_real("ObtuseAndFranklyUnnecessary", "enterTheBoneZone", 1);
save_close();
save_dump();

with (obj_player)
{
    verticalhallway = false;
    targetouthouse = noone;
    outofhallway = false;
    room_goto(targetroom);
    player_reset(undefined, undefined, false);
    state = states.actor;
}

global.switchstate = true;
roomchanged = true;
