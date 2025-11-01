testvariablenothing = false;
get_cams();
draw_sprite_ext(spr_bg_boomtown_sky, obj_map_geyser.visible, camx, camy, 10, 1, 0, c_white, 1);
draw_sprite_ext(spr_bg_boomtown_sun, obj_map_geyser.visible, camx, camy, 1, 1, 0, c_white, 1);
var _w = sprite_get_width(spr_bg_boomtown_clouds);

if (clouds_x >= _w)
    clouds_x -= _w;

clouds_x += (global.delta_game_factor * 0.3);

for (var i = 0; i < 2; i++)
    draw_sprite_ext(spr_bg_boomtown_clouds, obj_map_geyser.visible, (camx - clouds_x) + (_w * i), camy, 1, 1, 0, c_white, 1);

with (obj_map_geyser)
{
    if (visible)
        event_user(0);
}

var _xoff = -140;
_w = sprite_get_width(spr_bg_boomtown_buildings_back) * 2;

for (var i = 0; i < 2; i++)
{
    draw_sprite_ext(spr_bg_boomtown_buildings_back, 0, (camx * 0.9) + (_w * i) + _xoff, (camy * 0.9) + 182.4, 1, 1, 0, c_white, 1);
    draw_sprite_ext(spr_bg_boomtown_buildings_back, 1, (camx * 0.9) + (_w * i) + _xoff + (_w / 2), (camy * 0.9) + 182.4, 1, 1, 0, c_white, 1);
}

_w = sprite_get_width(spr_bg_boomtown_buildings) * 2;

for (var i = 0; i < 2; i++)
{
    draw_sprite_ext(spr_bg_boomtown_buildings, 0, ((camx * 0.65) + (_w * i)) - 1000, (camy * 0.65) + 638.4, 1, 1, 0, c_white, 1);
    draw_sprite_ext(spr_bg_boomtown_buildings, 1, (((camx * 0.65) + (_w * i)) - 1000) + (_w / 2), (camy * 0.65) + 638.4, 1, 1, 0, c_white, 1);
}
