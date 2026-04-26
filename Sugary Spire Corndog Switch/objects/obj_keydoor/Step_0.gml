showDoorLight = false;

if (escapeBlockedDoor && global.panic)
{
    sprite_index = spriteDoorEscape;
    exit;
}

sprite_index = spriteDoorUnlocked;

if (ds_list_find_index(global.SaveRoom, other.id) == -1 || place_meeting(x, y, obj_doorblocked))
    sprite_index = spriteDoorLocked;

with (obj_parent_player)
{
    if (place_meeting(x, y, other.id) && !instance_exists(obj_fadeoutTransition) && key_up && grounded && (state == UnknownEnum.Value_1 || state == UnknownEnum.Value_59 || state == UnknownEnum.Value_64 || state == UnknownEnum.Value_65) && state != UnknownEnum.Value_72 && state != UnknownEnum.Value_56 && state != UnknownEnum.Value_57)
    {
        if (ds_list_size(global.KeyFollowerList) <= 0 && ds_list_find_index(global.SaveRoom, other.id) == -1)
            exit;
        
        event_play_oneshot("event:/SFX/general/cheers", x, y);
        event_play_oneshot("event:/SFX/general/keyunlock", x, y);
        fmod_event_play(obj_parent_player.voiceCollect);
        image_index = 0;
        state = UnknownEnum.Value_72;
        targetDoor = other.targetDoor;
        targetRoom = other.targetRoom;
        obj_camera.chargeCameraX = 0;
        
        if (ds_list_find_index(global.SaveRoom, other.id) == -1)
        {
            with (ds_list_find_value(global.KeyFollowerList, 0))
                instance_destroy();
            
            ds_list_delete(global.KeyFollowerList, 0);
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
