if (triggered)
{
    if (!instance_place(x, y, obj_parent_player) && sentaway == false)
    {
        with (obj_train)
        {
            x = xstart;
            y = ystart;
            image_xscale = start_xscale;
            sprite_index = spr_spray;
            event_play_oneshot("event:/SFX/enemies/train", x, y);
            
            repeat (5)
                instance_create(x + irandom_range(-90, 90), y + irandom_range(20, -20), obj_poofeffect);
            
            vsp = 0;
            movespeed = 10;
            state = UnknownEnum.Value_1;
        }
        
        sentaway = true;
    }
    
    with (obj_parent_player)
    {
        if (distance_to_object(other) >= 600)
        {
            other.sentaway = false;
            other.triggered = false;
        }
    }
}
