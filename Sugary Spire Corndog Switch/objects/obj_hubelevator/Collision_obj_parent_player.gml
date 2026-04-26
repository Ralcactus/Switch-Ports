if (state == UnknownEnum.Value_0 && other.state != UnknownEnum.Value_57 && other.hsp == 0 && other.grounded && other.key_up2)
{
    state = UnknownEnum.Value_1;
    playerID = other.id;
    other.state = UnknownEnum.Value_110;
    other.key_up2 = 0;
    other.movespeed = 0;
    other.hsp = 0;
    other.sprite_index = other.spr_idle;
    other.image_speed = 0.35;
}
