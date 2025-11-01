function scr_create_shadow()
{
    my_shadow = instance_create_layer(x, y + 1, layer, obj_shadow);
    my_shadow.follow = id;
    my_shadow.z = z;
    return my_shadow.id;
}
