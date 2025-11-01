if (global.cam_follow == id)
{
    var _shakeX = irandom_range(-global.screen_shake[0], global.screen_shake[0]);
    var _shakeY = irandom_range(-global.screen_shake[1], global.screen_shake[1]);
    camera_set_view_pos(view_camera[0], round(x) + _shakeX, round(y) + _shakeY + cam_yoff);
}

if (camera_move)
{
    var _percent;
    
    if (percent_tie == undefined)
    {
        percent_camera = approach(percent_camera, 1, cam_speed);
        _percent = percent_camera;
    }
    else
    {
        with (obj_map_actor)
        {
            if (ID == other.percent_tie)
                _percent = percent_move;
        }
    }
    
    x = use_curve(acurv_linear, _percent, undefined, cam_xstart, cam_xto);
    
    if (cam_yto != undefined)
        y = use_curve(acurv_linear, _percent, undefined, cam_ystart, cam_yto);
    
    if ((x == cam_xto || cam_xto == undefined) && (y == cam_yto || cam_yto == undefined))
    {
        if (camera_unpause_when_finished)
        {
            paused = false;
            event_continue();
        }
        
        camera_unpause_when_finished = false;
        camera_move = false;
    }
}
