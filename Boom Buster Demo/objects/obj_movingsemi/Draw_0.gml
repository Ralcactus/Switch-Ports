if (obj_editor.edit_mode && mypath != -4 && ready)
{
    if (keyboard_check_pressed(ord("Q")) && obj_editor.element_selected != -4)
    {
        var _element = ds_list_find_value(global.list_elements, obj_editor.element_selected);
        editor_pos = ((mypath_spd * _element.timestamp) + path_pos_start) % 1;
    }
    
    if (keyboard_check(vk_control))
        editor_pos = ((mypath_spd * (window_mouse_get_y() - obj_editor.scroll_y)) + path_pos_start) % 1;
    
    var _x = path_get_x(mypath, editor_pos);
    var _y = path_get_y(mypath, editor_pos);
    var _spr;
    
    if (!sprite_exists(mask_index))
        _spr = sprite_index;
    else
        _spr = mask_index;
    
    draw_sprite_ext(_spr, -1, _x, _y, image_xscale, image_yscale, 0, c_white, 1);
    
    if (land_id != -4)
        draw_text(_x, _y - 25, land_id);
}
else
{
    draw_self();
}
