if (!audio_group_is_loaded(bgm_endless_win))
{
    alarm[0] = 1;
    exit;
}

room_goto_fade(rm_title);
