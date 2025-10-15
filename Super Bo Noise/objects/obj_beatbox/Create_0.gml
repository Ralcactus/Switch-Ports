scr_initenemy()
Volume = 0
vsp = -11
beatBoxMusic = 0
pitch = 1
if (!instance_exists(obj_scaryfish))
{
    if (!audio_is_playing(sfx_beatbox))
    {
        audio_play_sound(sfx_beatbox,1,0)
        audio_sound_gain(obj_music.musicID, 0, 2000)
    }
}
