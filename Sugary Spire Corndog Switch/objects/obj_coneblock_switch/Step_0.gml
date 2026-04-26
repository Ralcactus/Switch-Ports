if (delay == 0)
{
    if (global.coneblock && sprite_index == spr_coneswitch_OFF)
        sprite_index = spr_coneswitch_ON;
    else if (!global.coneblock && sprite_index == spr_coneswitch_ON)
        sprite_index = spr_coneswitch_OFF;
}
