if (!instance_exists(sourceid))
    exit;

var _firex = x + (sourceid.sprite_width / 2);
var _firey = y + (sourceid.sprite_height / 2);
var _rot = 270;

repeat (4)
{
    var _rotx = lengthdir_x((sourceid.sprite_width / 2) - 6, _rot);
    var _roty = lengthdir_y((sourceid.sprite_height / 2) - 6, _rot);
    draw_sprite_billboard_ext(sprite_index, image_index, _firex + _rotx, _firey + _roty, z - 6, image_xscale * firescale * 0.5, image_yscale * firescale * 0.5, _rot - 90, c_white, 1, false);
    _rot -= 90;
}
