if (!set)
{
    my_onoff = image_index;
    scr_switch_onoff(spr_spring, false);
    set = true;
}

scale = lerp(scale, 1, 0.45);
