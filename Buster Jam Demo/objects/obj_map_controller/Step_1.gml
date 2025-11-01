coins_before = global.coins;

if (keyboard_check_pressed(vk_f1) && global.debug)
{
    if (room_width > 7500)
        _maxW = 7500;
    else
        _maxW = room_width;
    
    if (room_height > 7500)
        _maxH = 7500;
    else
        _maxH = room_height;
    
    steps_needed_w = ceil(room_width / _maxW);
    steps_needed_h = ceil(room_height / _maxH);
    steps = [];
    step = 0;
    show_message(steps_needed_w);
    show_message(steps_needed_h);
    
    for (var i = 0; i < steps_needed_w; i++)
    {
        for (var j = 0; j < steps_needed_h; j++)
            array_push(steps, [_maxW * i, _maxH * j]);
    }
    
    camera_set_view_size(view_camera[0], _maxW, _maxH);
    window_set_rectangle(0, 0, _maxW, _maxH);
    surface_resize(application_surface, _maxW, _maxH);
    
    with (obj_cam_clamp)
        instance_destroy();
    
    instance_destroy(obj_map_cam);
    camera_set_view_pos(view_camera[0], 0, 0);
    alarm[1] = 4;
}
