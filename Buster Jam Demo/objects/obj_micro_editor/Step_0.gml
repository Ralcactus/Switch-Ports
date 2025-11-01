if (keyboard_check_pressed(vk_space))
{
    var _get, _type;
    
    if (!keyboard_check(vk_shift))
    {
        _get = get_string("Enter Object Name", "");
        _type = 0;
    }
    else
    {
        _get = get_string("Enter Sprite Name", "");
        _type = 1;
    }
    
    var _asset = asset_get_index(_get);
    
    if (_asset == -1)
    {
        show_message("Asset Not Found");
    }
    else if (_type == 0 && !object_exists(_asset))
    {
        show_message("Object Does Not Exist");
    }
    else if (_type == 1 && !sprite_exists(_asset))
    {
        show_message("Sprite Does Not Exist");
    }
    else
    {
        var _ID = ID_TOTAL;
        var _struct = 
        {
            ID: ID_TOTAL,
            asset: _get,
            type: _type,
            x: mouse_x - editor_stretch,
            y: mouse_y,
            ind: 0,
            xscale: 1,
            yscale: 1,
            angle: 0,
            col: 16777215,
            alpha: 1,
            layer: layer_selected
        };
        array_push(instances, _struct);
        ID_TOTAL++;
        array_sort(instances, sort_depth);
        
        for (var i = 0; i < array_length(instances); i++)
        {
            if (_ID == instances[i].ID)
            {
                selected = i;
                break;
            }
        }
    }
}

if (keyboard_check_pressed(ord("T")))
    splash_text = get_string("Enter Splash Text", splash_text);

if (keyboard_check_pressed(ord("P")))
    texture_group = get_string("Enter Texture Group", texture_group);

if (keyboard_check_pressed(vk_f1))
{
    var _map = 
    {
        game_width: game_width,
        game_height: game_height,
        ID_TOTAL: ID_TOTAL,
        instances: instances,
        splash_text: splash_text,
        texture_group: texture_group
    };
    var _str = json_stringify(_map);
    var _file = get_save_filename("|*.json", ".json");
    
    if (_file != "")
    {
        var _open = file_text_open_write(_file);
        file_text_write_string(_open, _str);
        file_text_close(_open);
        show_message("File Saved!");
    }
}

if (keyboard_check_pressed(vk_f2))
{
    var _file = get_open_filename("*.json", "");
    
    if (file_exists(_file))
    {
        var _data = json_load(_file);
        selected = -4;
        game_width = _data.game_width;
        game_height = _data.game_height;
        ID_TOTAL = _data.ID_TOTAL;
        splash_text = _data.splash_text;
        
        if (struct_exists(_data, "texture_group"))
            texture_group = _data.texture_group;
        else
            texture_group = -4;
        
        if (surface_exists(surf))
            surface_resize(surf, game_width, game_height);
        
        instances = _data.instances;
        array_sort(instances, sort_depth);
    }
}

if (keyboard_check_pressed(vk_f3))
{
    game_width = real(get_string("Game Width", game_width));
    game_height = real(get_string("Game Height", game_height));
    
    if (surface_exists(surf))
        surface_resize(surf, game_width, game_height);
}

var _xAxis = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
var _yAxis = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

if (_xAxis != 0 || _yAxis != 0)
{
    for (var i = 0; i < array_length(multi_select); i++)
    {
        var _move;
        
        if (keyboard_check(vk_shift))
            _move = 4;
        else
            _move = 1;
        
        instances[multi_select[i]].x += _xAxis * _move;
        instances[multi_select[i]].y += _yAxis * _move;
    }
}
