with (obj_parent_player)
{
    if (state != UnknownEnum.Value_58 && state != UnknownEnum.Value_69)
    {
        event_play_oneshot("event:/SFX/general/superspring", x, y);
        other.image_index = 0;
        other.image_speed = 0.35;
        hsp = 0;
        
        if (other.image_yscale == 1)
        {
            sprite_index = spr_player_PZ_superSpring;
            state = UnknownEnum.Value_58;
            vsp = -12;
            verticalMovespeed = vsp;
            freeFallSmash = 0;
        }
        else
        {
            state = UnknownEnum.Value_69;
            movespeed = 0;
            vsp = 10;
            freeFallSmash = 0;
            sprite_index = spr_player_PZ_fall_outOfControl;
        }
        
        x = other.x;
    }
}
