image_speed = 0;
height = depth;

build = function(_vbuff)
{
    var _xstart = (image_xscale < 0) ? bbox_right : bbox_left;
    var _xend = (image_xscale < 0) ? bbox_left : bbox_right;
    var _zstart = (image_yscale < 0) ? bbox_bottom : bbox_top;
    var _zend = (image_yscale < 0) ? bbox_top : bbox_bottom;
    vertex_create_face(_vbuff, new Vec3(_xstart, height, _zstart), new Vec3(_xend, height, _zstart), new Vec3(_xend, height, _zend), new Vec3(_xstart, height, _zend), sprite_index, (height > -64) ^^ (image_xscale < 0) ^^ (image_yscale < 0), false, image_index);
};
