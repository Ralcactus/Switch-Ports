with (obj_parent_player)
{
    if (state != UnknownEnum.Value_134 && state != UnknownEnum.Value_87 && state != UnknownEnum.Value_96 && state != UnknownEnum.Value_97 && state != UnknownEnum.Value_95 && state != UnknownEnum.Value_62 && state != UnknownEnum.Value_42 && state != UnknownEnum.Value_67 && state != UnknownEnum.Value_110 && state != UnknownEnum.Value_0)
    {
        if (place_meeting(x, y, other) && vsp <= 4 && !grounded && place_meeting_collision(x, y - 16) && y >= other.y && state != UnknownEnum.Value_71)
        {
            state = UnknownEnum.Value_71;
            vsp = -16;
        }
    }
}
