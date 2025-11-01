testvariablenothing = false;
audio_stop_all();
vspd = 0;

if (!audio_group_is_loaded(bgm_endless_jingleA))
    audio_group_load(bgm_endless_jingleA);

alarm[0] = 1;
