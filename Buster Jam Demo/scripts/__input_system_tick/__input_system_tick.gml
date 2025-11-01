function __input_system_tick()
{
    static _global = __input_global();
    
    _global.__frame++;
    _global.__previous_current_time = _global.__current_time;
    _global.__current_time = current_time;
    _global.__cleared = false;
    
    if ((true || __input_global().__on_mobile) && false)
    {
        var _touch_index = undefined;
        var _touch_press_index = _global.__pointer_pressed_index;
        var _i = 0;
        
        repeat (11)
        {
            var _held = device_mouse_check_button(_i, mb_left);
            
            if (!_held)
            {
                _global.__pointer_held_time[_i] = -1;
            }
            else
            {
                if (_global.__pointer_held_time[_i] < 0)
                    _global.__pointer_held_time[_i] = _global.__current_time;
                
                if (_touch_index == undefined || _global.__pointer_held_time[_i] > _global.__pointer_held_time[_touch_index])
                    _touch_index = _i;
            }
            
            _i++;
        }
        
        if (_touch_index == undefined)
            _touch_index = 0;
        
        _global.__pointer_pressed = device_mouse_check_button_pressed(_touch_index, mb_left);
        _global.__pointer_released = _global.__pointer_index_previous != undefined && device_mouse_check_button_released(_global.__pointer_index_previous, mb_left);
        var _w = display_get_gui_width();
        var _h = display_get_gui_height();
        
        if (_global.__pointer_released)
        {
            var _tx = device_mouse_x_to_gui(_global.__pointer_index_previous);
            var _ty = device_mouse_y_to_gui(_global.__pointer_index_previous);
            
            if (_tx < 35 || _tx > (_w - 35) || _ty < 35 || _ty > (_h - 35))
                _global.__pointer_released = false;
        }
        
        if (_global.__pointer_pressed)
        {
            var _tx = device_mouse_x_to_gui(_touch_index);
            var _ty = device_mouse_y_to_gui(_touch_index);
            
            if (_tx < 35 || _tx > (_w - 35) || _ty < 35 || _ty > (_h - 35))
                _global.__pointer_pressed = false;
        }
        
        _global.__pointer_index_previous = _global.__pointer_index;
        _global.__pointer_index = _touch_index;
        
        if (_global.__pointer_pressed)
            _global.__pointer_pressed_index = _touch_index;
    }
    
    if (__input_global().__on_desktop || false)
    {
        if (os_is_paused())
        {
            _global.__window_focus = false;
            io_clear();
            __input_gamepad_stop_trigger_effects(-3);
        }
        else if (_global.__window_focus)
        {
            if (_global.__window_focus_block_mouse)
            {
                _global.__window_focus_block_mouse = false;
                
                if (__input_mouse_button() != 0)
                    _global.__window_focus_block_mouse = true;
            }
        }
        else if (keyboard_key != vk_nokey || mouse_button != mb_none || (_global.__use_native_focus && window_has_focus()) || (false && _global.__pointer_moved))
        {
            _global.__window_focus = true;
            _global.__window_focus_frame = _global.__frame;
            _global.__window_focus_block_mouse = true;
            
            if (_global.__mouse_capture)
                _global.__mouse_capture_frame = _global.__frame;
            
            __input_player_apply_trigger_effects(-3);
        }
        else if (!_global.__use_native_focus)
        {
            if (window_has_focus() == false)
                _global.__use_native_focus = true;
        }
    }
    
    var _game_input_allowed_previous = _global.__game_input_allowed;
    _global.__game_input_allowed = false || _global.__window_focus;
    _global.__overlay_focus = false;
    
    if (_global.__using_steamworks)
    {
        if (steam_is_overlay_activated())
        {
            _global.__overlay_focus = true;
            _global.__game_input_allowed = false;
        }
    }
    
    if (_global.__use_debug_overlay_status)
    {
        if (is_debug_overlay_open())
        {
            _global.__overlay_focus = true;
            
            if (_global.__gamepad_tester_data.__block_input)
                _global.__game_input_allowed = false;
        }
    }
    
    if (_global.__game_input_allowed != _game_input_allowed_previous)
    {
        if (_global.__game_input_allowed)
            keyboard_virtual_hide();
        else
            keyboard_virtual_show(0, 0, 0, false);
    }
    
    if ((_global.__current_time - _global.__restart_time) < 1000)
        __input_clear_all();
    
    var _moved = false;
    var _m = 0;
    
    repeat ((3 << 0))
    {
        _global.__pointer_dx[_m] = 0;
        _global.__pointer_dy[_m] = 0;
        _m++;
    }
    
    if (_global.__mouse_capture && _global.__game_input_allowed)
    {
        if (__input_window_changed())
        {
            _global.__mouse_capture_blocked = true;
            input_mouse_capture_set(true, _global.__mouse_capture_sensitivity);
        }
        else if (_global.__mouse_capture_blocked && device_mouse_check_button_pressed(0, mb_left))
        {
            input_mouse_capture_set(true, _global.__mouse_capture_sensitivity);
        }
    }
    
    if (false || !(false && _global.__overlay_focus))
    {
        if (_global.__mouse_capture && !_global.__mouse_capture_blocked)
        {
            if (_global.__window_focus)
            {
                var _window_width = window_get_width();
                var _window_height = window_get_height();
                
                if ((_global.__frame - _global.__mouse_capture_frame) > 10)
                {
                    var _pointer_x = display_mouse_get_x() - window_get_x();
                    var _pointer_y = display_mouse_get_y() - window_get_y();
                    
                    if (abs(_pointer_x - (_window_width / 2)) >= 1 || abs(_pointer_y - (_window_height / 2)) >= 1)
                    {
                        _m = 0;
                        
                        repeat ((3 << 0))
                        {
                            var _old_x, _old_y;
                            
                            switch (_m)
                            {
                                case (0 << 0):
                                    if (view_enabled && view_visible[0])
                                    {
                                        var _camera = view_camera[0];
                                        var _viewW = camera_get_view_width(_camera);
                                        var _viewH = camera_get_view_height(_camera);
                                        var _viewX = camera_get_view_x(_camera);
                                        var _viewY = camera_get_view_y(_camera);
                                        _old_x = _viewX + (_viewW / 2);
                                        _old_y = _viewY + (_viewH / 2);
                                    }
                                    else
                                    {
                                        _old_x = room_width / 2;
                                        _old_y = room_height / 2;
                                    }
                                    
                                    _pointer_x = device_mouse_x(_global.__pointer_index);
                                    _pointer_y = device_mouse_y(_global.__pointer_index);
                                    break;
                                
                                case (1 << 0):
                                    _old_x = display_get_gui_width() / 2;
                                    _old_y = display_get_gui_height() / 2;
                                    _pointer_x = device_mouse_x_to_gui(_global.__pointer_index);
                                    _pointer_y = device_mouse_y_to_gui(_global.__pointer_index);
                                    break;
                                
                                case (2 << 0):
                                    _old_x = _window_width / 2;
                                    _old_y = _window_height / 2;
                                    _pointer_x = display_mouse_get_x() - window_get_x();
                                    _pointer_y = display_mouse_get_y() - window_get_y();
                                    break;
                            }
                            
                            var _dx = (_pointer_x - _old_x) * _global.__mouse_capture_sensitivity;
                            var _dy = (_pointer_y - _old_y) * _global.__mouse_capture_sensitivity;
                            
                            if (_m == (2 << 0) && ((_dx * _dx) + (_dy * _dy)) > 4)
                                _moved = true;
                            
                            _global.__pointer_dx[_m] = _dx;
                            _global.__pointer_dy[_m] = _dy;
                            _global.__pointer_x[_m] += _dx;
                            _global.__pointer_y[_m] += _dy;
                            _m++;
                        }
                    }
                }
                
                window_mouse_set(_window_width / 2, _window_height / 2);
            }
        }
        else if (_global.__window_focus || false || false)
        {
            _m = 0;
            
            repeat ((3 << 0))
            {
                var _old_x = _global.__pointer_x[_m];
                var _old_y = _global.__pointer_y[_m];
                var _pointer_x = _old_x;
                var _pointer_y = _old_y;
                
                switch (_m)
                {
                    case (0 << 0):
                        _pointer_x = device_mouse_x(_global.__pointer_index);
                        _pointer_y = device_mouse_y(_global.__pointer_index);
                        break;
                    
                    case (1 << 0):
                        _pointer_x = device_mouse_x_to_gui(_global.__pointer_index);
                        _pointer_y = device_mouse_y_to_gui(_global.__pointer_index);
                        break;
                    
                    case (2 << 0):
                        _pointer_x = display_mouse_get_x() - window_get_x();
                        _pointer_y = display_mouse_get_y() - window_get_y();
                        break;
                }
                
                if (_m == (2 << 0) && point_distance(_old_x, _old_y, _pointer_x, _pointer_y) > 2)
                    _moved = true;
                
                _global.__pointer_dx[_m] = _pointer_x - _old_x;
                _global.__pointer_dy[_m] = _pointer_y - _old_y;
                _global.__pointer_x[_m] = _pointer_x;
                _global.__pointer_y[_m] = _pointer_y;
                _m++;
            }
        }
    }
    
    _global.__pointer_moved = _moved;
    _global.__tap_click = false;
    _global.__tap_presses += device_mouse_check_button_pressed(0, mb_left);
    _global.__tap_releases += device_mouse_check_button_released(0, mb_left);
    
    if (_global.__tap_releases >= _global.__tap_presses)
    {
        _global.__tap_click = _global.__tap_releases > _global.__tap_presses;
        _global.__tap_presses = 0;
        _global.__tap_releases = 0;
    }
    
    if (_global.__keyboard_allowed && keyboard_check(vk_anykey))
    {
        var _platform = 0;
        
        switch (_platform)
        {
            case 0:
                if (keyboard_check(vk_alt) && keyboard_check_pressed(vk_space))
                {
                    keyboard_key_release(vk_alt);
                    keyboard_key_release(vk_space);
                    keyboard_key_release(vk_lalt);
                    keyboard_key_release(vk_ralt);
                }
                
                if (keyboard_check(230) && !keyboard_check_pressed(230))
                    keyboard_key_release(230);
                
                break;
            
            case "apple_web":
                if (keyboard_check_released(91) || keyboard_check_released(92))
                {
                    var _i = 8;
                    var _len = 255 - _i;
                    
                    repeat (_len)
                    {
                        keyboard_key_release(_i);
                        _i++;
                    }
                }
                
                break;
            
            case 1:
                if (keyboard_check_released(vk_control))
                {
                    keyboard_key_release(vk_lcontrol);
                    keyboard_key_release(vk_rcontrol);
                }
                
                if (keyboard_check_released(vk_shift))
                {
                    keyboard_key_release(vk_lshift);
                    keyboard_key_release(vk_rshift);
                }
                
                if (keyboard_check_released(vk_alt))
                {
                    keyboard_key_release(vk_lalt);
                    keyboard_key_release(vk_ralt);
                }
                
                if (keyboard_check_released(91))
                    keyboard_key_release(92);
                else if (keyboard_check_released(92) && keyboard_check(91))
                    keyboard_key_release(91);
                
                break;
        }
    }
    
    var _steam_handles_changed = false;
    
    if (_global.__using_steamworks)
    {
        steam_input_run_frame();
        _steam_handles_changed = __input_steam_handles_changed();
        _global.__steam_handles = steam_input_get_connected_controllers();
    }
    
    if (_global.__gamepad_allowed && _global.__frame > 10)
    {
        if (_global.__allow_gamepad_enumerate)
        {
            if ((_global.__current_time - _global.__enumeration_time) > 1000)
            {
                _global.__enumeration_time = _global.__current_time;
                gamepad_enumerate();
            }
        }
        
        _g = 0;
        
        repeat (array_length(_global.__gamepads))
        {
            var _connected = gamepad_is_connected(_g);
            _global.__gamepad_connections_native[_g] = _connected;
            _global.__gamepad_connections_internal[_g] = false;
            var _gamepad = _global.__gamepads[_g];
            
            if (is_struct(_gamepad))
            {
                if (_connected)
                {
                    with (_gamepad)
                    {
                        if (false && __description != gamepad_get_description(_g))
                        {
                            __discover();
                        }
                        else if (_steam_handles_changed)
                        {
                            __virtual_set();
                            __led_set();
                        }
                    }
                }
                
                var _sustain_connection = _gamepad.__tick(_connected);
                _global.__gamepad_connections_internal[_g] = _sustain_connection;
                
                if (!_sustain_connection)
                {
                    __input_trace("Gamepad ", _g, " disconnected");
                    gamepad_set_vibration(_global.__gamepads[_g].__index, 0, 0);
                    _global.__gamepads[_g] = undefined;
                    _p = 0;
                    
                    repeat (2)
                    {
                        with (_global.__players[_p])
                        {
                            if (__source_contains(__input_global().__source_gamepad[_g]))
                            {
                                __input_trace("Player ", _p, " gamepad disconnected");
                                __source_remove(__input_global().__source_gamepad[_g]);
                            }
                        }
                        
                        _p++;
                    }
                }
            }
            else if (_global.__gamepad_connections_native[_g])
            {
                __input_trace("Gamepad ", _g, " connected");
                __input_trace("New gamepad = \"", gamepad_get_description(_g), "\", GUID=\"", gamepad_get_guid(_g), "\", buttons = ", gamepad_button_count(_g), ", axes = ", gamepad_axis_count(_g), ", hats = ", gamepad_hat_count(_g));
                _global.__gamepads[_g] = new __input_class_gamepad(_g);
            }
            
            _g++;
        }
    }
    
    if (_global.__virtual_order_dirty)
    {
        var _i = 0;
        
        repeat (array_length(_global.__virtual_array))
        {
            if (_global.__virtual_array[_i].__destroyed)
                array_delete(_global.__virtual_array, _i, 1);
            else
                _i++;
        }
        
        _global.__virtual_order_dirty = false;
        array_sort(_global.__virtual_array, function(arg0, arg1)
        {
            return sign(arg1.__priority - arg0.__priority);
        });
    }
    
    if (is_struct(_global.__touch_player))
    {
        var _i = 0;
        
        repeat (11)
        {
            if (device_mouse_check_button_pressed(_i, mb_left))
            {
                var _j = 0;
                
                repeat (array_length(_global.__virtual_array))
                {
                    if (_global.__virtual_array[_j].__capture_touchpoint(_i))
                        break;
                    
                    _j++;
                }
            }
            
            _i++;
        }
        
        _i = 0;
        
        repeat (array_length(_global.__virtual_array))
        {
            _global.__virtual_array[_i].__tick();
            _i++;
        }
    }
    
    var _p = 0;
    
    repeat (2)
    {
        _global.__players[_p].__tick();
        _p++;
    }
    
    var _any_players_changed = false;
    var _connection_array = _global.__players_status.__new_connections;
    var _disconnection_array = _global.__players_status.__new_disconnections;
    var _status_array = _global.__players_status.__players;
    array_resize(_connection_array, 0);
    array_resize(_disconnection_array, 0);
    _p = 0;
    
    repeat (2)
    {
        var _old_status = _status_array[_p];
        
        if (_global.__players[_p].__connected)
        {
            if (_old_status == (-1 << 0) || _old_status == (0 << 0))
            {
                _any_players_changed = true;
                _status_array[_p] = (1 << 0);
                array_push(_global.__players_status.__new_connections, _p);
            }
            else
            {
                _status_array[_p] = (2 << 0);
            }
        }
        else if (_old_status == (1 << 0) || _old_status == (2 << 0))
        {
            _any_players_changed = true;
            _status_array[_p] = (-1 << 0);
            array_push(_global.__players_status.__new_disconnections, _p);
        }
        else
        {
            _status_array[_p] = (0 << 0);
        }
        
        _p++;
    }
    
    _global.__players_status.__any_changed = _any_players_changed;
    var _any_gamepads_changed = false;
    _connection_array = _global.__gamepads_status.__new_connections;
    _disconnection_array = _global.__gamepads_status.__new_disconnections;
    _status_array = _global.__gamepads_status.__gamepads;
    array_resize(_connection_array, 0);
    array_resize(_disconnection_array, 0);
    var _device_count = array_length(_global.__gamepad_connections_native);
    
    if (array_length(_status_array) != _device_count)
        array_resize(_status_array, _device_count);
    
    var _g = 0;
    
    repeat (_device_count)
    {
        var _old_status = _status_array[_g];
        
        if (input_gamepad_is_connected(_g))
        {
            if (_old_status == (-1 << 0) || _old_status == (0 << 0))
            {
                _any_gamepads_changed = true;
                _status_array[_g] = (1 << 0);
                array_push(_connection_array, _g);
            }
            else
            {
                _status_array[_g] = (2 << 0);
            }
        }
        else if (_old_status == (1 << 0) || _old_status == (2 << 0))
        {
            _any_gamepads_changed = true;
            _status_array[_g] = (-1 << 0);
            array_push(_disconnection_array, _g);
        }
        else
        {
            _status_array[_g] = (0 << 0);
        }
        
        _g++;
    }
    
    _global.__gamepads_status.__any_changed = _any_gamepads_changed;
    
    switch (_global.__source_mode)
    {
        case (0 << 0):
            break;
        
        case (1 << 0):
            __input_multiplayer_assignment_tick();
            break;
        
        case (2 << 0):
            __input_hotswap_tick();
            break;
        
        case (3 << 0):
            break;
        
        case (4 << 0):
            break;
    }
    
    if (_global.__allow_gamepad_tester && _global.__gamepad_tester_data.__enabled)
        __input_gamepad_tester_tick();
}
