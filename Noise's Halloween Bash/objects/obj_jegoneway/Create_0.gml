event_inherited();

canCollide = function(_id, _x, _y)
{
    if (sign(image_yscale > 0))
        return _id.bbox_bottom <= bbox_top;
    else
        return _id.bbox_top >= bbox_bottom;
};

height = depth;
