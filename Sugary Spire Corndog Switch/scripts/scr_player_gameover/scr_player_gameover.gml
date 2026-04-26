function state_player_gameover()
{
    image_speed = 0.35;
    cutscene = true;
    
    if (sprite_index == spr_deathstart)
    {
        vsp = 0;
        hsp = 0;
    }
    
    flash = false;
    
    for (var i = 0; i < 10; i++)
        alarm[i] = -1;
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_deathstart)
    {
        alarm[10] = 5;
        vsp = -10;
        sprite_index = spr_deathend;
    }
    
    hurted = false;
    x += hsp;
    y += floor(vsp);
    
    if (vsp < 30)
        vsp += grav;
}
