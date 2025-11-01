if (stretch_xdraw)
{
    for (var i = 0; i < image_xscale; i++)
        draw_sprite_ext(anim_sprite, anim_index, x + (sprite_get_width(sprite_index) * i), y + z, 1, 1, 0, image_blend, image_alpha);
}
else
{
    draw_sprite_ext(anim_sprite, anim_index, x, y + z, image_xscale, image_yscale, 0, image_blend, image_alpha);
}

if (!silhouette)
    exit;

with (par_player)
{
    image_xscale = 1.5;
    image_yscale = 1.2;
}

var _array = instance_place_array(x, y, par_player);

with (par_player)
{
    image_xscale = 1;
    image_yscale = 1;
}

var _started = false;

for (var i = 0; i < array_length(_array); i++)
{
    if (!_started)
    {
        _started = true;
        draw_set_bounds(bbox_left, bbox_top, bbox_right, bbox_bottom);
    }
    
    with (_array[i])
        draw_sprite_ext(anim_sprite, anim_index, x, y + z, facing, 1, 0, c_black, 0.45);
}

if (_started)
    draw_reset_clip();
