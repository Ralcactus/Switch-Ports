static_ind += (sprite_get_speed(spr_static) / 60);

if (static_ind >= sprite_get_number(spr_static))
    static_ind -= static_ind;

wizard_ind += (sprite_get_speed(spr_tv_wizard_freak) / 60);

if (wizard_ind >= sprite_get_number(spr_tv_wizard_freak))
    wizard_ind -= wizard_ind;

static_alpha = approach(static_alpha, 0.15, 0.085);

if (deac)
    exit;

global.level_select = selected_option;
global.world = 1;
global.stage = selected_option;

if (selected_option == 0)
{
    global.world = 0;
    global.stage = 1;
}
else if (selected_option == 6)
{
    global.stage = 7;
}

var _selected = selected_option;
menu_move(menu);

if (selected_option != _selected)
    static_alpha = 0.9;

obj_title.bg_yoff = (selected_option / (array_length(menu.options) - 1)) * (sprite_get_height(bgr_title) - 1080);
obj_title.bg_yoff *= -1;

if (input.pressed[5])
{
    global.level_select = 0;
    audio_play_sound(snd_spin, 0, 0);
    instance_create_layer(0, 0, layer, obj_title_menu);
    instance_destroy();
}

get_stats();
