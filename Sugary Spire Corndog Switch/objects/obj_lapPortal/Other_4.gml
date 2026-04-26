with (instance_place(x, y, obj_parent_doortrigger))
    other.targetDoor = id_door;

image_alpha = 0.5;

if (global.panic)
    image_alpha = 1;

if (ds_list_find_index(global.SaveRoom, id) != -1)
{
    if (instance_exists(obj_lapjanitor_CutscenePointer))
        instance_destroy(obj_lapjanitor_CutscenePointer);
    
    instance_destroy();
}
