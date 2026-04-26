with (other)
{
    if (dashpadBuffer <= 0)
    {
        movespeed += 0.5;
        movespeed = clamp(movespeed, 14, 24);
        
        if (!scr_solid(other.x, y))
            x = other.x;
        
        event_play_multiple("event:/SFX/general/dashpad", x, y);
        dashpadBuffer = 25;
        image_xscale = sign(other.image_xscale);
        image_index = 0;
        sprite_index = spr_minecart;
    }
}
