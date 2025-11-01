if (instance_exists(obj_options) || instance_exists(obj_credits))
    exit;

draw_set_font(fnt_splatter_55);
draw_set_halign(fa_center);
var _y = 220;

for (var i = 0; i < array_length(menu.options); i++)
{
    draw_set_color(c_black);
    draw_text_shake(965, _y + (100 * i) + 5, menu.options[i], 0.3);
    
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
    
    draw_text_shake(960, _y + (100 * i), menu.options[i], 0.3);
    draw_set_color(c_white);
}

hand_ind = obj_title.hand_ind;
hand_y = _y + 42 + (100 * selected_option);
draw_sprite_ext(spr_menu_hand, hand_ind, 960 - (string_width(menu.options[selected_option]) / 2) - 100, hand_y, 0.82, 0.82, 0, c_white, 1);
draw_set_valign(fa_bottom);
draw_set_color(c_black);
draw_text(965, 1073, " LIVE ON KICKSTARTER\nBoomBuster.net");
draw_set_color(c_white);
draw_text(960, 1068, " LIVE ON KICKSTARTER\nBoomBuster.net");
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
