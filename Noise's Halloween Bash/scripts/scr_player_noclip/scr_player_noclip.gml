function scr_player_noclip()
{
    sprite_index = spr_player_idle;
    image_speed = 0.35;
    hsp = 0;
    vsp = 0;
    movespeed = 0;
    x += (input_check_opposing("left", "right") * (5 + (input_check("dash") * 4)));
    y += (input_check_opposing("up", "down") * (5 + (input_check("dash") * 4)));
    
    if (input_check_pressed("attack"))
    {
        attackbuffer = 0;
        state = states.normal;
    }
}
