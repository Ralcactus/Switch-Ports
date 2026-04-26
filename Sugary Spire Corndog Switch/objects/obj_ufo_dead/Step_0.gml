if (scr_solid(x + hsp, y + vsp, false))
{
    instance_create(x, y, obj_mushroomCloudEffect);
    instance_destroy();
}
