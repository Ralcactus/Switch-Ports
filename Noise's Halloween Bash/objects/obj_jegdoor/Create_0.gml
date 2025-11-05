canCollide = function(_id, _x, _y)
{
    return open <= 0;
};

image_speed = 0;
height = depth;
open = 0;
doorClose = -1;
doorOpen = -1;

interact = function()
{
    scr_fmod_soundeffectONESHOT("event:/sfx/misc/dooropen", x + (sprite_width / 2), -25, y);
    open = 180;
};

build = function(_vbuff)
{
    var _xstart = (image_xscale < 0) ? bbox_right : bbox_left;
    var _xend = (image_xscale < 0) ? bbox_left : bbox_right;
    var _zstart = (image_yscale < 0) ? bbox_bottom : bbox_top;
    var _zend = (image_yscale < 0) ? bbox_top : bbox_bottom;
    doorClose = vertex_create_buffer();
    vertex_begin(doorClose, global.vFormat);
    vertex_create_face(doorClose, new Vec3(_xstart, height, _zstart), new Vec3(_xend, height, _zstart), new Vec3(_xend, 0, _zstart), new Vec3(_xstart, 0, _zstart), spr_jegdoor, (image_xscale < 0) ^^ (image_yscale < 0), false, 0);
    vertex_create_face(doorClose, new Vec3(_xstart, height, _zend), new Vec3(_xend, height, _zend), new Vec3(_xend, 0, _zend), new Vec3(_xstart, 0, _zend), spr_jegdoor, (image_xscale > 0) ^^ (image_yscale < 0), false, 0);
    vertex_end(doorClose);
    vertex_freeze(doorClose);
    doorOpen = vertex_create_buffer();
    vertex_begin(doorOpen, global.vFormat);
    vertex_create_face(doorOpen, new Vec3(_xstart, height, _zstart), new Vec3(_xend, height, _zstart), new Vec3(_xend, 0, _zstart), new Vec3(_xstart, 0, _zstart), spr_jegdoor, (image_xscale < 0) ^^ (image_yscale < 0), false, 1);
    vertex_create_face(doorOpen, new Vec3(_xstart, height, _zend), new Vec3(_xend, height, _zend), new Vec3(_xend, 0, _zend), new Vec3(_xstart, 0, _zend), spr_jegdoor, (image_xscale > 0) ^^ (image_yscale < 0), false, 1);
    vertex_end(doorOpen);
    vertex_freeze(doorOpen);
};
