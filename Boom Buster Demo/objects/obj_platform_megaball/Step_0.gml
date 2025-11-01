if (active == false)
{
    mask_index = spr_nothing;
    
    if (side == 1)
        angle = lerp(angle, -90, 0.4);
    else
        angle = lerp(angle, 90, 0.4);
}
else
{
    angle = lerp(angle, 0, 0.4);
    mask_index = sprite_index;
    image_angle = 0;
}
