function scr_micro_lose(arg0 = 100)
{
    with (controller)
        lose = true;
    
    if (instance_exists(obj_frenzy))
    {
        with (obj_frenzy)
            event_lose_sound();
    }
}
