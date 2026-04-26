if (place_meeting(x + 4, y, obj_parent_player) && (obj_parent_player.state == UnknownEnum.Value_78 || obj_parent_player.state == UnknownEnum.Value_79 || obj_parent_player.state == UnknownEnum.Value_81))
{
    instance_destroy();
    ds_list_add(global.SaveRoom, id);
}
