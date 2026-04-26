draw_sprite_tiled(bg_options, 0, bgx--, bgy--);

with (obj_Options_Input)
{
    event_perform(ev_draw, ev_gui);
    exit;
}

draw_set_font(global.font);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
var _my_menu = menus[selectedmenu];
var _str_height = string_height("A");
var _my_options = _my_menu.options;
var _total_options = array_length(_my_options);
var _total_heigh_adj = 0;

for (var a = 1; a < _total_options; a++)
{
    if (_my_menu.options[a].type == UnknownEnum.Value_3)
        _total_heigh_adj += (_str_height + _my_menu.textpad);
    else
        _total_heigh_adj += ((_str_height + _my_menu.textpad) * 2);
}

var canScroll = _total_heigh_adj > camera_get_view_height(view_camera[0]);
draw_set_halign(_my_menu.centered);
draw_set_valign(fa_middle);
var _newH = 0;

for (var i = 0; i < _total_options; i++)
{
    draw_set_font(global.font);
    var _i_opt = _my_options[i];
    var _i_color = 8421504;
    var yy = _newH - (_total_heigh_adj / 2);
    
    if (i == optionselected)
    {
        _i_color = 16777215;
        
        if (canScroll)
        {
            var scroll_y = clamp(yy, -((_total_heigh_adj / 2) - _my_menu.ypad), (_total_heigh_adj / 2) - _my_menu.ypad);
            
            if (_i_opt.type != UnknownEnum.Value_3)
                scroll_y += ((_str_height + _my_menu.textpad) / 2);
            
            textScroll = lerp(textScroll, scroll_y, 0.15);
            textScroll = clamp(textScroll, -((_total_heigh_adj / 2) - _my_menu.ypad), (_total_heigh_adj / 2) - _my_menu.ypad);
        }
        else
        {
            textScroll = 0;
        }
    }
    
    var _draw_y = round(yy - textScroll) + (camera_get_view_height(view_camera[0]) / 2);
    draw_text_color(_my_menu.xpad, _draw_y, string_upper(_i_opt.name), _i_color, _i_color, _i_color, _i_color, _i_opt.alpha);
    
    switch (_i_opt.type)
    {
        case UnknownEnum.Value_0:
            draw_text_color(_my_menu.xpad, _draw_y + (_str_height + _my_menu.textpad), _i_opt.value ? "ON" : "OFF", _i_color, _i_color, _i_color, _i_color, _i_opt.alpha);
            break;
        
        case UnknownEnum.Value_2:
            draw_text_color(_my_menu.xpad, _draw_y + (_str_height + _my_menu.textpad), _i_opt.choices[_i_opt.value], _i_color, _i_color, _i_color, _i_color, _i_opt.alpha);
            break;
        
        case UnknownEnum.Value_1:
            draw_text_color(_my_menu.xpad, _draw_y + (_str_height + _my_menu.textpad), _i_opt.value, _i_color, _i_color, _i_color, _i_color, _i_opt.alpha);
            break;
    }
    
    if (_i_opt.type == UnknownEnum.Value_3)
        _newH += (_str_height + _my_menu.textpad);
    else
        _newH += ((_str_height + _my_menu.textpad) * 2);
}

draw_set_font(global.smallfont);
draw_set_halign(fa_center);
draw_set_halign(fa_center);
var _desc_str = (descfadeout || !showdesc) ? old_desc : description;
var _desc_yy = round(camera_get_view_height(view_camera[0]) - (_my_menu.ypad / 4));
var _desc_width = string_width(_desc_str) + 16;
draw_sprite_ext(spr_optionSubtitle, 0, camera_get_view_width(view_camera[0]) / 2, _desc_yy, _desc_width / 32, 1, 0, c_white, descalp);
draw_text_color(camera_get_view_width(view_camera[0]) / 2, _desc_yy, string_upper(_desc_str), c_white, c_white, c_white, c_white, descalp);
