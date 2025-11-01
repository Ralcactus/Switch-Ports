function path_init(arg0 = true)
{
    if (arg0)
        mypath = -4;
    
    path_lock_timer = 1;
    path_pos = 0;
    path_dir = 1;
    on_path = false;
    path_xoff = 0;
    path_yoff = 0;
    path_pause = false;
    path_percent = 0;
    stop_path = false;
    stop_path_ease = 1;
    path_set_properties = false;
}
