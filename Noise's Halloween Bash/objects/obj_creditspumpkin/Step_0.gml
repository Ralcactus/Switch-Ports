if (active)
{
    y += vsp;
    x += hsp;
    vsp = min(vsp + 0.1, 3);
    
    if (bbox_top > get_game_height() && vsp > 0)
    {
        with (obj_credits)
            event_user(0);
        
        instance_destroy();
    }
    
    if ((hsp < 0 && bbox_left < 0) || (hsp > 0 && bbox_right > get_game_width()))
        hsp *= -1;
}
