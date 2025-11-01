function __input_class_virtual() constructor
{
    static __global = __input_global();
    
    static destroy = function()
    {
        __destroyed = true;
        __global.__virtual_order_dirty = true;
        return undefined;
    };
    
    static debug_draw = function()
    {
        if (__destroyed || __background)
            exit;
        
        if (__active && is_struct(__global.__touch_player))
        {
            if (__circular == true)
            {
                draw_circle(__x, __y, __radius, true);
                draw_circle(__x, __y, __radius - 4, true);
                draw_circle(__x, __y, __radius - 8, !__held);
            }
            else if (__circular == false)
            {
                draw_rectangle(__left, __top, __right, __bottom, true);
                draw_rectangle(__left + 4, __top + 4, __right - 4, __bottom - 4, true);
                draw_rectangle(__left + 8, __top + 8, __right - 8, __bottom - 8, !__held);
            }
        }
        else
        {
            var _old_alpha = draw_get_alpha();
            draw_set_alpha(0.33 * _old_alpha);
            
            if (__circular == true)
                draw_circle(__x, __y, __radius, true);
            else if (__circular == false)
                draw_rectangle(__left, __top, __right, __bottom, true);
            
            draw_set_alpha(_old_alpha);
        }
    };
    
    static rectangle = function(arg0, arg1, arg2, arg3)
    {
        if (__destroyed || __background)
            return self;
        
        _left = min(arg0, arg2);
        _top = min(arg1, arg3);
        _right = max(arg0, arg2);
        _bottom = max(arg1, arg3);
        __circular = false;
        __left = _left;
        __top = _top;
        __right = _right;
        __bottom = _bottom;
        __width = (1 + _right) - _left;
        __height = (1 + _bottom) - _top;
        __x = 0.5 * (_left + _right);
        __y = 0.5 * (_bottom + _top);
        __radius = undefined;
        __start_x = __x;
        __start_y = __y;
        return self;
    };
    
    static circle = function(arg0, arg1, arg2)
    {
        if (__destroyed || __background)
            return self;
        
        __circular = true;
        __left = arg0 - arg2;
        __top = arg1 - arg2;
        __right = arg0 + arg2;
        __bottom = arg1 + arg2;
        __width = 2 * arg2;
        __height = 2 * arg2;
        __x = arg0;
        __y = arg1;
        __radius = arg2;
        __start_x = __x;
        __start_y = __y;
        return self;
    };
    
    static get_position = function()
    {
        static _struct = 
        {
            __left: undefined,
            __top: undefined,
            __right: undefined,
            __bottom: undefined,
            __width: undefined,
            __height: undefined,
            __x: undefined,
            __y: undefined,
            __radius: undefined
        };
        
        _struct.__left = __left;
        _struct.__top = __top;
        _struct.__right = __right;
        _struct.__bottom = __bottom;
        _struct.__width = __width;
        _struct.__height = __height;
        _struct.__x = __x;
        _struct.__y = __y;
        _struct.__radius = __radius;
        return _struct;
    };
    
    static button = function(arg0)
    {
        if (__destroyed || __background)
            return self;
        
        __type = (0 << 0);
        __verb_click = arg0;
        __verb_left = undefined;
        __verb_right = undefined;
        __verb_up = undefined;
        __verb_down = undefined;
        return self;
    };
    
    static hpad = function(arg0, arg1, arg2)
    {
        if (__destroyed || __background)
            return self;
        
        __type = (3 << 0);
        __verb_click = arg0;
        __verb_left = arg1;
        __verb_right = arg2;
        __verb_up = undefined;
        __verb_down = undefined;
        return self;
    };
    
    static vpad = function(arg0, arg1, arg2)
    {
        if (__destroyed || __background)
            return self;
        
        __type = (4 << 0);
        __verb_click = arg0;
        __verb_left = undefined;
        __verb_right = undefined;
        __verb_up = arg1;
        __verb_down = arg2;
        return self;
    };
    
    static dpad = function(arg0, arg1, arg2, arg3, arg4, arg5 = false)
    {
        if (__destroyed || __background)
            return self;
        
        __type = arg5 ? (1 << 0) : (2 << 0);
        __verb_click = arg0;
        __verb_left = arg1;
        __verb_right = arg2;
        __verb_up = arg3;
        __verb_down = arg4;
        return self;
    };
    
    static thumbstick = function(arg0, arg1, arg2, arg3, arg4)
    {
        if (__destroyed || __background)
            return self;
        
        __type = (5 << 0);
        __verb_click = arg0;
        __verb_left = arg1;
        __verb_right = arg2;
        __verb_up = arg3;
        __verb_down = arg4;
        return self;
    };
    
    static touchpad = function(arg0, arg1, arg2, arg3, arg4, arg5 = 10)
    {
        if (__destroyed || __background)
            return self;
        
        __type = (6 << 0);
        __verb_click = arg0;
        __verb_left = arg1;
        __verb_right = arg2;
        __verb_up = arg3;
        __verb_down = arg4;
        __max_distance = arg5;
        return self;
    };
    
    static get_type = function()
    {
        return __type;
    };
    
    static get_verbs = function()
    {
        static _struct = 
        {
            __click: undefined,
            __left: undefined,
            __right: undefined,
            __up: undefined,
            __down: undefined
        };
        
        _struct.__click = __verb_click;
        _struct.__left = __verb_left;
        _struct.__right = __verb_right;
        _struct.__up = __verb_up;
        _struct.__down = __verb_down;
        return _struct;
    };
    
    static threshold = function(arg0, arg1)
    {
        if (__destroyed)
            return self;
        
        __threshold_min = arg0;
        __threshold_max = arg1;
        return self;
    };
    
    static get_threshold = function()
    {
        static _struct = 
        {
            __mini: undefined,
            __maxi: undefined
        };
        
        _struct.__mini = __threshold_min;
        _struct.__maxi = __threshold_max;
        return _struct;
    };
    
    static active = function(arg0)
    {
        if (__destroyed)
            return self;
        
        if (!arg0 && __active)
            __clear_state();
        
        __active = arg0;
        return self;
    };
    
    static get_active = function()
    {
        return __active;
    };
    
    static priority = function(arg0)
    {
        if (__destroyed)
            return self;
        
        if (__priority != arg0)
        {
            __priority = arg0;
            __global.__virtual_order_dirty = true;
        }
        
        return self;
    };
    
    static get_priority = function()
    {
        return __priority;
    };
    
    static follow = function(arg0)
    {
        if (__destroyed)
            return self;
        
        __follow = arg0;
        return self;
    };
    
    static get_follow = function()
    {
        return __follow;
    };
    
    static release_behavior = function(arg0)
    {
        __release_behavior = arg0;
        return self;
    };
    
    static get_release_behavior = function()
    {
        return __release_behavior;
    };
    
    static first_touch_only = function(arg0)
    {
        if (arg0 && __touch_device > 0)
            __clear_state();
        
        __first_touch_only = arg0;
        return self;
    };
    
    static get_first_touch_only = function()
    {
        return __first_touch_only;
    };
    
    static reference_point = function(arg0)
    {
        __reference = arg0;
        return self;
    };
    
    static get_reference_point = function()
    {
        return __reference;
    };
    
    static momentary = function(arg0)
    {
        __momentary = arg0;
        return self;
    };
    
    static get_momentary = function()
    {
        return __momentary;
    };
    
    static pressed = function()
    {
        if (__destroyed)
            return false;
        
        return __pressed;
    };
    
    static check = function()
    {
        if (__destroyed)
            return false;
        
        return __held;
    };
    
    static released = function()
    {
        if (__destroyed)
            return false;
        
        return __released;
    };
    
    static get_x = function()
    {
        if (__destroyed)
            return 0;
        
        return __normalized_x;
    };
    
    static get_y = function()
    {
        if (__destroyed)
            return 0;
        
        return __normalized_y;
    };
    
    static get_touch_x = function()
    {
        if (__destroyed)
            return 0;
        
        return __touch_x;
    };
    
    static get_touch_y = function()
    {
        if (__destroyed)
            return 0;
        
        return __touch_y;
    };
    
    static get_touch_dx = function()
    {
        if (__destroyed)
            return 0;
        
        if (__prev_x == undefined)
            return 0;
        
        return __touch_x - __prev_x;
    };
    
    static get_touch_dy = function()
    {
        if (__destroyed)
            return 0;
        
        if (__prev_y == undefined)
            return 0;
        
        return __touch_y - __prev_y;
    };
    
    static get_touch_start_x = function()
    {
        if (__destroyed)
            return 0;
        
        return __touch_start_x;
    };
    
    static get_touch_start_y = function()
    {
        if (__destroyed)
            return 0;
        
        return __touch_start_y;
    };
    
    static record_history = function(arg0)
    {
        if (__destroyed)
            return undefined;
        
        __record_history = arg0;
        
        if (__record_history != is_array(__history_array))
        {
            if (__record_history)
            {
                __history_array = array_create(11, undefined);
                __history_count = 0;
                var _i = 0;
                
                repeat (11)
                {
                    __history_array[_i] = 
                    {
                        x: undefined,
                        y: undefined
                    };
                    _i++;
                }
            }
            else
            {
                __history_array = undefined;
                __history_count = 0;
            }
        }
        
        return self;
    };
    
    static get_history = function()
    {
        if (__destroyed)
            return undefined;
        
        return __history_array;
    };
    
    static get_history_direction = function(arg0 = 10)
    {
        if (__destroyed)
            return undefined;
        
        if (arg0 <= 0)
        {
            __input_error("Number of sampling frames must be 1 or greater");
            return undefined;
        }
        
        if (arg0 > 10)
        {
            __input_error("Number of sampling frames (", arg0, ") cannot exceed INPUT_TOUCH_HISTORY_FRAMES (", 10, ")");
            return undefined;
        }
        
        arg0 = min(__history_count - 1, arg0, 10);
        
        if (arg0 <= 0)
            return 0;
        
        var _point0 = __history_array[0];
        var _pointN = __history_array[arg0];
        return point_direction(_pointN.x, _pointN.y, _point0.x, _point0.y);
    };
    
    static get_history_distance = function(arg0 = 10)
    {
        if (__destroyed)
            return undefined;
        
        if (arg0 <= 0)
        {
            __input_error("Number of sampling frames must be 1 or greater");
            return undefined;
        }
        
        if (arg0 > 10)
        {
            __input_error("Number of sampling frames (", arg0, ") cannot exceed INPUT_TOUCH_HISTORY_FRAMES (", 10, ")");
            return undefined;
        }
        
        arg0 = min(__history_count - 1, arg0, 10);
        
        if (arg0 <= 0)
            return 0;
        
        var _distance = 0;
        var _x1 = undefined;
        var _y1 = undefined;
        var _point = __history_array[0];
        var _x2 = _point.x;
        var _y2 = _point.y;
        var _i = 1;
        
        repeat (arg0)
        {
            _x1 = _x2;
            _y1 = _y2;
            _point = __history_array[_i];
            _x2 = _point.x;
            _y2 = _point.y;
            var _dX = _x2 - _x1;
            var _dY = _y2 - _y1;
            _distance += sqrt((_dX * _dX) + (_dY * _dY));
            _i++;
        }
        
        return _distance;
    };
    
    static get_history_speed = function(arg0 = 10)
    {
        if (__destroyed)
            return undefined;
        
        arg0 = min(__history_count - 1, arg0, 10);
        
        if (arg0 <= 0)
            return 0;
        
        return get_history_distance(arg0) / arg0;
    };
    
    static __set_as_background = function()
    {
        rectangle(0, 0, max(display_get_width(), display_get_height()), max(display_get_width(), display_get_height()));
        __priority = -infinity;
        __background = true;
        return self;
    };
    
    static __clear_state = function()
    {
        __touch_device = undefined;
        __pressed = false;
        __held = false;
        __released = false;
        __held_buffer = false;
        __normalized_x = 0;
        __normalized_y = 0;
        __touch_x = undefined;
        __touch_y = undefined;
        __touch_start_x = undefined;
        __touch_start_y = undefined;
        
        if (__record_history)
        {
            __history_count = 0;
            var _i = 0;
            
            repeat (11)
            {
                with (__history_array[_i])
                {
                    x = undefined;
                    y = undefined;
                }
                
                _i++;
            }
        }
        
        if (__release_behavior == (2 << 0))
        {
            if (__start_x != undefined && __start_y != undefined)
            {
                var _dx = __start_x - __x;
                var _dy = __start_y - __y;
                __left += _dx;
                __top += _dy;
                __right += _dx;
                __bottom += _dy;
                __x = __start_x;
                __y = __start_y;
            }
        }
        else if (__release_behavior == (1 << 0))
        {
            destroy();
        }
    };
    
    static __capture_touchpoint = function(arg0)
    {
        if (__touch_device != undefined)
            return false;
        
        if (__circular == undefined)
            return false;
        
        if (!__active)
            return false;
        
        if (__first_touch_only && arg0 > 0)
            return false;
        
        var _touch_x = device_mouse_x_to_gui(arg0);
        var _touch_y = device_mouse_y_to_gui(arg0);
        var _over;
        
        if (__circular)
            _over = point_in_circle(_touch_x, _touch_y, __x, __y, __radius);
        else
            _over = point_in_rectangle(_touch_x, _touch_y, __left, __top, __right, __bottom);
        
        if (_over)
        {
            __touch_start_x = _touch_x;
            __touch_start_y = _touch_y;
            __touch_x = __touch_start_x;
            __touch_y = __touch_start_y;
            
            if (__record_history)
                __history_push(_touch_x, _touch_y);
            
            __touch_device = arg0;
            __capture_frame = __global.__frame;
        }
        
        return _over;
    };
    
    static __tick = function()
    {
        if (__destroyed)
            return undefined;
        
        if (__touch_device == undefined)
            return undefined;
        
        if (__released)
        {
            __clear_state();
            
            if (__destroyed)
                return undefined;
        }
        
        if (__capture_frame == __global.__frame)
        {
            __pressed = true;
            __held = true;
            __released = false;
            __prev_x = device_mouse_x_to_gui(__touch_device);
            __prev_y = device_mouse_y_to_gui(__touch_device);
        }
        else
        {
            __pressed = false;
            __released = false;
        }
        
        if (!__held)
        {
            __prev_x = undefined;
            __prev_y = undefined;
        }
        else
        {
            var _sustain = __momentary ? (__capture_frame == __global.__frame) : device_mouse_check_button(__touch_device, mb_left);
            
            if (!_sustain)
            {
                __pressed = false;
                __held = false;
                __released = true;
            }
            else
            {
                var _player = __global.__touch_player;
                _player.__verb_set_from_virtual(__verb_click, 1, 1, false);
                __prev_x = __touch_x;
                __prev_y = __touch_y;
                
                if (!__held_buffer)
                {
                    __touch_x = device_mouse_x_to_gui(__touch_device);
                    __touch_y = device_mouse_y_to_gui(__touch_device);
                }
                
                if (__record_history)
                    __history_push(__touch_x, __touch_y);
                
                var _reference = (__type == (6 << 0)) ? (2 << 0) : __reference;
                var _dx, _dy;
                
                switch (_reference)
                {
                    case (0 << 0):
                        _dx = __touch_x - __x;
                        _dy = __touch_y - __y;
                        break;
                    
                    case (1 << 0):
                        _dx = __touch_x - __touch_start_x;
                        _dy = __touch_y - __touch_start_y;
                        break;
                    
                    case (2 << 0):
                        _dx = __touch_x - __prev_x;
                        _dy = __touch_y - __prev_y;
                        break;
                    
                    default:
                        __input_error("Reference point type (", __reference, ") not supported");
                        break;
                }
                
                var _length = (_dx * _dx) + (_dy * _dy);
                var _threshold_factor;
                
                if (_length <= 0)
                {
                    _threshold_factor = 0;
                    __normalized_x = 0;
                    __normalized_y = 0;
                }
                else
                {
                    _length = sqrt(_length);
                    _threshold_factor = clamp((_length - __threshold_min) / (__threshold_max - __threshold_min), 0, 1) / _length;
                    __normalized_x = _threshold_factor * _dx;
                    __normalized_y = _threshold_factor * _dy;
                    
                    if (__follow)
                    {
                        var _move_x = 0;
                        var _move_y = 0;
                        
                        if (__circular == true)
                        {
                            var _move_distance = max(0, _length - __radius);
                            _move_x = (_move_distance * _dx) / _length;
                            _move_y = (_move_distance * _dy) / _length;
                        }
                        else if (__circular == false)
                        {
                            var _dLeft = min(0, __touch_x - __left);
                            var _dTop = min(0, __touch_y - __top);
                            var _dRight = max(0, __touch_x - __right);
                            var _dBottom = max(0, __touch_y - __bottom);
                            _move_x += (_dLeft + _dRight);
                            _move_y += (_dTop + _dBottom);
                        }
                        
                        __x += _move_x;
                        __y += _move_y;
                        __left += _move_x;
                        __top += _move_y;
                        __right += _move_x;
                        __bottom += _move_y;
                    }
                }
                
                if (_threshold_factor > 0)
                {
                    switch (__type)
                    {
                        case (4 << 0):
                            if ((floor(point_direction(0, 0, __normalized_x, __normalized_y) / 180) % 2) == 1)
                                _player.__verb_set_from_virtual(__verb_down, 1, 1, false);
                            else
                                _player.__verb_set_from_virtual(__verb_up, 1, 1, false);
                            
                            break;
                        
                        case (3 << 0):
                            if ((floor((point_direction(0, 0, __normalized_x, __normalized_y) + 270) / 180) % 2) == 1)
                                _player.__verb_set_from_virtual(__verb_right, 1, 1, false);
                            else
                                _player.__verb_set_from_virtual(__verb_left, 1, 1, false);
                            
                            break;
                        
                        case (1 << 0):
                            var _direction = floor((point_direction(0, 0, __normalized_x, __normalized_y) + 45) / 90) % 4;
                            
                            switch (_direction)
                            {
                                case 0:
                                    _player.__verb_set_from_virtual(__verb_right, 1, 1, false);
                                    break;
                                
                                case 1:
                                    _player.__verb_set_from_virtual(__verb_up, 1, 1, false);
                                    break;
                                
                                case 2:
                                    _player.__verb_set_from_virtual(__verb_left, 1, 1, false);
                                    break;
                                
                                case 3:
                                    _player.__verb_set_from_virtual(__verb_down, 1, 1, false);
                                    break;
                            }
                            
                            break;
                        
                        case (2 << 0):
                            var _direction = floor((point_direction(0, 0, __normalized_x, __normalized_y) + 22.5) / 45) % 8;
                            
                            switch (_direction)
                            {
                                case 0:
                                case 1:
                                case 7:
                                    _player.__verb_set_from_virtual(__verb_right, 1, 1, false);
                                    break;
                                
                                case 3:
                                case 4:
                                case 5:
                                    _player.__verb_set_from_virtual(__verb_left, 1, 1, false);
                                    break;
                            }
                            
                            switch (_direction)
                            {
                                case 1:
                                case 2:
                                case 3:
                                    _player.__verb_set_from_virtual(__verb_up, 1, 1, false);
                                    break;
                                
                                case 5:
                                case 6:
                                case 7:
                                    _player.__verb_set_from_virtual(__verb_down, 1, 1, false);
                                    break;
                            }
                            
                            break;
                        
                        case (5 << 0):
                            var _clamped_x = sign(_dx) * clamp((abs(_dx) - __threshold_min) / (__threshold_max - __threshold_min), 0, 1);
                            var _clamped_y = sign(_dy) * clamp((abs(_dy) - __threshold_min) / (__threshold_max - __threshold_min), 0, 1);
                            _player.__verb_set_from_virtual(__verb_left, max(0, -_dx), max(0, -_clamped_x), true);
                            _player.__verb_set_from_virtual(__verb_up, max(0, -_dy), max(0, -_clamped_y), true);
                            _player.__verb_set_from_virtual(__verb_right, max(0, _dx), max(0, _clamped_x), true);
                            _player.__verb_set_from_virtual(__verb_down, max(0, _dy), max(0, _clamped_y), true);
                            break;
                        
                        case (6 << 0):
                            _player.__verb_set_from_virtual(__verb_left, max(0, -__normalized_x), max(0, -__normalized_x), true);
                            _player.__verb_set_from_virtual(__verb_up, max(0, -__normalized_y), max(0, -__normalized_y), true);
                            _player.__verb_set_from_virtual(__verb_right, max(0, __normalized_x), max(0, __normalized_x), true);
                            _player.__verb_set_from_virtual(__verb_down, max(0, __normalized_y), max(0, __normalized_y), true);
                            break;
                    }
                }
            }
        }
    };
    
    static __history_push = function(arg0, arg1)
    {
        var _last_coord = __history_array[10];
        _last_coord.x = arg0;
        _last_coord.y = arg1;
        array_delete(__history_array, 10, 1);
        array_insert(__history_array, 0, _last_coord);
        __history_count++;
    };
    
    array_push(__global.__virtual_array, self);
    __global.__virtual_order_dirty = true;
    __destroyed = false;
    __background = false;
    __circular = undefined;
    __left = undefined;
    __top = undefined;
    __right = undefined;
    __bottom = undefined;
    __width = undefined;
    __height = undefined;
    __x = undefined;
    __y = undefined;
    __radius = undefined;
    __start_x = undefined;
    __start_y = undefined;
    __prev_x = undefined;
    __prev_y = undefined;
    __type = (0 << 0);
    __reference = (0 << 0);
    __verb_click = undefined;
    __verb_left = undefined;
    __verb_right = undefined;
    __verb_up = undefined;
    __verb_down = undefined;
    __max_distance = 1;
    __threshold_min = 50;
    __threshold_max = 100;
    __release_behavior = (0 << 0);
    __active = true;
    __priority = 0;
    __follow = false;
    __record_history = false;
    __first_touch_only = false;
    __momentary = false;
    __touch_device = undefined;
    __pressed = false;
    __held = false;
    __released = false;
    __held_buffer = false;
    __normalized_x = 0;
    __normalized_y = 0;
    __touch_x = undefined;
    __touch_y = undefined;
    __touch_start_x = undefined;
    __touch_start_y = undefined;
    __history_array = undefined;
    __history_count = 0;
    __capture_frame = undefined;
}
