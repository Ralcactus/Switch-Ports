with (other)
{
    image_index = 0;
    sprite_index = spr_player_PZ_fireAss_intro;
    state = UnknownEnum.Value_107;
    vsp = -20;
    movespeed = hsp;
    
    if (!event_isplaying(sndFireass))
        fmod_event_play(sndFireass);
    
    event_play_oneshot("event:/SFX/player/burn", x, y);
}
