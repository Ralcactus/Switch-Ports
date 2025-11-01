timer[0] = 35;

timer_func[0] = function()
{
    hspd = -5.2;
    go = true;
    sndFuse = audio_play_sound_on(controller.audio, snd_fuse, true, 0);
};

go = false;
stopped = false;
hspd = 0;
anim_init();
anim_play(spr_Bu_defuse_spark);
xoff = 0;
yoff = 0;
sndFuse = -4;
