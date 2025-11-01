draw_set_alpha(wanted_alpha * 0.4);
draw_set_color(c_black);
draw_rectangle(0, 0, controller.game_width, controller.game_height, false);
draw_set_color(c_white);
draw_set_alpha(1);
draw_sprite_ext(spr_micro_mugshot_wanted, 0, 0, 0, 1, 1, 0, c_white, wanted_alpha);

if (snap_state == 2)
{
    if (controller.win)
    {
        win_ind += ((sprite_get_speed(spr_micro_mugshot_win) / 60) * global.delta_game_factor);
        draw_sprite(spr_micro_mugshot_win_bg, 0, 0, 0);
        draw_sprite(spr_micro_mugshot_win, win_ind, 0, 0);
    }
    else
    {
        var _str = "Not the Target!";
        draw_set_font(global.font_splash);
        draw_set_halign(fa_center);
        draw_text_transformed(controller.game_width / 2, controller.game_height / 2, string_upper(_str), 0.5, 0.5, 0);
        draw_set_halign(fa_left);
    }
}

draw_set_alpha(flash);
draw_rectangle(0, 0, controller.game_width, controller.game_height, false);
draw_set_alpha(1);
