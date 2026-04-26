visible = secretActivated;

with (instance_place(x, y, obj_parent_doortrigger))
    other.targetDoor = id_door;

if (ds_list_find_index(global.SaveRoom, id) != -1)
    instance_destroy();
