if (text_pos >= array_length(text))
    alarm[0] = 150
else
{
    with (obj_camera)
    {
        shake_mag = 2
        shake_mag_acc = 3 / room_speed
    }
    audio_play_sound(sfx_killingblow,1,0)
    text[text_pos][0] = 1
    text_pos++
    alarm[3] = 40
}
