function scr_pizzano_wallcling()
{
    hsp = 0;
    vsp = (sprite_index == spr_player_PN_wallCling) ? 0 : -3;
    image_speed = 0.35;
    
    if (sprite_index == spr_player_PN_wallCling && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_PN_wallSlide;
    
    if (grounded)
    {
        state = UnknownEnum.Value_1;
    }
    else if (key_jump)
    {
        movespeed = 8;
        vsp = -12;
        xscale *= -1;
        state = UnknownEnum.Value_123;
    }
}
