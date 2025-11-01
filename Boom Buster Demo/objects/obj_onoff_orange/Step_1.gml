if (!set)
{
    scr_switch_onoff(spr_solid, true);
    
    if (global.onoff != my_onoff)
    {
        image_alpha = 0.6;
        anim_index = 1;
    }
    else
    {
        image_alpha = 1;
        anim_index = 0;
    }
    
    scale = 1;
    set = true;
}

if (exit_freeze())
    exit;

if (global.onoff == my_onoff)
    anim_index = 0;
else
    anim_index = 1;

scale = lerp(scale, 1, 0.45);
