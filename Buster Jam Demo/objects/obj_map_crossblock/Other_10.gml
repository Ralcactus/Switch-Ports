audio_play_sound(snd_crosswalk_wait, 0, 0);

with (obj_enemy_crossing)
    crosswalk_stop = true;

with (obj_enemy_crossing_spawner)
    crosswalk_stop = true;

with (obj_map_crossblock)
{
    time_cross = 3;
    anim_index = 1;
    timer[1] = -1;
}

timer[1] = 60;
