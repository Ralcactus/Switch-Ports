if (place_meeting(x, y - 16, obj_parent_player))
{
    with (obj_parent_player)
    {
        if (((place_meeting(x, y + 1, obj_ladder) && grounded && (state == UnknownEnum.Value_60 || state == UnknownEnum.Value_70 || state == UnknownEnum.Value_26)) || (place_meeting(x, y + 16, obj_ladder) && !grounded && (state == UnknownEnum.Value_34 || state == UnknownEnum.Value_33 || state == UnknownEnum.Value_69))) && !place_meeting_collision(other.x + (other.sprite_width / 2), round(y + 5), UnknownEnum.Value_12) && key_down)
        {
            hsp = 0;
            
            if (grounded)
                vsp = 0;
            
            y += (grounded ? 5 : 21);
            state = UnknownEnum.Value_54;
            x = other.x + (other.sprite_width / 2);
            y = round(y);
            
            if ((y % 2) == 1)
                y -= 1;
        }
    }
}
