with (controller)
{
    zoom = 0.9;
    screenshake[0] = 16;
    screenshake[1] = 16;
}

crumbling = true;
var _snd = audio_play_sound_on(controller.audio, snd_micro_demoswing_crumble, true, 0);
audio_sound_gain(_snd, 0, 0);
audio_sound_gain(_snd, 1, 400);
timer[2] = 60 * time_bpm_to_seconds(140) * 3;
