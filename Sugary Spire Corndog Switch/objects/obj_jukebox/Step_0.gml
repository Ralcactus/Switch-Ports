scr_getinput();

if (active)
{
    obj_parent_player.state = UnknownEnum.Value_110;
    move = key_left2 + key_right2;
    selected += move;
    selected = wrap(selected, 0, array_length(music) - 1);
    
    if (key_jump)
    {
        var song = music[selected][0];
        audio_stop_all_music();
    }
}
