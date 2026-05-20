op.camMode = "player";
op.parameter = [0, 640, 0, 0];
audio_sound_gain(mus_Steam_Jams, 1, 0);
audio_stop_sound(mus_Socks_World);
audio_stop_sound(mus_Socks_world_8bit);

if (!array_contains(op.progress, "sockIntro"))
{
    audio_stop_all();
    op.musicOW = -1;
}
else
{
    audio_sound_gain(mus_Steam_Jams, 1, 0);
    ow_music(mus_Steam_Jams);
}

res_i();
i2 = 24;
i3 = 1;
i4 = 60;
i5 = false;
res_j();
j1 = [0, 0];
j2 = true;
op.pastRoom = -1;
