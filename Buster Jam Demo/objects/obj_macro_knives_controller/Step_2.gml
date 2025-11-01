testvariablenothing = false;
var _off = 60;
var _move;

if (side == -1)
    _move = -_off;
else
    _move = _off;

side_move = easy_smooth(side_move, _move, 10);

if (instance_exists(obj_macro_knives_player))
    x = obj_macro_knives_player.x + 650;

var _amnt = 26;
var _xshake = irandom_range(-shake * _amnt, shake * _amnt);
var _yshake = irandom_range(-shake * _amnt, shake * _amnt);
shake = approach(shake, shake_min, shake_dec);
var _zoomxoff;

if (!intro)
    _zoomxoff = (zoom - zoom_game) + 1;
else
    _zoomxoff = 1;

var _zoomyoff = 540 * (zoom - zoom_game);
camera_set_view_pos(view_camera[0], (x - (960 * _zoomxoff)) + _xshake, ((y + side_move + _yshake) - _zoomyoff) + boss_intro_y);
camera_set_view_size(view_camera[0], 1920 * zoom, 1080 * zoom);
camera_set_view_angle(view_camera[0], 0);

if (boss_pan_down)
{
    boss_intro_y = use_curve(acurv_linear, percent_boss_intro, "ease_in_out", 1080, 0);
    percent_boss_intro = approach(percent_boss_intro, 1, 0.0125);
}

if (!intro)
{
    zoom = easy_smooth(zoom, zoom_game, 5.532);
}
else
{
    if (intro_zoomout)
        intro_zoom_percent = approach(intro_zoom_percent, 1, 1/30);
    
    zoom = use_curve(acurv_linear, intro_zoom_percent, "ease_in_out", intro_zoom, zoom_game);
    y = use_curve(acurv_linear, intro_zoom_percent, "ease_in_out", -390, 0);
    
    if (zoom == zoom_game)
    {
        intro = false;
        
        with (obj_macro_knives_player)
            deac = false;
    }
}

if (global.debug)
{
    if (keyboard_check_pressed(vk_tab))
        shake = 1;
    
    if (keyboard_check_pressed(vk_space))
        zoom = 0.95;
}
