if (bubble_spr != -4)
{
    bubble_ind += ((sprite_get_speed(bubble_spr) / 60) * global.delta_game_factor);
    
    if (bubble_ind >= sprite_get_number(bubble_spr))
    {
        if (bubble_spr == spr_wizardstab_bubble_poof)
            bubble_spr = -4;
    }
}

man_ind += ((sprite_get_speed(man_spr) / 60) * global.delta_game_factor * man_animspd);

if (man_ind >= sprite_get_number(man_spr))
{
    if (man_spr == spr_wizardstab_man_lose)
    {
        man_ind = 1;
        man_animspd = 0;
    }
}

arrow_ind += ((sprite_get_speed(spr_wizardstab_arrow) / 60) * global.delta_game_factor);

if (input_check_pressed("right") && knife_in == 0 && !lose)
{
    audio_play_sound_on(controller.audio, snd_micro_stab_in, false, 0);
    knife_in = 1;
    stabs++;
    
    if (stabs == stabs_needed)
    {
        chars_ind = 1;
        scr_micro_win();
        man_spr = spr_wizardstab_man_win;
        man_ind = 0;
        audio_play_sound_on(controller.audio, snd_micro_stab_scream, false, 0);
    }
}

if (input_check_pressed("left") && knife_in == 1 && !lose)
{
    audio_play_sound_on(controller.audio, snd_micro_stab_out, false, 0);
    knife_in = 0;
}

if (controller.timer[0] <= (60 * time_bpm_to_seconds(140) * 0.5) && !lose && !controller.win)
{
    with (controller)
        event_add_time(3, true);
    
    lose = true;
    timer[0] = 60 * time_bpm_to_seconds(140) * 0.5;
    bubble_spr = spr_wizardstab_bubble_poof;
    bubble_ind = 0;
    audio_play_sound_on(controller.audio, snd_enemy_poof, false, 0);
}

timer_logic(0);
