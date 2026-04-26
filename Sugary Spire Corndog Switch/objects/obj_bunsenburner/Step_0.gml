if (sprite_index == candleBurn || global.freezeframe)
    exit;

var touched = false;

if (place_meeting(x, y, obj_parent_player))
{
    with (obj_parent_player)
    {
        if (state == UnknownEnum.Value_134 || state == UnknownEnum.Value_0)
            exit;
        
        if (state == UnknownEnum.Value_78 || state == UnknownEnum.Value_79)
        {
            if (sprite_index != spr_player_PZ_dogMount_inflate_jump)
            {
                sprite_index = spr_player_PZ_dogMount_inflate;
                image_index = 0;
                vsp = -10;
                state = UnknownEnum.Value_81;
                touched = true;
            }
        }
        else if (state != UnknownEnum.Value_81)
        {
            sprite_index = spr_player_PZ_fireAss_intro;
            vsp = -20;
            state = UnknownEnum.Value_107;
            image_index = 0;
            movespeed = hsp;
            
            if (!event_isplaying(sndFireass))
                fmod_event_play(sndFireass);
            
            event_play_oneshot("event:/SFX/player/burn", x, y);
            touched = true;
        }
    }
}

if (sprite_index != candleBurn && touched)
{
    sprite_index = candleBurn;
    image_index = 0;
}
