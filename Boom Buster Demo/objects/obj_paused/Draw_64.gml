if (global.texfilter)
    gpu_set_texfilter(true);

if (sprite_exists(spr))
{
    gpu_set_blendenable(false);
    draw_sprite_gui(spr, 0, 0, 0);
    gpu_set_blendenable(true);
}

var _w = sprite_get_width(spr_static);
var _h = sprite_get_height(spr_static);
draw_set_spotlight(448, 540, spotlight_radius);
draw_set_alpha(0.4);
draw_rectangle_color(-256, 0, 1664, 1080, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
draw_set_alpha(0.2);

for (var i = 0; i < 5; i++)
{
    for (var j = 0; j < 3; j++)
        draw_sprite(spr_static, static_ind, -256 + (_w * i), _h * j);
}

draw_set_alpha(1);

if (!instance_exists(obj_options))
{
    var _str_act;
    
    if (global.stage == 7)
        _str_act = "GIVE UP, BOMB BOY!";
    else
        _str_act = string("PAUSED: ACT {0}/{1}", global.act, global.acts);
    
    draw_set_font(fnt_splatter_55);
    draw_set_halign(fa_center);
    draw_set_color(c_black);
    draw_text_shake(454, 86, _str_act);
    draw_text_shake(454, 186, string("{0} {1} {2}", "\"", global.act_name, "\""));
    draw_set_color(c_white);
    draw_text_shake(448, 80, _str_act);
    draw_text_shake(448, 180, string("{0} {1} {2}", "\"", global.act_name, "\""));
    var _x = 448;
    var _y = 380;
    
    for (var i = 0; i < array_length(menu.options); i++)
    {
        draw_set_color(c_black);
        draw_text_shake(_x + 5, _y + (100 * i) + 5, menu.options[i], 0.3);
        
        if (selected_option == i)
        {
            if (menu.options[selected_option] == "KICKSTARTER")
                draw_set_color(#05CE78);
            else
                draw_set_color(#FFD400);
        }
        else
        {
            draw_set_color(c_white);
        }
        
        draw_text_shake(_x, _y + (100 * i), menu.options[i], 0.3);
        draw_set_color(c_white);
    }
    
    hand_ind += (sprite_get_speed(spr_menu_hand) / 60);
    
    if (hand_ind >= sprite_get_number(spr_menu_hand))
        hand_ind -= hand_ind;
    
    hand_y = _y + 42 + (100 * selected_option);
    draw_sprite_ext(spr_menu_hand, hand_ind, _x - (string_width(menu.options[selected_option]) / 2) - 100, hand_y, 0.82, 0.82, 0, c_white, 1);
}

draw_set_halign(fa_left);
draw_remove_spotlight();

with (obj_controller)
{
    draw_bombcounter();
    draw_hp();
    draw_dollars();
    draw_foodbar();
    draw_combometer();
    draw_bossui();
}

draw_set_bounds(-256, 0, 1152, 1080);

for (var i = 0; i < 4; i++)
    draw_sprite_ext(spr_pause_over, i, 448, 540, over_scale, over_scale, 0, c_white, 1);

draw_remove_bounds();

if (global.texfilter)
    gpu_set_texfilter(false);
