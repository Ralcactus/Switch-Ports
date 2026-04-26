with (other)
{
    if (state == UnknownEnum.Value_134 || state == UnknownEnum.Value_0 || state == UnknownEnum.Value_110)
        exit;
    
    if (state != UnknownEnum.Value_127 && state != UnknownEnum.Value_128)
    {
        state = UnknownEnum.Value_127;
        sprite_index = spr_miniTransform;
        image_index = 0;
    }
}
