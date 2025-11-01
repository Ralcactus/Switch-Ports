if (target_swap == 0)
    target = obj_player;
else
    target = obj_player;

if (keyboard_check_pressed(vk_f8) && global.debug)
    target_swap = !target_swap;

if (target_swap != 0)
{
    var _zoom = 0.6;
    var _w = 1408 * _zoom;
    var _h = 1080 * _zoom;
    camera_set_view_size(view_camera[0], _w, _h);
    
    if (instance_exists(target))
    {
        _x = target.x - (_w / 2);
        _x = clamp(_x, 64, room_width - _w - 64);
        var _targetY = target.y;
        _targetY = 1023;
        _y = _targetY - (52 * (1 - _zoom)) - (_h / 2);
        _y = clamp(_y, 64, room_height - _h - 64);
        camera_set_view_pos(view_camera[0], _x, _y - view_yoff);
    }
    
    exit;
}

if (cam_stretch)
    camera_set_view_size(view_camera[0], room_width, room_height);
else
    camera_set_view_size(view_camera[0], 1408 * zoom, 1080 * zoom);

if (global.stage_type == 0)
{
    if (locked_x != -4)
    {
        x = locked_x;
    }
    else if (instance_exists(target))
    {
        var _nocam = false;
        
        with (target)
        {
            if (place_meeting(x, y, obj_nocam))
            {
                var _inst = instance_place(x, y, obj_nocam);
                
                if (!_inst.vertical_only)
                    _nocam = true;
            }
        }
        
        if (!_nocam)
        {
            var relativePosition = clamp((target.x - barrierL) / (barrierR - barrierL), 0, 1);
            
            if (relative_position == -4)
                relative_position = relativePosition;
            
            relative_position = lerp(relative_position, relativePosition, relative_pos_ease);
            relative_pos_ease = approach(relative_pos_ease, 1, 0.025);
            x = lerp(64, room_width - (64 * zoom) - (1408 * zoom), relative_position);
        }
    }
    
    if (locked_y != -4)
    {
        y = locked_y;
    }
    else if (instance_exists(target) && !place_meeting(target.x, target.y, obj_nocam))
    {
        var _nocam = false;
        
        with (target)
        {
            if (place_meeting(x, y, obj_nocam))
                _nocam = true;
        }
        
        if (!_nocam)
        {
            var relativePosition = clamp((target.y - barrierU) / (barrierD - barrierU), 0, 1);
            y = lerp(64 + cam_yoff, room_height - (64 * zoom) - (1080 * zoom), relativePosition);
        }
    }
}
else if (global.stage_type == 1)
{
    x = (target.x - 704) + 200;
    y = 0;
}

var _x = !cam_stretch * (x + (global.screenshake[0] * zoom) + cam_xoff);
var _y = !cam_stretch * (y + (global.screenshake[1] * zoom) + cam_yoff + 8);
camera_set_view_pos(view_camera[0], _x, _y);

if (global.stage_type == 1)
{
    instance_deactivate_object(obj_solid);
    instance_deactivate_object(obj_semisolid);
    instance_deactivate_object(par_enemy);
    instance_deactivate_object(par_carry);
    get_cams();
    instance_activate_region(camx - 64, camy, 1472, 1080, true);
    
    if (instance_exists(obj_player))
    {
        for (var i = 0; i < ds_list_size(obj_player.list_carry); i++)
            instance_activate_object(ds_list_find_value(obj_player.list_carry, i));
    }
}

if (obj_editor.edit_mode)
{
    xAxis = keyboard_check(ord("D")) - keyboard_check(ord("A"));
    yAxis = keyboard_check(ord("S")) - keyboard_check(ord("W"));
    cam_xoff += ((xAxis * 6) + (xAxis * (6 * !keyboard_check(vk_shift))));
    cam_yoff += ((yAxis * 6) + (yAxis * (6 * !keyboard_check(vk_shift))));
    
    if (keyboard_check_pressed(vk_tab))
    {
        cam_xoff = 0;
        cam_yoff = 0;
    }
}
