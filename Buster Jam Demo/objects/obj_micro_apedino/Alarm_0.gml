if (instance_exists(obj_microscanner_setup))
    exit;

with (controller)
{
    event_set_time(12);
    win = true;
}

instance_create_micro(0, 0, "Over2", obj_micro_apedino_gui);
