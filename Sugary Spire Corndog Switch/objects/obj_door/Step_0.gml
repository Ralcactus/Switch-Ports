if (escapeBlockedDoor && global.panic)
{
    showDoorLight = false;
    sprite_index = spriteDoorEscape;
    exit;
}

if (doorLocked || place_meeting(x, y, obj_doorblocked))
{
    showDoorLight = false;
    sprite_index = spriteDoorLocked;
    exit;
}

sprite_index = spriteDoorUnlocked;

with (obj_parent_player)
{
    if (place_meeting(x, y, other.id) && !instance_exists(obj_fadeoutTransition) && key_up && grounded && (state == UnknownEnum.Value_1 || state == UnknownEnum.Value_59 || state == UnknownEnum.Value_64 || state == UnknownEnum.Value_65 || state == UnknownEnum.Value_3) && state != UnknownEnum.Value_72 && state != UnknownEnum.Value_56 && state != UnknownEnum.Value_57)
    {
        image_index = 0;
        state = UnknownEnum.Value_72;
        targetDoor = other.targetDoor;
        targetRoom = other.targetRoom;
        obj_camera.chargeCameraX = 0;
        
        if (ds_list_find_index(global.SaveRoom, other.id) == -1)
            ds_list_add(global.SaveRoom, other.id);
    }
}
