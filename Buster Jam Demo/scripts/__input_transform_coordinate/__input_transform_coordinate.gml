__input_transform_coordinate(0, 0, 2, 2, undefined);

function __input_transform_coordinate(arg0, arg1, arg2, arg3, arg4 = undefined)
{
    static _result = 
    {
        x: 0,
        y: 0
    };
    static _windowW = undefined;
    static _windowH = undefined;
    static _appSurfW = undefined;
    static _appSurfH = undefined;
    static _appSurfDrawL = undefined;
    static _appSurfDrawT = undefined;
    static _appSurfDrawW = undefined;
    static _appSurfDrawH = undefined;
    static _recacheTime = -infinity;
    
    if (arg2 != arg3)
    {
        var _viewA, _viewX, _viewW, _viewY, _viewH;
        
        if (arg2 == 0 || arg3 == 0)
        {
            if (arg4 == undefined && view_enabled && view_visible[0])
                arg4 = view_camera[0];
            
            if (arg4 != undefined)
            {
                _viewX = camera_get_view_x(arg4);
                _viewY = camera_get_view_y(arg4);
                _viewW = camera_get_view_width(arg4);
                _viewH = camera_get_view_height(arg4);
                _viewA = camera_get_view_angle(arg4);
            }
            else
            {
                _viewX = 0;
                _viewY = 0;
                _viewW = room_width;
                _viewH = room_height;
                _viewA = 0;
            }
        }
        
        if (arg2 == 2 || arg3 == 2)
        {
            if (_appSurfW != surface_get_width(application_surface) || _appSurfH != surface_get_height(application_surface))
            {
                _appSurfW = surface_get_width(application_surface);
                _appSurfH = surface_get_height(application_surface);
                _recacheTime = -infinity;
            }
            
            if (current_time > _recacheTime)
            {
                _recacheTime = infinity;
                var _array = application_get_position();
                _appSurfDrawL = _array[0];
                _appSurfDrawT = _array[1];
                _appSurfDrawW = _array[2] - _appSurfDrawL;
                _appSurfDrawH = _array[3] - _appSurfDrawT;
            }
            
            if (_windowW != window_get_width() || _windowH != window_get_height())
            {
                _windowW = window_get_width();
                _windowH = window_get_height();
                _recacheTime = current_time + 200;
            }
        }
        
        if (arg2 == 0)
        {
            if (_viewA == 0)
            {
                arg0 = (arg0 - _viewX) / _viewW;
                arg1 = (arg1 - _viewY) / _viewH;
            }
            else
            {
                _viewX += (_viewW / 2);
                _viewY += (_viewH / 2);
                var _sin = dsin(-_viewA);
                var _cos = dcos(-_viewA);
                var _x0 = arg0 - _viewX;
                var _y0 = arg1 - _viewY;
                arg0 = (((_x0 * _cos) - (_y0 * _sin)) + (_viewW / 2)) / _viewW;
                arg1 = ((_x0 * _sin) + (_y0 * _cos) + (_viewH / 2)) / _viewH;
            }
            
            if (arg3 == 1)
            {
                arg0 *= display_get_gui_width();
                arg1 *= display_get_gui_height();
            }
            else if (arg3 == 2)
            {
                arg0 = (_appSurfDrawW * arg0) + _appSurfDrawL;
                arg1 = (_appSurfDrawH * arg1) + _appSurfDrawT;
            }
            else
            {
                __input_error("Unhandled output coordinate system (", arg3, ")");
            }
        }
        else if (arg2 == 1)
        {
            arg0 /= display_get_gui_width();
            arg1 /= display_get_gui_height();
            
            if (arg3 == 0)
            {
                if (_viewA == 0)
                {
                    arg0 = (_viewW * arg0) + _viewX;
                    arg1 = (_viewH * arg1) + _viewY;
                }
                else
                {
                    _viewX += (_viewW / 2);
                    _viewY += (_viewH / 2);
                    var _sin = dsin(_viewA);
                    var _cos = dcos(_viewA);
                    var _x0 = (arg0 * _viewW) - (_viewW / 2);
                    var _y0 = (arg1 * _viewH) - (_viewH / 2);
                    arg0 = ((_x0 * _cos) - (_y0 * _sin)) + _viewX;
                    arg1 = (_x0 * _sin) + (_y0 * _cos) + _viewY;
                }
            }
            else if (arg3 == 2)
            {
                arg0 = (_appSurfDrawW * arg0) + _appSurfDrawL;
                arg1 = (_appSurfDrawH * arg1) + _appSurfDrawT;
            }
            else
            {
                __input_error("Unhandled output coordinate system (", arg3, ")");
            }
        }
        else if (arg2 == 2)
        {
            arg0 = (arg0 - _appSurfDrawL) / _appSurfDrawW;
            arg1 = (arg1 - _appSurfDrawT) / _appSurfDrawH;
            
            if (arg3 == 1)
            {
                arg0 *= display_get_gui_width();
                arg1 *= display_get_gui_height();
            }
            else if (arg3 == 0)
            {
                if (_viewA == 0)
                {
                    arg0 = (_viewW * arg0) + _viewX;
                    arg1 = (_viewH * arg1) + _viewY;
                }
                else
                {
                    _viewX += (_viewW / 2);
                    _viewY += (_viewH / 2);
                    var _sin = dsin(_viewA);
                    var _cos = dcos(_viewA);
                    var _x0 = (arg0 * _viewW) - (_viewW / 2);
                    var _y0 = (arg1 * _viewH) - (_viewH / 2);
                    arg0 = ((_x0 * _cos) - (_y0 * _sin)) + _viewX;
                    arg1 = (_x0 * _sin) + (_y0 * _cos) + _viewY;
                }
            }
            else
            {
                __input_error("Unhandled output coordinate system (", arg3, ")");
            }
        }
        else
        {
            __input_error("Unhandled input coordinate system (", arg2, ")");
        }
    }
    
    _result.x = arg0;
    _result.y = arg1;
    return _result;
}
