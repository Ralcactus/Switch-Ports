timer[0] = -1;

timer_func[0] = function()
{
    print("sound stopped");
    audio_stop_sound(my_snd);
    instance_destroy();
};
