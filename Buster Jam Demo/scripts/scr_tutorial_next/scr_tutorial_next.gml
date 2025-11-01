function scr_tutorial_next()
{
    with (obj_boss_tutorial)
    {
        last_state = state;
        state++;
        event_user(2);
    }
}
