if ((global.hp - 1) < ID)
{
    audio_play_sound(snd_wronghuh, 0, 0);
    anim_play(spr_trans_hp_lost);
    shake = 1;
}
else
{
    audio_play_sound(snd_coin, 0, 0);
    percent_scale = 0;
    instance_create_depth(x, y - 30, depth - 1, obj_win_screen_coin);
}

if (obj_win_screen.hp_count_max == (ID + 1))
{
    with (obj_win_screen)
        event_last_hp();
}
