event_trigger = function()
{
    var _spawn = instance_create_layer(768, 512, "Terrain", obj_block);
    _spawn.image_yscale = 6;
    _spawn.ID = 1;
    _spawn = instance_create_layer(960, 512, "Terrain", obj_block);
    _spawn.image_yscale = 6;
    _spawn.ID = 1;
    
    for (var i = 0; i < 6; i++)
        part_particles_create(global.part_over, 800, 512 + (i * 64) + 32, global.particles.smoke, 1);
    
    for (var i = 0; i < 6; i++)
        part_particles_create(global.part_over, 992, 512 + (i * 64) + 32, global.particles.smoke, 1);
    
    instance_destroy();
};
