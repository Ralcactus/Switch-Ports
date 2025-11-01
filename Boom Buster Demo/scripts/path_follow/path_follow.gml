function path_follow()
{
    if (mypath != -4 && on_path)
    {
        if (!path_set_properties)
        {
            var _str = path_get_name(mypath);
            var _map = ds_map_find_value(global.map_path_data, _str);
            mypath_ease = -4;
            mypath_pause = 1;
            mypath_spd = path_get_speed(mypath, 0);
            
            if (!is_undefined(_map))
            {
                if (struct_exists(_map, "spd"))
                    mypath_spd = _map.spd;
                
                if (struct_exists(_map, "pause"))
                    mypath_pause = _map.pause;
                
                if (struct_exists(_map, "ease"))
                    mypath_ease = _map.ease;
            }
            
            path_set_properties = true;
        }
        
        if (stop_path)
        {
            hspd = 0;
            vspd = 0;
        }
        else
        {
            if (path_pos == 1)
                path_pos = 0;
            
            has_collision = false;
            
            if (mypath_ease == 2)
            {
                path_percent = approach(path_percent, path_dir, mypath_spd * stop_path_ease);
                
                if (!path_pause && path_percent == path_dir)
                    path_pause = mypath_pause;
                
                path_pos = use_curve(acurv_basics, path_percent, "ease_inout", 0, 0.5);
                
                if (path_pause)
                {
                    path_pause--;
                    
                    if (path_pause == 0)
                        path_dir = !path_dir;
                }
            }
            else
            {
                path_pos += (stop_path_ease * (mypath_spd * path_dir));
            }
            
            if (path_pos > 1)
                path_pos = 1;
            
            if (path_pos < 0)
                path_pos = 0;
            
            var x1 = x - path_xoff;
            var y1 = y - path_yoff;
            var x2 = path_get_x(mypath, path_pos);
            var y2 = path_get_y(mypath, path_pos);
            hspd = x2 - x1;
            vspd = y2 - y1;
            
            if (mypath_ease == 2)
            {
            }
            else
            {
                var _pos = path_pos;
                
                if (path_get_closed(mypath))
                {
                    if (_pos == 1)
                        path_pos = 0;
                }
                else if (_pos == 0 || _pos == 1)
                {
                    path_dir = -path_dir;
                }
            }
            
            stop_path_ease = approach(stop_path_ease, 1, 0.02);
        }
        
        return true;
    }
    
    return false;
}
