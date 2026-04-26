with (other.id)
{
    if (instance_exists(other.baddieID) && state != UnknownEnum.Value_95 && state != UnknownEnum.Value_87 && state != UnknownEnum.Value_96 && state != UnknownEnum.Value_97)
    {
        state = UnknownEnum.Value_95;
        xscale = other.baddieID.image_xscale;
        movespeed = 10;
        vsp = 0;
        sprite_index = spr_tumble;
    }
}
