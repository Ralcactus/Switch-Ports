if (instance_exists(obj_options))
    exit;

if (input_check_pressed("pause"))
{
    event_unpause();
    exit;
}

event_user(0);
