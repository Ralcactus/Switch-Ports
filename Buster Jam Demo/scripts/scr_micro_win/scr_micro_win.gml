function scr_micro_win(arg0 = 100)
{
    with (controller)
        win = true;
    
    if (instance_exists(obj_frenzy))
    {
        with (obj_frenzy)
            event_win_sound();
    }
}
