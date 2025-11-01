testvariablenothing = false;
gpu_set_blendenable(false);
draw_sprite(screenshot, 0, 0, 0);
gpu_set_blendenable(true);
draw_set_alpha(0.4);
draw_rectangle_color(0, 0, 1920, 1080, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

if (instance_exists(obj_options))
{
    not_in_demo_alpha = 0;
    
    with (obj_options)
        event_user(1);
    
    exit;
}

event_user(1);

if (menu != 0)
{
    not_in_demo_alpha = 0;
    exit;
}

draw_set_font(global.font_dialogue);
var _y = 24;
var _str = struct_get(global.map_names, room_get_name(room));

if (_str != undefined)
    draw_text(45, _y, _str);

draw_sprite_ext(spr_map_ui_coin, 0, 0, 0, 1, 1, 0, c_white, 1);
draw_set_font(global.font_score);
draw_set_halign(fa_right);
_str = string_add_zeros(global.coins, 3);
draw_text(1765, 966, _str);
draw_set_halign(fa_left);
draw_set_font(global.font_dialogue);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_alpha(not_in_demo_alpha);
draw_text(960, 1050, "(Content not in demo.)");
draw_set_alpha(1);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
not_in_demo_alpha = approach(not_in_demo_alpha, 0, 0.03);
