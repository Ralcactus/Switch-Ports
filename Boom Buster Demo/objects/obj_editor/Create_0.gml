grid_x = 32;
grid_y = 64;
grid_alpha = 0.25;
asset_obj = obj_controller.asset_obj;
edit_mode = false;
selected_row = -4;
selected_index = -4;
element_selected = -4;
view_all = false;
row_spr[0] = spr_editor_boms;
row_spr[1] = spr_editor_barrel;
row_spr[2] = spr_editor_items;
row_spr[3] = spr_editor_grodies;
row_spr[4] = spr_editor_tv;
row_spr[5] = spr_editor_wizard;
row_spr[6] = spr_editor_misc;
scroll_y = 0;

name_to_spr = function(arg0, arg1 = selected_index)
{
    var _asset = asset_get_index(arg0);
    
    if (_asset > -1)
    {
        if (arg0 == "obj_bom")
            return asset_get_index(string("spr_bom_{0}", col_to_str(arg1)));
        else
            return object_get_sprite(_asset);
    }
    
    return spr_undefined;
};

draw_columns = function(arg0, arg1)
{
    var _x = 10;
    var _y = 10 + (72 * arg1);
    var _scale = 1;
    
    for (var i = 0; i < sprite_get_number(arg0); i++)
    {
        var _spr = arg0;
        var _ind = i;
        draw_sprite_gui(spr_editor_column, 1, _x + (72 * i), _y);
        
        if (arg0 == spr_editor_items && i == 1)
        {
            _spr = spr_food_city;
            _ind = (((global.stage - 1) * 3) + global.act) - 1;
            _scale = 0.7;
        }
        
        draw_sprite_gui_ext(_spr, _ind, _x + (72 * i) + 36, _y + 34, _scale, _scale);
        draw_sprite_gui(spr_editor_column, 0, _x + (72 * i), _y);
        var _inside = point_in_rectangle(mx, my, _x + (72 * i), _y, _x + (72 * i) + 68, _y + 68);
        
        if (_inside)
            draw_sprite_gui_ext(spr_editor_column, 2, _x + (72 * i), _y, 1, 1, 0, 0, 0.3);
        
        if (selected_row == arg1 && selected_index == i)
            draw_sprite_gui_ext(spr_editor_column, 2, _x + (72 * i), _y, 1, 1, 0, 0, 0.3);
        
        if (_inside)
        {
            var _row = selected_row;
            var _index = selected_index;
            
            if (mouse_check_button_pressed(mb_left))
            {
                if (_row == arg1 && _index == i)
                {
                    selected_row = -4;
                    selected_index = -4;
                }
                else
                {
                    selected_row = arg1;
                    selected_index = i;
                }
            }
        }
    }
};
