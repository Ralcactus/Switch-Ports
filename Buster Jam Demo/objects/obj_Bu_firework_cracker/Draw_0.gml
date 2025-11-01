draw_sprite_ext(anim_sprite, anim_index, x, y, 1, 1, 0, c_white, image_alpha);

if (editor)
{
    controller.timer[1] = 300;
    var _snap = 2;
    var mx = round(mouse_x / _snap) * _snap;
    var my = round(mouse_y / _snap) * _snap;
    time_test += (sprite_get_speed(spr_Bu_firework_sparkle) / 60);
    
    for (var i = 0; i < array_length(array_sparkles); i++)
    {
        var _inst = array_sparkles[i];
        
        if (_inst.col == 0)
            draw_set_color(c_orange);
        else if (_inst.col == 1)
            draw_set_color(#FF7BFF);
        else if (_inst.col == 2)
            draw_set_color(#1ADED2);
        
        draw_circle(_inst.x, _inst.y, 9, false);
        draw_set_color(c_white);
        
        if (!pen && point_in_circle(_inst.x, _inst.y, mouse_x, mouse_y, 9))
        {
            if (mouse_check_button_pressed(mb_left))
                selected = i;
        }
        
        if (selected == i)
        {
            if (keyboard_check_pressed(vk_right))
                _inst.x += _snap;
            
            if (keyboard_check_pressed(vk_left))
                _inst.x -= _snap;
            
            if (keyboard_check_pressed(vk_up))
                _inst.y -= _snap;
            
            if (keyboard_check_pressed(vk_down))
                _inst.y += _snap;
            
            if (mouse_check_button_pressed(mb_right))
            {
                _inst.x = mx;
                _inst.y = my;
            }
            
            if (keyboard_check_pressed(vk_escape))
                selected = -4;
            
            if (keyboard_check_pressed(vk_delete))
            {
                array_delete(array_sparkles, i, 1);
                break;
            }
            
            draw_set_alpha(0.6);
            draw_circle(_inst.x, _inst.y, 9, false);
            draw_set_alpha(1);
        }
    }
    
    if (col == 0)
        draw_set_color(c_orange);
    else if (col == 1)
        draw_set_color(#FF7BFF);
    else if (col == 2)
        draw_set_color(#1ADED2);
    
    draw_set_alpha(0.4);
    
    if (keyboard_check_pressed(ord("P")))
        pen = !pen;
    
    if (pen)
    {
        draw_circle(mx, my, 9, false);
        
        if (mouse_check_button_pressed(mb_left))
        {
            var _struct = 
            {
                x: mouse_x,
                y: mouse_y,
                col: col
            };
            array_push(array_sparkles, _struct);
        }
        
        if (keyboard_check_pressed(vk_enter))
        {
            for (var i = 0; i < array_length(array_sparkles); i++)
            {
                var _str = string("array_push(array_sparkles,{0})", array_sparkles[i]);
                print(_str);
            }
        }
    }
    
    draw_set_alpha(1);
    draw_set_color(c_white);
    
    if (keyboard_check_pressed(ord("C")))
        col++;
    
    if (col > 2)
        col = 0;
}

for (var i = 0; i < array_length(array_sparkles); i++)
{
    var _inst = array_sparkles[i];
    var _angle = point_direction(_inst.x, _inst.y, obj_Bu_firework_circle.x, obj_Bu_firework_circle.y);
    var _xoff, _yoff;
    
    if (point_distance(_inst.x, _inst.y, obj_Bu_firework_circle.x, obj_Bu_firework_circle.y) > firework_offset)
    {
        _xoff = lengthdir_x(firework_offset, _angle);
        _yoff = lengthdir_y(firework_offset, _angle);
    }
    else
    {
        _xoff = 0;
        _yoff = 0;
    }
    
    if (_inst.col == 0)
        draw_set_color(c_orange);
    else if (_inst.col == 1)
        draw_set_color(#FF7BFF);
    else if (_inst.col == 2)
        draw_set_color(#1ADED2);
    
    draw_set_alpha(firework_alpha);
    draw_circle(_inst.x + _xoff, _inst.y + _yoff + firework_y, firework_scale, false);
    draw_set_alpha(1);
    draw_sprite_ext(spr_Bu_firework_glow, 0, _inst.x + _xoff, _inst.y + _yoff + firework_y, firework_scale / 9, firework_scale / 9, 0, draw_get_color(), firework_flash);
    draw_set_color(c_white);
}
