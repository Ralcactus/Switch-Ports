var _beaten = array_contains(global.save_data.frenzies_beaten, "boomtown_map_statue");

if (_beaten)
{
    instance_destroy();
}
else
{
    var _inst = instance_create_layer(3804, 864, "Collision", obj_infinitewall);
    _inst.image_yscale = 8;
}
