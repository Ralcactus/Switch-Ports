anim_play(spr_Br_kiss_buster_win);
shake = 4;
effect_alpha = 0.8;
timer[0] = 30;

with (controller)
{
    if (timer[0] < (60 * time_bpm_to_seconds(140) * 4))
        event_set_time(4, true);
}
