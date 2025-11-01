if (instance_exists(obj_keybinds))
    exit;

if (global.texfilter)
    gpu_set_texfilter(true);

draw_set_font(fnt_splatter_55);
draw_set_halign(fa_center);
var _x, _y;

if (instance_exists(obj_paused))
{
    _x = 448;
    _y = 300;
}
else
{
    _x = 960;
    _y = 300;
}

for (var i = 0; i < array_length(menu_selected.options); i++)
{
    draw_set_color(c_black);
    draw_text_shake(_x + 5, _y + (100 * i) + 5, menu_selected.options[i], 0.3);
    
    if (selected_option == i)
    {
        if (menu_selected.options[selected_option] == "KICKSTARTER")
            draw_set_color(#05CE78);
        else
            draw_set_color(#FFD400);
    }
    else
    {
        draw_set_color(c_white);
    }
    
    draw_text_shake(_x, _y + (100 * i), menu_selected.options[i], 0.3);
    draw_set_color(c_white);
}

if (menu_selected == menu_game)
{
    var _str = string("GAMEPAD: {0}", input.device_name);
    draw_set_color(c_black);
    draw_text_transformed(_x + 5, _y + 500 + 5, _str, 0.7, 0.7, 0);
    draw_set_color(c_white);
    draw_text_transformed(_x, _y + 500, _str, 0.7, 0.7, 0);
}

draw_set_halign(fa_left);
hand_y = _y + 42 + (100 * selected_option);
draw_sprite_ext(spr_menu_hand, hand_ind, _x - (string_width(menu_selected.options[selected_option]) / 2) - 100, hand_y, 0.82, 0.82, 0, c_white, 1);

if (global.texfilter)
    gpu_set_texfilter(false);
