shader_set(shd_premultiply);
draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, get_game_width(), get_game_height(), #7932D8, 1);

if (easteregged)
    draw_sprite_ext(spr_soundtestmoonvinyl, 0, get_game_width() - 342, (get_game_height() / 2) - 125, 1, 1, -vinylspin, c_white, 1);
else
    draw_sprite(spr_soundtestmoon, 0, get_game_width(), get_game_height() / 2);

draw_sprite_tiled(spr_soundtestclouds, 0, get_game_width() + (get_cycle(sprite_get_width(spr_soundtestclouds) * 4) / 4), 0);
draw_sprite(spr_soundtesttrees, 0, get_game_width(), get_game_height() / 2);
draw_sprite(flowspr, flowframe, get_game_width(), get_game_height() / 2);
draw_sprite(spr_soundtestgrass, 0, get_game_width(), get_game_height() / 2);
draw_set_colour(c_white);
draw_set_font(global.font);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_text_fancy(20, 20, string_get("menu/soundtest/uptop"));

for (var i = 0; i < array_length(musiclist); i++)
{
    var _c = c_white;
    var _a = 0.5;
    
    if (selected == i)
        _a = 1;
    
    var _str = string_get(musiclist[i][1]);
    
    if (array_length(musiclist[i]) == 3)
        _str = string_shift(_str, 666);
    
    __draw_text_colour_hook(20, 70 + (32 * i), _str, _c, _c, _c, _c, _a);
    
    if (muevent != noone && curmusic == i)
        draw_sprite(spr_soundteststatus, !fmod_studio_event_instance_get_paused(muevent), 20 + (string_width(_str) + 30), 70 + (32 * i) + 18);
}

var _jumptip = string_get("menu/soundtest/tipplay");
var _attacktip = string_get("menu/soundtest/tipexit");

if (muevent != noone)
{
    _attacktip = string_get("menu/soundtest/tipstop");
    
    if (selected == curmusic)
    {
        if (fmod_studio_event_instance_get_paused(muevent))
            _jumptip = string_get("menu/soundtest/tipunpause");
        else
            _jumptip = string_get("menu/soundtest/tippause");
    }
}

draw_set_valign(fa_bottom);
draw_text_fancy(20, get_game_height() - 15, string("{0} {1}", _jumptip, _attacktip));
var _totalheight = 60;
var _totalwidth = (obj_fmod.resolution / 2) * 5;

if (!surface_exists(readoutsurf))
    readoutsurf = surface_create(_totalwidth + 2, _totalheight + 2);

surface_set_target(readoutsurf);
draw_clear_alpha(c_white, 0);
var _valmult = 256;
var _half = obj_fmod.resolution / 2;
var _quarter = obj_fmod.resolution / 4;

for (var i = 0; i < _half; i++)
{
    var _amt = clamp((((i - _quarter) / _half) * 16) + 0.5, 0, 1);
    var _quarti = ((_half - i) + _half) - 1;
    var _val = 0;
    
    if (array_length(global.dspval) > 0)
        _val = lerp(global.dspval[i], global.dspval[_quarti], _amt);
    
    var _height = 1 + (_val * _valmult);
    _height = clamp(_height, 1, _totalheight);
    draw_sprite_stretched(spr_1x1, 0, (i * 5) + 1, (_totalheight - _height) + 1, 4, _height);
}

surface_reset_target();
shader_set(shd_readoutoutline);
var _tex = surface_get_texture(readoutsurf);
shader_set_uniform_f(texel, texture_get_texel_width(_tex), texture_get_texel_height(_tex));
draw_surface(readoutsurf, get_game_width() - _totalwidth - 20, get_game_height() - _totalheight - 20);
shader_set(shd_premultiply);
draw_surface(readoutsurf, get_game_width() - _totalwidth - 20, get_game_height() - _totalheight - 20);
