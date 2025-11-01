if (global.texfilter)
    gpu_set_texfilter(true);

draw_set_font(fnt_splatter_45);
var _x;

if (instance_exists(obj_paused))
    _x = 244;
else
    _x = 600;

var _y = 110;
var _sep = 75;

for (var i = 0; i < array_length(menu.options); i++)
{
    var _str;
    
    if (i < (array_length(menu.options) - 2))
    {
        if (deac && selected_option == i)
            _str = ": ...";
        else
            _str = string(": {0}", get_key(input.key[i], false));
    }
    else
    {
        _str = "";
    }
    
    draw_set_color(c_black);
    draw_set_alpha(exists_alpha);
    
    if (exists_pop == i)
        draw_text_shake(_x + 480 + 5, _y + (_sep * i) + 5, "KEY IN USE!", 0.3);
    
    draw_set_alpha(16777215);
    draw_text_shake(_x + 5, _y + (_sep * i) + 5, menu.options[i] + _str, 0.3);
    
    if (selected_option == i)
        draw_set_color(#FFD400);
    else
        draw_set_color(c_white);
    
    draw_text_shake(_x, _y + (_sep * i), menu.options[i] + _str, 0.3);
    draw_set_alpha(exists_alpha);
    draw_set_color(c_red);
    
    if (exists_pop == i)
        draw_text_shake(_x + 480, _y + (_sep * i), "KEY IN USE!", 0.3);
    
    draw_set_color(c_white);
    draw_set_alpha(1);
}

hand_ind = obj_options.hand_ind;
hand_y = _y + 42 + (_sep * selected_option);
draw_sprite_ext(spr_menu_hand, hand_ind, _x - 100, hand_y, 0.82, 0.82, 0, c_white, 1);

if (global.texfilter)
    gpu_set_texfilter(false);
