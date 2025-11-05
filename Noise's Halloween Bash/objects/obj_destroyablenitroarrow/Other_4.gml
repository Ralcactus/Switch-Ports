if (in_saveroom(string("{0}_ARROW", real(id)), global.respawnroom))
{
    if (!in_saveroom(string("{0}_NITRO", real(id)), global.respawnroom))
    {
        with (instance_create_depth(x, y, z, obj_destroyablenitro))
        {
            arrowid = other.id;
            image_xscale = other.image_xscale;
            image_yscale = other.image_yscale;
        }
    }
    
    instance_destroy(id, false);
}
