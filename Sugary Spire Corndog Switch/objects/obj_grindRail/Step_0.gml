with (obj_parent_player)
{
    if (state != UnknownEnum.Value_134 && state != UnknownEnum.Value_87 && state != UnknownEnum.Value_96 && state != UnknownEnum.Value_97 && state != UnknownEnum.Value_95 && state != UnknownEnum.Value_62 && state != UnknownEnum.Value_42 && state != UnknownEnum.Value_67 && state != UnknownEnum.Value_110 && state != UnknownEnum.Value_0)
    {
        if (place_meeting_platform(x, y + 1, other) && vsp >= 0 && state != UnknownEnum.Value_36)
        {
            state = UnknownEnum.Value_36;
            vsp = 0;
        }
    }
}
