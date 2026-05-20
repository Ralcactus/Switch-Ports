audio_sound_pitch(snd_scampton_voice, 1);
audio_sound_pitch(snd_scampton_voice_2, 1);
audio_sound_pitch(snd_Parry, 1);
audio_sound_pitch(snd_HeavyThunder, 1);
audio_sound_pitch(circus, 1);
audio_sound_gain(circus, 1, 0);

with (instance_create_depth(0, 0, -2000, oCC2))
    Seed = "MenuPris";

with (instance_create_depth(0, 0, -20000, oCC2))
    Seed = "DarkOut";

MM_Cursor = "nonono";
audio_stop_all();
audio_stop_sound(circus);
audio_stop_sound(M);

if (oP.PistonMode)
    audio_play_sound(M, 100, true);
else
    audio_play_sound(circus, 100, true);

CamWait = 0;
oP.HaveHit = 0;
oP.WayWin = 0;
oP.Deaths = 0;
oP.MusicP = 0;

with (instance_create_depth(0, 0, -20000, oEEF))
    Seed = "Fadein_in_in";
