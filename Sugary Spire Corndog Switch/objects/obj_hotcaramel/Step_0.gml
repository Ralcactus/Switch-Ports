if (place_meeting(x, y - 1, obj_parent_player))
{
    with (obj_parent_player)
    {
        var minecart_can_traverse = state == UnknownEnum.Value_100 && y < (other.y + 40);
        
        if (state != UnknownEnum.Value_134 && !minecart_can_traverse && !global.freezeframe)
        {
            if (state == UnknownEnum.Value_87 || state == UnknownEnum.Value_96)
                instance_create(x, y, obj_poofeffect);
            
            if (state == UnknownEnum.Value_100)
            {
                instance_create(x, y, obj_bombExplosionHarmless);
                
                for (var i = 0; i < (sprite_get_number(spr_minecartdebris) - 1); i++)
                {
                    with (create_debris(x + random_range(-10, 10), y + random_range(-10, 10), spr_minecartdebris))
                        image_index = i;
                }
            }
            
            image_index = 0;
            sprite_index = spr_player_PZ_fireAss_intro;
            state = UnknownEnum.Value_107;
            vsp = -20;
            movespeed = hsp;
            
            if (!event_isplaying(sndFireass))
                fmod_event_play(sndFireass);
            
            event_play_oneshot("event:/SFX/player/burn", x, y);
        }
    }
}
