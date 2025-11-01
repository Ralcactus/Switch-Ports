if (!ready)
    exit;

if (instance_place_3d(x, y, z, obj_map_player) && !touched)
{
    touched = true;
    
    if (delay > 0)
        timer[0] = delay;
    else
        timer_func[0]();
}

if (touched)
{
    if (deac_mapname && instance_exists(obj_map_name))
        instance_deactivate_object_hook(obj_map_name);
}

if (touched && !instance_exists(obj_scene_manager) && timer[0] == -1)
{
    if (deac_mapname)
        instance_activate_object(obj_map_name);
    
    instance_destroy();
}

timer_logic(0);
