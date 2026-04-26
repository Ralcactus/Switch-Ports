image_angle += (hsp * 2);
x += hsp;

if (scr_solid(x + image_xscale, y))
{
    instance_create(x, y, obj_bumpEffect);
    instance_destroy();
}
