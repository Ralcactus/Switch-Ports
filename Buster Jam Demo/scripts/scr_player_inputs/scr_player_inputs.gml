function scr_player_inputs()
{
    if (auto)
    {
    }
    else if (opening)
    {
        xAxis = xAxis_open;
        yAxis = yAxis_open;
    }
    else if (deac || instance_exists(obj_microgame_controller) || instance_exists(obj_scene_manager) || (room_started_delay && !opening) || (instance_exists(par_map_cutscene) && !opening))
    {
        xAxis = 0;
        yAxis = 0;
        aPressed = false;
        bPressed = false;
    }
    else
    {
        if (input_source_using(__input_global().__source_keyboard, 0))
        {
            xAxis = input_check("right") - input_check("left");
            yAxis = input_check("down") - input_check("up");
        }
        else
        {
            xAxis = input_value("right_free") - input_value("left_free");
            yAxis = input_value("down_free") - input_value("up_free");
        }
        
        if (lock_xAxis)
            xAxis = 0;
        
        if (lock_yAxis)
            yAxis = 0;
        
        aPressed = input_check_pressed("jump");
        bPressed = input_check_pressed("action");
        bCheck = input_check("action");
    }
    
    room_started_delay = approach(room_started_delay, 0, 1);
}
