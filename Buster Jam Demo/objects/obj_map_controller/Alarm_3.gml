if (instance_number(obj_map_player) > 1)
{
    var _str = room_get_name(room);
    show_message(string("!!! There are {0} players in the room !!!\n{1}", instance_number(obj_map_player), _str));
}
