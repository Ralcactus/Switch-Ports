var _me = id;

with (other)
{
    image_xscale = other.image_xscale;
    
    with (instance_create(x, y, obj_baddieDead))
    {
        vsp = random_range(-7, -10);
        hsp = irandom(6) + _me.hsp;
        rotatevalue = random_range(5, 10);
        rotatedirection = _me.image_xscale;
        canrotate = true;
        canrotate = false;
        sprite_index = spr_rosette_dead;
        image_speed = 0.35;
        depth = _me.depth - 1;
    }
    
    instance_destroy();
}
