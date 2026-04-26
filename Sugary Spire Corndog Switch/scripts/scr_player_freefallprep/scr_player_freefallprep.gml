function state_player_freefallprep()
{
    move = key_left + key_right;
    
    if (!grounded)
    {
        hsp = move * movespeed;
        
        if (move != xscale && momemtum)
            movespeed = approach(0, movespeed, 0.05);
        
        if (movespeed <= 0)
            momemtum = false;
        
        if ((move == 0 && !momemtum) || place_meeting_collision(x + hsp, y))
            movespeed = 0;
        
        if (move != 0 && movespeed < 7)
            movespeed += 0.25;
        
        if (movespeed > 7)
            movespeed -= 0.05;
        
        if (place_meeting_collision(x + move, y) && move != 0)
            movespeed = 0;
        
        if (dir != xscale)
        {
            dir = xscale;
            movespeed = 0;
        }
        
        if (move == -xscale)
        {
            movespeed = 0;
            momemtum = false;
        }
        
        if (move != 0)
            xscale = move;
        
        vsp = min(vsp, 0);
    }
    
    image_speed = 0.5;
    
    if (floor(image_index) == (image_number - 1))
    {
        verticalMovespeed = vsp;
        state = UnknownEnum.Value_69;
        freeFallSmash = -14;
    }
}
