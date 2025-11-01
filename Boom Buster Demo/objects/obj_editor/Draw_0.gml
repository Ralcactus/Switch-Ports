if (!edit_mode)
    exit;

mx = window_mouse_get_x();
my = window_mouse_get_y();

if (mx < 1408)
{
    mx_grid = round((mouse_x - -256) / grid_x) * grid_x;
    my_grid = round(mouse_y / grid_y) * grid_y;
    
    if (element_selected != -4)
    {
        var _inst = ds_list_find_value(global.list_elements, element_selected);
        var _str = asset_obj[_inst.row][_inst.ind];
        
        if (keyboard_check_pressed(ord("X")) && _inst.row == 3)
        {
            _inst.facing = !_inst.facing;
            
            if (_inst.facing == 0)
                _inst.facing = -1;
        }
        
        if (!struct_exists(_inst, "mypath"))
        {
            if (_inst.row == 1)
                draw_sprite_ext(spr_barrel, 0, mx_grid, my_grid, 1, 1, 0, c_white, 0.0525);
            
            draw_sprite_ext(name_to_spr(_str, _inst.ind), 0, mx_grid, my_grid, 1, 1, 0, c_white, 0.35);
            
            if (mouse_check_button_pressed(mb_left))
            {
                _inst.x = mx_grid;
                _inst.y = my_grid;
            }
        }
    }
}

for (var i = 0; i < ds_list_size(global.list_elements); i++)
{
    if (!view_all && element_selected != i)
        continue;
    
    var _inst = ds_list_find_value(global.list_elements, i);
    var _str = asset_obj[_inst.row][_inst.ind];
    var _alpha;
    
    if (element_selected == i)
        _alpha = 1;
    else
        _alpha = 0.5;
    
    var _facing;
    
    if (_inst.row == 3)
        _facing = _inst.facing;
    else
        _facing = 1;
    
    if (struct_exists(_inst, "mypath"))
    {
        var _path = asset_get_index(_inst.mypath);
        _inst.x = path_get_x(_path, _inst.path_pos);
        _inst.y = path_get_y(_path, _inst.path_pos);
        draw_path(_path, 0, 0, true);
    }
    
    if (_inst.row == 1)
        draw_sprite_ext(spr_barrel, 0, _inst.x, _inst.y, _facing, 1, 0, c_white, _alpha * 0.3);
    
    draw_sprite_ext(name_to_spr(_str, _inst.ind), 0, _inst.x, _inst.y, _facing, 1, 0, c_white, _alpha);
    
    if (struct_exists(_inst, "wings") && _inst.wings)
        draw_sprite(spr_wing, 0, _inst.x - 48, _inst.y - 50);
}

if (mouse_check_button_pressed(mb_middle) || keyboard_check_pressed(vk_control))
{
    element_selected = -4;
    selected_row = -4;
    selected_index = -4;
}
