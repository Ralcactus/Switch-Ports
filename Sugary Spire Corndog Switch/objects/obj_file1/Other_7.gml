if (sprite_index == spr_file1confirm && !instance_exists(obj_fadeoutTransition))
{
    with (obj_parent_player)
    {
        obj_camera.chargeCameraX = 0;
        image_index = 0;
        sprite_index = spr_entergate;
        state = UnknownEnum.Value_56;
        targetDoor = "A";
        targetRoom = hub_hallway;
    }
    
    if (!instance_exists(obj_fadeoutTransition))
    {
        instance_create(x, y, obj_fadeoutTransition, 
        {
            levelStart: true
        });
    }
}
