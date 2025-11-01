if (!global.debug)
    exit;

mx = window_mouse_get_x();
my = window_mouse_get_y();

if (keyboard_check_pressed(vk_f1))
    edit_mode = !edit_mode;

if (!edit_mode)
    exit;

if (keyboard_check_pressed(ord("V")))
    view_all = !view_all;

var _element;

if (element_selected != -4)
    _element = ds_list_find_value(global.list_elements, element_selected);

if (keyboard_check_pressed(ord("I")) && element_selected != -4)
{
    if (_element.row == 0)
    {
        _element.spd++;
        
        if (_element.spd > 2)
            _element.spd = 0;
    }
}

if (keyboard_check_pressed(ord("G")))
{
    grid_x = get_integer(string("grid_x:{0}", grid_x), "");
    grid_y = get_integer(string("grid_y:{0}", grid_y), "");
}

if (keyboard_check_pressed(ord("P")) && element_selected != -4)
{
    var _str = get_string("Enter Path Asset Name", "");
    
    if (path_exists(asset_get_index(_str)))
    {
        _element.mypath = _str;
        _element.path_pos = 0;
        show_message("Path Set!");
        _element.x = path_get_x(asset_get_index(_str), 0);
        _element.y = path_get_y(asset_get_index(_str), 0);
    }
    else if (struct_exists(_element, "mypath"))
    {
        struct_remove(_element, "mypath");
    }
}

if (keyboard_check_pressed(ord("F")) && element_selected != -4)
{
    if (!struct_exists(_element, "wings"))
        _element.wings = false;
    
    _element.wings = !_element.wings;
}

if (keyboard_check_pressed(ord("L")) && element_selected != -4)
{
    var _str = get_integer("Enter Landing ID", "");
    
    if (_str != -4)
        _element.land_id = _str;
    else if (struct_exists(_element, "land_id"))
        struct_remove(_element, "land_id");
}

if (keyboard_check_pressed(vk_space) && element_selected != -4)
{
    if (_element.row == 4)
    {
        if (_element.ind == 0)
        {
            if (keyboard_check(vk_shift))
            {
                var _str = get_integer("Enter Channel Wait", "");
                
                if (_str != -4)
                    _element.wait = _str;
                else
                    _element.wait = -4;
            }
            else
            {
                var _str = get_integer("Enter Channel ID", "");
                
                if (_str != -4)
                    _element.channel = _str;
                else
                    _element.channel = -4;
            }
        }
        else if (_element.ind == 2)
        {
            var _str = get_string("Enter Wizard Sprite", "");
            
            if (_str != -4)
                _element.spr_change = _str;
            else
                _element.spr_change = -4;
        }
    }
    
    if (_element.row == 5)
    {
        if (_element.ind == 1)
        {
            var _str = get_integer("Enter Lights-Out Length\n(In Seconds Not Frames)", "");
            
            if (_str != -4)
                _element.length = _str;
            else
                _element.length = 2;
        }
        else if (_element.ind == 2)
        {
            var _str = get_integer("Enter Fireball HSPD", "");
            
            if (_str != -4)
                _element.hspd = _str;
            else
                _element.hspd = 2;
        }
    }
    
    if (_element.row == 6)
    {
        if (_element.ind == 0)
        {
            var _str = get_string("Enter Sound Name", "");
            
            if (_str != -4)
                _element.snd = _str;
            else
                _element.snd = "undefined";
        }
    }
}

var _yAxis = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

if (_yAxis != 0 && element_selected != -4)
{
    if (keyboard_check(vk_shift))
        _element.timestamp += _yAxis * 30;
    else
        _element.timestamp += _yAxis * 60;
}

var _xAxis = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);

if (_xAxis != 0 && element_selected != -4)
{
    if (keyboard_check(vk_shift))
        _element.cx += _xAxis * 40;
    else
        _element.cx += _xAxis * 20;
}

if (keyboard_check_pressed(ord("T")) && element_selected != -4)
{
    var _int = get_integer("", "Enter Second (NOT Game Frame)") * 60;
    
    if (is_numeric(_int))
        _element.timestamp = _int;
}

if (keyboard_check_pressed(vk_enter))
{
    var _data = ds_map_create();
    var _list = ds_list_create();
    ds_list_copy(_list, global.list_elements);
    ds_map_add_list(_data, "elements", _list);
    var _str = json_encode(_data);
    show_debug_message(_str);
    clipboard_set_text(_str);
    ds_map_destroy(_data);
    ds_list_destroy(_list);
}

var x1 = 1011;
var y1 = 1006;
var x2 = x1 + 397;
var y2 = y1 + 74;

if (element_selected != -4 && struct_exists(_element, "mypath") && point_in_rectangle(mx, my, x1, y1, x2, y2))
{
    if (mouse_wheel_down())
        _element.path_pos -= 0.01 + (0.03 * keyboard_check(vk_shift));
    
    if (mouse_wheel_up())
        _element.path_pos += 0.01 + (0.03 * keyboard_check(vk_shift));
    
    if (_element.path_pos < 0)
        _element.path_pos = 1;
    
    if (_element.path_pos > 1)
        _element.path_pos = 0;
}
else
{
    if (mouse_wheel_down())
        scroll_y -= (30 + (30 * (keyboard_check(vk_shift) * 8)));
    
    if (mouse_wheel_up())
        scroll_y += (30 + (30 * (keyboard_check(vk_shift) * 8)));
}
