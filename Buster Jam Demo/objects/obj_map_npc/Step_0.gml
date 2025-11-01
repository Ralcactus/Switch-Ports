depth_pos = -bbox_bottom;

if (!override_animations)
{
    if (talking)
    {
        if (idle_is_talk)
            anim_speed = 1;
        else
            anim_play(anim_talk);
    }
    else if (idle_is_talk)
    {
        anim_speed = 0;
        anim_index = 0;
    }
    else
    {
        anim_play(anim_idle);
    }
}

anim_logic();
