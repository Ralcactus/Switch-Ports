if (place_meeting(x, y - 1, obj_player))
{
    with (obj_player)
    {
        if (state != states.noclip && !global.freezeframe)
        {
            if (state == states.cotton || state == states.cottondrill)
                instance_create(x, y, obj_poofeffect);
            
            sprite_index = spr_player_fireass;
            state = states.fireass;
            image_index = 0;
            vsp = -20;
            audio_stop_sound(sound_fireass);
            scr_sound(sound_fireass);
        }
    }
}
