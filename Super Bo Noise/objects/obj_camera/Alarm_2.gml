if (global.timedgate == 1)
{
    global.timedgate = 0
    global.seconds = 30
    ded = 0
    alarm[2] = -1
}
if (global.miniboss == true)
{
    with (obj_player1)
    {
        instance_create(x, y, obj_bangeffect)
        repeat (6)
            instance_create(x, y, obj_slapstar)
        state = (9 << 0)
        vsp = -10
        audio_stop_sound(global.music)
        scr_soundeffect(sfx_timeup)
    }
    alarm[2] = -1
    global.miniboss = false
}
