with (obj_parent_player)
{
    if (key_up && !place_meeting_collision(other.x + (other.sprite_width / 2), round(y), UnknownEnum.Value_12) && (state == UnknownEnum.Value_1 || state == UnknownEnum.Value_88 || state == UnknownEnum.Value_64 || state == UnknownEnum.Value_65 || state == UnknownEnum.Value_63 || state == UnknownEnum.Value_23 || state == UnknownEnum.Value_55 || state == UnknownEnum.Value_25 || state == UnknownEnum.Value_105) && state != UnknownEnum.Value_68 && state != UnknownEnum.Value_66 && state != UnknownEnum.Value_69 && state != UnknownEnum.Value_70)
    {
        hsp = 0;
        vsp = 0;
        machTwo = 0;
        state = UnknownEnum.Value_54;
        x = other.x + (other.sprite_width / 2);
        y = round(y);
        
        if ((y % 2) == 1)
            y -= 1;
    }
}
