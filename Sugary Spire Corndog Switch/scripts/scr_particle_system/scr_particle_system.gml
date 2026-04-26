function particle_init(arg0, arg1, arg2)
{
    ds_map_set(global.particlesMap, arg0, [part_type_create(), arg2]);
    var particle_id = ds_map_find_value(global.particlesMap, arg0);
    part_type_sprite(particle_id[0], arg0, true, true, false);
    var lifespan = sprite_get_number(arg0) / arg1;
    part_type_life(particle_id[0], lifespan, lifespan);
    part_type_speed(particle_id[0], 0, 0, 0, 0);
}

function create_particle(arg0, arg1, arg2, arg3 = 0, arg4 = 1, arg5 = arg4)
{
    var particle_id = ds_map_find_value(global.particlesMap, arg2);
    
    if (!is_undefined(particle_id))
    {
        part_system_depth(global.particleSystem, particle_id[1]);
        part_emitter_region(global.particleSystem, global.particles, arg0 - arg3, arg0 + arg3, arg1 - arg3, arg1 + arg3, 0, 0);
        part_emitter_burst(global.particleSystem, global.particles, particle_id[0], 1);
    }
    else
    {
        show_debug_message(string("ERROR: {0} not a valid Particle", arg2));
    }
}

function create_debris(arg0, arg1, arg2, arg3 = 0)
{
    var _struct = 
    {
        x: arg0,
        y: arg1,
        sprite_index: arg2,
        image_number: sprite_get_number(arg2),
        image_index: irandom(image_number - 1),
        image_angle: random_range(1, 270),
        image_speed: arg3,
        image_xscale: 1,
        image_yscale: image_xscale,
        image_blend: c_white,
        image_alpha: 1,
        hsp: random_range(-4, 4),
        vsp: random_range(-5, 5),
        grav: 0.4,
        spr_palette: spr_null,
        paletteSelect: 0,
        canPalette: false,
        terminalVelocity: 20
    };
    ds_list_add(global.particleList, _struct);
    return _struct;
}

function create_collect_effect(arg0, arg1, arg2 = undefined, arg3, arg4 = undefined)
{
    if (is_undefined(arg2))
    {
        switch (obj_parent_player.character)
        {
            default:
                arg2 = choose(spr_collect1, spr_collect2, spr_collect3, spr_collect4, spr_collect5);
                break;
        }
        
        if (is_undefined(arg4))
            arg4 = irandom_range(1, 5);
    }
    
    var struct = 
    {
        sprite_index: arg2,
        image_index: 0,
        image_speed: 0.35,
        x: arg0 - camera_get_view_x(view_camera[0]),
        y: arg1 - camera_get_view_y(view_camera[0]),
        paletteSelect: arg4,
        usePalette: !is_undefined(arg4),
        value: arg3,
        pokerChip: false
    };
    ds_list_add(global.collectParticleList, struct);
    return struct;
}
