if (game_paused())
    exit;

if (showjeg)
{
    jegtransition = min(jegtransition + 0.01, 1);
    exit;
}

var _spd = new Vec2(0, 0);

if (!obj_drawcontroller.debugcam)
{
    showcursor = false;
    
    if (!in_debug_menu())
    {
        var _s = input_distance("debug_cam_left", "debug_cam_right", "debug_cam_forward", "debug_cam_back");
        var _dir = (-yaw + input_direction(0, "debug_cam_left", "debug_cam_right", "debug_cam_forward", "debug_cam_back")) - 90;
        _spd.x = dcos(_dir) * _s * 4;
        _spd.y = dsin(_dir) * _s * 4;
        var _pressed;
        
        if (!input_player_using_gamepad())
        {
            window_mouse_set_locked(true);
            var _sens = 7;
            yaw += (window_mouse_get_delta_x() / _sens);
            window_mouse_set(window_get_width() / 2, window_get_height() / 2);
            global.gameframe_set_cursor = false;
            window_set_cursor(cr_none);
            _pressed = input_mouse_check_pressed(1);
        }
        else
        {
            window_mouse_set_locked(false);
            var _sens = 1;
            yaw += (input_check_opposing("debug_cam_lookleft", "debug_cam_lookright") / _sens);
            _pressed = input_check_pressed("attack");
        }
        
        var _raycast = collision_line(x, y, x + (dcos(-yaw) * cursorrange), y + (dsin(-yaw) * cursorrange), obj_jegdoor, false, true);
        
        if (_raycast)
        {
            with (_raycast)
            {
                if (open > 0)
                    break;
                
                other.showcursor = true;
                
                if (_pressed)
                    interact();
            }
        }
    }
    else
        window_mouse_set_locked(false);
}

cursorind += 0.35;
cursorind %= sprite_get_number(cursorspr);
var _vsp = (_spd.y > 0) ? floor(_spd.y) : ceil(_spd.y);
suby += (_spd.y - _vsp);

if (abs(suby) >= 1)
{
    suby -= (1 * sign(suby));
    _vsp += (1 * sign(suby));
}

repeat (abs(_vsp))
{
    ds_list_clear(collided);
    var _l = noclip ? 0 : instance_place_list(x, y + sign(_vsp), obj_jegwall, collided, false);
    var _success = true;
    
    for (var _i = 0; _i < _l; _i++)
    {
        if (collided[| _i].canCollide(id, x, y))
        {
            _success = false;
            break;
        }
    }
    
    if (_success)
        y += sign(_vsp);
    else
        break;
}

var _hsp = (_spd.x > 0) ? floor(_spd.x) : ceil(_spd.x);
subx += (_spd.x - _hsp);

if (abs(subx) >= 1)
{
    subx -= (1 * sign(subx));
    _hsp += (1 * sign(subx));
}

repeat (abs(_hsp))
{
    ds_list_clear(collided);
    var _l = noclip ? 0 : instance_place_list(x + sign(_hsp), y, obj_jegwall, collided, false);
    var _success = true;
    
    for (var _i = 0; _i < _l; _i++)
    {
        if (collided[| _i].canCollide(id, x, y))
        {
            _success = false;
            break;
        }
    }
    
    if (_success)
        x += sign(_hsp);
    else
        break;
}
