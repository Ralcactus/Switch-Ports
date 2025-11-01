anim_init();
alarm[0] = 2;

if (instance_exists(obj_boss_tutorial))
{
    with (obj_microgame_controller)
        event_set_time(9);
}

hspd = 0;
