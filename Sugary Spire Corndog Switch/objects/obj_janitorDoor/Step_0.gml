showDoorLight = false;
sprite_index = spriteDoorUnlocked;

if (ds_list_find_index(global.SaveRoom, other.id) == -1 || place_meeting(x, y, obj_doorblocked))
    sprite_index = spriteDoorLocked;

with (obj_parent_player)
{
    if (place_meeting(x, y, other.id) && !instance_exists(obj_fadeoutTransition) && key_up && grounded && (state == UnknownEnum.Value_1 || state == UnknownEnum.Value_59 || state == UnknownEnum.Value_64 || state == UnknownEnum.Value_65) && state != UnknownEnum.Value_72 && state != UnknownEnum.Value_56 && state != UnknownEnum.Value_57)
    {
        if (!global.janitorRudefollow && ds_list_find_index(global.SaveRoom, other.id) == -1)
            exit;
        
        image_index = 0;
        state = UnknownEnum.Value_72;
        targetDoor = other.targetDoor;
        targetRoom = other.targetRoom;
        obj_camera.chargeCameraX = 0;
        
        if (ds_list_find_index(global.SaveRoom, other.id) == -1)
        {
            global.janitorRudefollow = false;
            instance_create(x, y, obj_lock, 
            {
                sprite_index: other.spriteDoorLock
            });
            state = UnknownEnum.Value_56;
            
            with (other)
            {
                ds_list_add(global.SaveRoom, id);
                sprite_index = spriteDoorUnlocked;
                image_index = 0;
                image_speed = 0.35;
            }
        }
    }
}
