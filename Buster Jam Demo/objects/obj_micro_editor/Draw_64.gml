if (surface_exists(surf))
{
    gpu_set_blendenable(false);
    draw_surface(surf, editor_stretch, 0);
    gpu_set_blendenable(true);
}

draw_set_font(fnt_editor);
draw_rectangle_color(0, 0, editor_stretch, 1080, c_black, c_black, c_black, c_black, false);
hover = -4;
var _ysep = 0;

for (var i = 0; i < array_length(instances); i++)
{
    if (i > 0 && instances[i - 1].layer != instances[i].layer)
        _ysep += 25;
    
    var _x = 5;
    var _y = 5 + (22 * i) + _ysep;
    var _x2 = _x + 80 + (string_width(instances[i].asset) * 2);
    var _y2 = _y + 21;
    
    if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), _x, _y, _x2, _y2))
    {
        hover = i;
        
        if (mouse_check_button_pressed(mb_left))
        {
            if (keyboard_check(vk_shift))
            {
                if (!array_contains(multi_select, i))
                    array_push(multi_select, i);
            }
            else
            {
                selected = i;
            }
        }
    }
    
    if (selected == i || hover == i)
    {
        if (selected == i)
            draw_set_alpha(0.4);
        else
            draw_set_alpha(0.15);
        
        draw_rectangle(_x, _y, _x2, _y2, false);
        draw_set_alpha(1);
        
        if (!keyboard_check(vk_shift))
        {
            if (keyboard_check_pressed(ord("X")))
                instances[i].x = real(get_string("X Position", instances[i].x));
            
            if (keyboard_check_pressed(ord("Y")))
                instances[i].y = real(get_string("Y Position", instances[i].y));
        }
        else
        {
            if (keyboard_check_pressed(ord("X")))
                instances[i].xscale = real(get_string("X Scale", instances[i].xscale));
            
            if (keyboard_check_pressed(ord("Y")))
                instances[i].yscale = real(get_string("Y Scale", instances[i].yscale));
        }
        
        if (keyboard_check_pressed(ord("I")))
            instances[i].ind = real(get_string("Sub-Image", instances[i].ind));
        
        if (keyboard_check_pressed(ord("L")))
        {
            instances[i].layer = get_string("Layer", instances[i].layer);
            array_sort(instances, sort_depth);
        }
        
        if (keyboard_check_pressed(vk_delete))
        {
            array_delete(instances, i, 1);
            selected = -4;
            break;
        }
    }
    
    if (array_contains(multi_select, i))
    {
        draw_set_alpha(0.15);
        draw_rectangle_color(_x, _y, _x2, _y2, c_yellow, c_yellow, c_yellow, c_yellow, false);
        draw_set_alpha(1);
    }
    
    if (asset_get_index(instances[i].asset) == -1)
        draw_set_color(c_red);
    
    var _str = instances[i].asset;
    draw_text_transformed(_x, _y, _str, 2, 2, 0);
    draw_set_color(c_white);
}

if (hover == -4 && mouse_check_button_pressed(mb_left))
{
    selected = -4;
    multi_select = [];
}

if (selected >= 0)
{
    var _str = string("({0},{1}) | ind:{2} | scale: ({3},{4}) | layer: {5} | ID: {6}", instances[selected].x, instances[selected].y, instances[selected].ind, instances[selected].xscale, instances[selected].yscale, instances[selected].layer, instances[selected].ID);
    draw_text_transformed(5 + editor_stretch, 5, _str, 2, 2, 0);
}
