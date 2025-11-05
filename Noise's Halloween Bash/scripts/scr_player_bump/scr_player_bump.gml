function scr_player_bump()
{
    hsp = movespeed * image_xscale;
    
    if (sprite_index == spr_player_wallsplat)
        vsp = 0;
    
    if (sprite_animation_end())
        state = states.normal;
    
    image_speed = 0.4;
    var _dir = input_check_opposing("left", "right");
    
    if (input_check_pressed(["jump", "slide", "dash", "attack"]) || (_dir != image_xscale && _dir != 0))
    {
        state = states.normal;
        states[state]();
        event_stop(splatsnd, false);
    }
}
