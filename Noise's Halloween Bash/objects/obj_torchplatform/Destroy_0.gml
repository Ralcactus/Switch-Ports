event_inherited();
instance_destroy(fireid);
destroy_sounds([loopsnd]);

with (instance_create_depth(x, y, depth - 7, obj_torchrespawner))
{
    image_xscale = other.dir;
    path = other.path;
    movespeed = other.movespeed;
}
