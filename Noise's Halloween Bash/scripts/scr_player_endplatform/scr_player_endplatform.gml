function scr_player_endplatform()
{
    sprite_index = spr_player_idle;
    image_speed = 0.35;
    hsp = 0;
    movespeed = 0;
    momentum = 0;
    
    if (vsp < 0)
        vsp = 0;
}
