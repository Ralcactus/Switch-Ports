with (instance_place(x, y, obj_parent_doortrigger))
    other.targetDoor = id_door;

if (place_meeting(x, y, obj_parent_player) && ds_list_find_index(global.SaveRoom, id) == -1)
{
    ds_list_add(global.SaveRoom, id);
    showDoorLight = false;
}

if (ds_list_find_index(global.SaveRoom, id) != -1)
    showDoorLight = false;
