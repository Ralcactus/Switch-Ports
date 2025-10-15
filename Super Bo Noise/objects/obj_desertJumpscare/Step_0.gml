if input_check_pressed("jump")
{
    alarm[1] = -1
    active = false
    audio_stop_sound(desertSound)
    room_goto(Realtitlescreen)
    instance_destroy()
    scr_init()
}
if (!active)
    return;
if (oldPlaying && (!audio_is_playing(desertSound)))
    alarm[1] = 20
oldPlaying = audio_is_playing(desertSound)
