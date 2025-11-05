image_speed = 0;

canCollide = function(_id, _x, _y)
{
    return true;
};

height = depth;

build = function(_vbuff)
{
    if (left_tex != noone)
        vertex_create_face(_vbuff, new Vec3(bbox_left, height, bbox_bottom), new Vec3(bbox_left, height, bbox_top), new Vec3(bbox_left, 0, bbox_top), new Vec3(bbox_left, 0, bbox_bottom), left_tex, false, false, image_index);
    
    if (top_tex != noone)
        vertex_create_face(_vbuff, new Vec3(bbox_left, height, bbox_top), new Vec3(bbox_right, height, bbox_top), new Vec3(bbox_right, 0, bbox_top), new Vec3(bbox_left, 0, bbox_top), top_tex, false, false, image_index);
    
    if (right_tex != noone)
        vertex_create_face(_vbuff, new Vec3(bbox_right, height, bbox_top), new Vec3(bbox_right, height, bbox_bottom), new Vec3(bbox_right, 0, bbox_bottom), new Vec3(bbox_right, 0, bbox_top), right_tex, false, false, image_index);
    
    if (bottom_tex != noone)
        vertex_create_face(_vbuff, new Vec3(bbox_right, height, bbox_bottom), new Vec3(bbox_left, height, bbox_bottom), new Vec3(bbox_left, 0, bbox_bottom), new Vec3(bbox_right, 0, bbox_bottom), bottom_tex, false, false, image_index);
};
