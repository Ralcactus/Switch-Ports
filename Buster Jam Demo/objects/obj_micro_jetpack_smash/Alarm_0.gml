if (instance_exists(obj_microscanner_setup))
    exit;

with (controller)
{
    if (room == rm_boomtown_wall_frenzy)
        event_set_time(18);
    else
        event_set_time(12);
    
    win = false;
}
