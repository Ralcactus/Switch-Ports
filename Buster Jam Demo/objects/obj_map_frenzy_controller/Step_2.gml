var _shakeX = irandom_range(-global.screen_shake[0], global.screen_shake[0]);
var _shakeY = irandom_range(-global.screen_shake[1], global.screen_shake[1]);
var _zoomXoff = 960 * (1 - zoom);
var _zoomYoff = 540 * (1 - zoom);
camera_set_view_pos(view_camera[0], round(x) + _shakeX + _zoomXoff, round(y) + _shakeY + _zoomYoff);
camera_set_view_size(view_camera[0], 1920 * zoom, 1080 * zoom);

with (obj_frenzy_pattern)
{
    get_cams(0);
    x = camx;
    y = camy;
}

zoom = easy_smooth(zoom, zoom_normal, 4);

if (game_in)
{
    game_in_percent = approach(game_in_percent, 1, 0.1);
    var _percent = use_curve(acurv_linear, game_in_percent, undefined, 0, 0.75);
    
    if (layer_exists("TransBlur"))
    {
        var _fx_struct = layer_get_fx("TransBlur");
        fx_set_parameter(_fx_struct, "g_intensity", _percent);
    }
    
    _percent = use_curve(acurv_linear, game_in_percent, "in", 0, 1);
}
else
{
    game_in_percent = approach(game_in_percent, 1, 0.1);
    var _percent = use_curve(acurv_linear, game_in_percent, undefined, 0.75, 0);
    
    if (layer_exists("TransBlur"))
    {
        var _fx_struct = layer_get_fx("TransBlur");
        fx_set_parameter(_fx_struct, "g_intensity", _percent);
    }
    
    _percent = use_curve(acurv_linear, game_in_percent, "out", 1, 0);
}
