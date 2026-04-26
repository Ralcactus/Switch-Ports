function state_player_pal()
{
    move = key_left2 + key_right2;
    move2 = key_up2 - key_down2;
    
    if (move != 0)
    {
        paletteSelect = wrap(paletteSelect + move, 1, sprite_get_width(paletteSprite) - 1);
        
        with (obj_palexample)
        {
            instance_create_depth(x, y, -6, obj_poofeffect);
            sprite_index = spr_pizzelleselectedpal;
            image_index = 0;
        }
    }
    
    with (obj_playerhatselect)
    {
        if (other.move2 != 0)
            Selection = wrap(image_index + other.move2, 0, arrayEnd - 1);
    }
    
    if (key_jump)
    {
        if (obj_playerhatselect.HatIndex[obj_playerhatselect.Selection])
        {
            if (obj_playerhat.image_index != obj_playerhatselect.Selection)
            {
                instance_create(x, y, obj_poofeffect);
                obj_playerhat.image_index = obj_playerhatselect.Selection;
            }
            
            with (obj_playerhatselect)
                Selection = obj_playerhat.image_index;
            
            event_play_oneshot("event:/SFX/ui/confirm");
            state = UnknownEnum.Value_1;
            targetRoom = hub_w1;
            targetDoor = "C";
            instance_create(x, y, obj_fadeoutTransition);
        }
        else
        {
            with (obj_playerhatselect)
            {
                shake = true;
                alarm[1] = 10;
            }
            
            event_play_oneshot("event:/SFX/ui/step");
        }
    }
    
    sprite_index = spr_idle;
}
