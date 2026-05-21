if (!global.freezeframe)
{
    if (playerID.state == states.cotton)
        draw_alpha = (clamp(playerID.movespeed - 6, 0, 2) / 2) * 0.45;
    else if (playerID.state == states.cottonroll)
        draw_alpha = (playerID.movespeed / 8) * 0.45;
    else if (playerID.state == states.cottondrill)
        draw_alpha = (abs(playerID.vsp) / 20) * 0.45;
    
    if (image_alpha > 0)
        image_alpha -= 0.06;
    
    if (image_alpha <= 0)
        instance_destroy();
}
