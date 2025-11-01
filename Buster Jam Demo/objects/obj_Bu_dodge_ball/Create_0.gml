mult = 3;
darkness = 0.5;
rotate_spd = choose(-3, 3);
scale = 7;
scale_spd = 0.1;
start_spd = 0.2;
dir = choose(1, -1);
go = false;
timer[0] = irandom_range(45, 150);

timer_func[0] = function()
{
    dir = obj_Bu_dodge.dir;
    x += (740 * dir);
    go = true;
};

timer[1] = timer[0] - 25;

timer_func[1] = function()
{
    audio_play_sound_on(controller.audio, snd_Bu_dodge, 0, 0);
};
