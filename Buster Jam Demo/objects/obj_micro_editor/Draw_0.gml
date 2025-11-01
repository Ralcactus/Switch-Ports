if (!surface_exists(surf))
    surf = surface_create(game_width, game_height);

surface_set_target(surf);
draw_clear_alpha(c_white, 0);
draw_rectangle_color(0, 0, 1920, 1080, c_gray, c_gray, c_gray, c_gray, false);
var _x1, _y1, _x2, _y2;

for (var i = 0; i < array_length(instances); i++)
{
    var _x = instances[i].x;
    var _y = instances[i].y;
    var _asset = asset_get_index(instances[i].asset);
    var _type = instances[i].type;
    var _ind = instances[i].ind;
    var _xscale = instances[i].xscale;
    var _yscale = instances[i].yscale;
    var _angle = instances[i].angle;
    var _col = instances[i].col;
    var _alpha = instances[i].alpha;
    
    if (_asset == -1)
        continue;
    
    var _spr;
    
    if (_type == 0)
        _spr = object_get_sprite(_asset);
    else
        _spr = _asset;
    
    if (!sprite_exists(_spr))
        continue;
    
    draw_sprite_ext(_spr, _ind, _x, _y, _xscale, _yscale, _angle, _col, _alpha);
    
    if (selected == i)
    {
        _x1 = _x - sprite_get_xoffset(_spr);
        _y1 = _y - sprite_get_yoffset(_spr);
        _x2 = (_x + sprite_get_width(_spr)) - sprite_get_xoffset(_spr);
        _y2 = (_y + sprite_get_height(_spr)) - sprite_get_yoffset(_spr);
    }
}

if (selected >= 0)
{
    draw_rectangle(_x1, _y1, _x2, _y2, true);
    draw_set_alpha(0.6);
    draw_line(_x1, _y1, _x2, _y2);
    draw_line(_x1, _y2, _x2, _y1);
    draw_set_alpha(1);
}

surface_reset_target();
