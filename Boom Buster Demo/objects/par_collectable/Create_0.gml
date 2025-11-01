timer[0] = life;

timer_func[0] = function()
{
    part_particles_create(global.part_over, x, y, global.particles.smoke, 1);
    instance_destroy();
};

timer[1] = -1;

timer_func[1] = function()
{
    flicker = !flicker;
};

timer[2] = -1;

timer_func[2] = function()
{
    var _x = x;
    var _y = y + 8;
    var _rotoffset = irandom_range(0, 360);
    
    for (var i = 0; i < star_count; i++)
    {
        var _angle = ((360 / star_count) * i) + _rotoffset;
        var _part = part_type_create();
        part_type_sprite_simple(_part, spr_fx_sparkle_yellow);
        part_type_direction(_part, _angle, _angle, 0.5, 0);
        part_type_speed(_part, 3, 3, -0.12, 0);
        part_particles_create(global.part_over, _x, _y, _part, 1);
        ds_map_add(global.map_particles, _part, 120);
    }
    
    part_particles_create(global.part_over, _x, _y, global.particles.ring, 1);
    score_spawn(x, y, worth, obj_persistent.font_coins);
    
    if (kaching)
        audio_stop_play(snd_kaching, 0, 0);
    
    instance_destroy();
};

path_init();
anim_init();
anim_sprite = sprite_index;
flicker = false;
star_count = 6;
hspd = 0;
vspd = 0;
grav = 0;
collected = false;
