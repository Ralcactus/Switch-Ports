with (obj_parent_player)
{
    if (other.image_yscale == 1)
    {
        if ((((key_down || state == UnknownEnum.Value_12) && !place_meeting(x, y + 1, obj_destructibles) && place_meeting(x, y + 1, other.id) && (state == UnknownEnum.Value_60 || state == UnknownEnum.Value_12 || state == UnknownEnum.Value_28)) || ((state == UnknownEnum.Value_62 || state == UnknownEnum.Value_69 || state == UnknownEnum.Value_70) && !place_meeting(x, y + 1, obj_destructibles) && place_meeting(x, y + 1, other.id))) && !instance_exists(obj_fadeoutTransition) && state != UnknownEnum.Value_72 && state != UnknownEnum.Value_57)
        {
            with (other)
            {
                event_user(0);
                sprite_index = spr_pizzabox_front;
                depth = -30;
            }
            
            event_play_oneshot("event:/SFX/general/box", x, y);
            obj_parent_player.box = true;
            machTwo = 0;
            obj_camera.chargeCameraX = 0;
            x = other.x;
            obj_parent_player.targetDoor = other.targetDoor;
            obj_parent_player.targetRoom = other.targetRoom;
            sprite_index = spr_player_PZ_pipeDown_getIn;
            image_index = 0;
            state = UnknownEnum.Value_72;
        }
    }
    
    if (other.image_yscale == -1)
    {
        if ((((key_up || state == UnknownEnum.Value_58 || state == UnknownEnum.Value_11) && !place_meeting(x, y - 1, obj_destructibles) && place_meeting(x, y - 1, other.id) && (state == UnknownEnum.Value_55 || state == UnknownEnum.Value_11 || state == UnknownEnum.Value_119 || state == UnknownEnum.Value_117 || state == UnknownEnum.Value_88 || state == UnknownEnum.Value_58)) && !place_meeting(x, y - 1, obj_destructibles) && place_meeting(x, y - 1, other.id)) && !instance_exists(obj_fadeoutTransition))
        {
            event_play_oneshot("event:/SFX/general/box");
            
            with (other)
            {
                event_user(0);
                sprite_index = spr_pizzabox_front;
                depth = -30;
            }
            
            event_play_oneshot("event:/SFX/general/box", x, y);
            obj_parent_player.box = true;
            machTwo = 0;
            obj_camera.chargeCameraX = 0;
            x = other.x;
            obj_parent_player.targetDoor = other.targetDoor;
            obj_parent_player.targetRoom = other.targetRoom;
            sprite_index = spr_player_PZ_pipeUp_getIn;
            image_index = 0;
            state = UnknownEnum.Value_72;
        }
    }
}
