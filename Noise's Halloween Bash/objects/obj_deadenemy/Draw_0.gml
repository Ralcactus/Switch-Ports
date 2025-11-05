var _prevox = sprite_get_xoffset(sprite_index);
var _prevoy = sprite_get_yoffset(sprite_index);
var _bbl = sprite_get_bbox_left(sprite_index);
var _bbr = sprite_get_bbox_right(sprite_index);
var _bbt = sprite_get_bbox_top(sprite_index);
var _bbb = sprite_get_bbox_bottom(sprite_index);
var _targetox = _bbl + ((_bbr - _bbl) / 2);
var _targetoy = _bbt + ((_bbb - _bbt) / 2);
var _xoff = (_targetox - _prevox) * image_xscale;
var _yoff = _targetoy - _prevoy;

if (!offset)
{
    x += _xoff;
    y += _yoff;
    offset = true;
}

if (depth > 1000)
{
    scr_createparticle(true, x, y, 1000, spr_sparkle, 2, 2, 0, 0.35);
    instance_destroy();
    exit;
}

if (is_outofview3d(x, y, depth, max(sprite_width, sprite_height)))
{
    instance_destroy();
    exit;
}

var ox = _targetox - _prevox;
var oy = _targetoy - _prevoy;
draw_sprite_billboard_ext(sprite_index, image_index, x - (image_xscale * lengthdir_x(ox, image_angle)) - (image_yscale * lengthdir_x(oy, image_angle - 90)), y - (image_xscale * lengthdir_y(ox, image_angle)) - (image_yscale * lengthdir_y(oy, image_angle - 90)), depth, image_xscale, image_yscale, image_angle, image_blend, image_alpha, false);
