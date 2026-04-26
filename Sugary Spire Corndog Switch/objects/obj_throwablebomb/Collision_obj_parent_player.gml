with (other)
{
    if (state == UnknownEnum.Value_16 && state != UnknownEnum.Value_20)
    {
        state = UnknownEnum.Value_140;
        bombID = other.id;
        sprite_index = spr_grab;
        image_index = 0;
        other.state = UnknownEnum.Value_37;
        other.playerID = id;
    }
}
