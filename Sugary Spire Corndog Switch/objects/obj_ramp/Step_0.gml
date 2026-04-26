if (place_meeting(x, y - 16, obj_parent_player))
{
    with (obj_parent_player)
    {
        if (place_meeting(x, y + 16, other.id) && !scr_solid(x + xscale, y, true) && bbox_bottom <= other.bbox_top && xscale == sign(other.image_xscale))
        {
            if (state == UnknownEnum.Value_64 || state == UnknownEnum.Value_65 || state == UnknownEnum.Value_133)
            {
                if (state != UnknownEnum.Value_133)
                    event_play_oneshot("event:/SFX/player/rampjump", x, y);
                
                state = UnknownEnum.Value_133;
                vsp = -12;
                movespeed = 14;
            }
            else if (state == UnknownEnum.Value_78 || state == UnknownEnum.Value_79)
            {
                inputBuffer = 60;
                vsp = -22;
                movespeed = 22 * obj_parent_player.xscale;
            }
        }
    }
}
