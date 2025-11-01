draw_set_font(fnt_splatter_55);
get_stats();
var _x = 300;
var _y = 220;

for (var i = 0; i < array_length(menu.options); i++)
{
    draw_set_color(c_black);
    draw_text_shake(_x + 5, _y + (100 * i) + 5, menu.options[i], 0.3);
    
    if (selected_option == i)
        draw_set_color(#FFD400);
    else
        draw_set_color(c_white);
    
    draw_text_shake(_x, _y + (100 * i), menu.options[i], 0.3);
    draw_set_color(c_white);
}

hand_ind = obj_title.hand_ind;
hand_y = _y + 42 + (100 * selected_option);
draw_sprite_ext(spr_menu_hand, hand_ind, _x - 100, hand_y, 0.82, 0.82, 0, c_white, 1);

if (menu.options[selected_option] == "PALETTE")
{
    buster_jig_index += (sprite_get_speed(spr_buster_results) / 60);
    
    if (buster_jig_index >= sprite_get_number(spr_buster_results))
        buster_jig_index -= buster_jig_index;
    
    var _col = 3332863;
    draw_rectangle_color(1020, 300, 1671, 963, _col, _col, _col, _col, false);
    draw_set_color(c_white);
    pal_swap(pal_buster, 0, global.palette + 1);
    draw_sprite_ext(spr_buster_results, buster_jig_index, 1346, 859, 2, 2, 0, c_white, 1);
    shader_reset();
}

draw_set_bounds(1020, 300, 1671, 963);

if (menu.options[selected_option] != "PALETTE")
{
    if (selected_option == 6)
    {
        draw_sprite_ext(spr_tv_bg_wizard, 0, 1033, 345, 1.5, 1.5, 0, c_white, 1);
        draw_sprite_ext(spr_tv_wizard_freak, wizard_ind, 1053, 365, 1.5, 1.5, 0, c_white, 1);
    }
    else
    {
        draw_sprite_ext(spr_tv_select_screens, selected_option, 1033, 345, 1, 1, 0, c_white, 1);
    }
}

var _add = 0.05 * sin(obj_title.time * 0.013333333333333334 * pi);
draw_sprite_ext(spr_static, static_ind, 1020, 325, 1, 1, 0, c_white, static_alpha + _add);
draw_sprite_ext(spr_static, static_ind, 1020, 325 + sprite_get_height(spr_static), 1, 1, 0, c_white, static_alpha + _add);
draw_remove_bounds();
draw_sprite_ext(spr_tv_select, 0, 929, 43, 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_tv_select, 2, 929, 43, 1, 1, 0, c_white, 0.2);

if (menu.options[selected_option] == "PALETTE")
    exit;

draw_set_font(obj_persistent.font_alarm);
draw_set_color(c_red);
draw_text(1245, 118, string_add_zeros(highscore, 4, 2));
draw_set_color(c_white);

if (global.stage == 7 || global.world == 0)
    exit;

draw_sprite_ext(spr_tv_select, 1, 929, 43, 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_tv_select, 3, 929, 43, 1, 1, 0, c_white, 0.2);
_x = 1125;
_y = 218;

for (var i = 0; i < 3; i++)
{
    var _xx, _yy;
    
    if (i == 0)
    {
        _xx = 1217;
        _yy = 279;
    }
    else if (i == 1)
    {
        _xx = 1351;
        _yy = 291;
    }
    else if (i == 2)
    {
        _xx = 1486;
        _yy = 279;
    }
    
    if (food[i])
    {
        var _ind = ((global.stage - 1) * 3) + i;
        draw_sprite_ext(spr_food_city, _ind, _xx, _yy, 1, 1, 0, c_white, 1);
    }
}
