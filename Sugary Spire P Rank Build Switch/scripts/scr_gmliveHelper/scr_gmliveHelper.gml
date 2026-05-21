/// @desc Function This function is called everytime a newer version of the current room is detected.
function scr_room_updated(_room)
{
    global.GMLIVE_roomstart = true;
    global.GMLIVE_realroom = _room;
    room_goto_live(_room);
    show_debug_message("Loading Live Room: " + string(room_get_name(_room)));
}
