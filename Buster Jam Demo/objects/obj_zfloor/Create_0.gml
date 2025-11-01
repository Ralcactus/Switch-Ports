z = 0;
image_speed = 0;

create_solid = function()
{
    height = image_index * 96;
    var _wall = instance_create_layer(x, y, "Collision", obj_solid);
    _wall.image_xscale = image_xscale;
    _wall.image_yscale = image_yscale;
    _wall.y += height;
    _wall.z = z;
    _wall.height = height;
    instance_destroy();
};

create_solid();
