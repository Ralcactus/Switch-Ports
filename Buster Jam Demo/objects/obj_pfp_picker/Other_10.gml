testvariablenothing = false;
draw_set_color(c_black);
draw_set_alpha(0);
draw_rectangle(0, 0, 1920, 1080, false);
draw_set_alpha(1);
draw_set_color(c_white);
var _w = sprite_get_width(spr_pfp);
var _h = sprite_get_height(spr_pfp);
var _x = 300 - (_w / 2);
var _pfp = global.stats_pfp;
var _spr, _scale;

if (_pfp == -1)
{
    _spr = global.steam_pfp;
    _scale = _w / sprite_get_width(global.steam_pfp);
}
else
{
    _spr = spr_pfp;
    _scale = 1;
}

draw_sprite_ext(_spr, _pfp, _x, 540 - (_h / 2) - 40, _scale, _scale, 0, c_white, 1);
shader_set(sha_flash);
var _xoff = ((-_w / 2) * flash_scale) + (_w / 2);
var _yoff = ((-_h / 2) * flash_scale) + (_h / 2);
draw_sprite_ext(_spr, _pfp, _x + _xoff, (540 - (_h / 2) - 40) + _yoff, _scale * flash_scale, _scale * flash_scale, 0, c_white, flash_alpha);
shader_reset();
draw_set_font(fnt_adlib_44);
draw_set_halign(fa_center);
draw_text(300, 540 + (_h / 2), global.steam_username);
draw_set_halign(fa_left);
_w = sprite_get_width(spr_popup);
_h = sprite_get_height(spr_popup);
var _xscale = 6;
var _yscale = 5;
var _surfW = _w * _xscale;
var _surfH = _h * _yscale;

if (!surface_exists(surf))
    surf = surface_create(_surfW, _surfH);

surface_set_target(surf);
draw_sprite_ext(spr_popup, 1, (_w * _xscale) / 2, (_h * _yscale) / 2, _xscale, _yscale, 0, c_white, 1);
_scale = 0.55;
var _sep = 48;
var _ysep = 35;
_w = sprite_get_width(spr_pfp) * _scale;
_h = sprite_get_height(spr_pfp) * _scale;
_xoff = 0;
_yoff = 0;
var _hcount = 0;

for (var i = -1; i < sprite_get_number(spr_pfp); i++)
{
    _x = 50 + _xoff;
    var _y = 50 + _yoff;
    draw_sprite_ext(spr_pfp_behind, i, 50 + _xoff, 50 + _yoff, _scale, _scale, 0, c_white, 0.25);
    
    if (i == -1)
    {
        var _steam_scale = (sprite_get_width(spr_pfp) * _scale) / sprite_get_width(global.steam_pfp);
        draw_sprite_ext(global.steam_pfp, 0, _x, _y, _steam_scale, _steam_scale, 0, c_white, 1);
    }
    else
    {
        draw_sprite_ext(spr_pfp, i, 50 + _xoff, 50 + _yoff, _scale, _scale, 0, c_white, 1);
    }
    
    if (global.stats_pfp == i)
    {
        if (i == -1)
            _spr = spr_pfp_behind;
        else
            _spr = spr_pfp;
        
        draw_sprite_ext(_spr, i, 50 + _xoff, 50 + _yoff, _scale, _scale, 0, c_black, 0.4);
        draw_sprite_ext(spr_pfp_select, i, 50 + _xoff, 50 + _yoff, _scale, _scale, 0, c_white, 0.45);
    }
    
    if (selected == i)
    {
        var _select_xoff = (_w / 2) * (1 - pfp_select_scale);
        var _select_yoff = (_h / 2) * (1 - pfp_select_scale);
        draw_sprite_ext(spr_pfp_select, i, 50 + _xoff + _select_xoff, 50 + _yoff + _select_yoff, _scale * pfp_select_scale, _scale * pfp_select_scale, 0, c_white, 1);
    }
    
    _xoff += (_w + _sep);
    _hcount++;
    
    if (_hcount == 4)
    {
        _xoff = 0;
        _hcount = 0;
        _yoff += (_h + _ysep);
    }
}

draw_set_halign(fa_center);
draw_text_ext(_surfW / 2, (_surfH / 2) + 200, "More profile pictures in the full game!", 100, _surfW * 0.75);
draw_set_halign(fa_left);
surface_reset_target();
gpu_set_blendenable(false);
draw_surface_ext(surf, 660, (1080 - surface_get_height(surf)) / 2, 1, 1, 0, c_white, 1);
gpu_set_blendenable(true);
