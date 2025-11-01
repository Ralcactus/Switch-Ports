physics_init();
anim_init();
path_init();
collected = false;
has_collision = false;
landY = -999;
landYobj = -4;

event_floor = function()
{
    var _vspd = vspd;
    
    if (_vspd >= 2)
    {
        vspd = -_vspd * 0.4;
        
        if (_vspd >= 14)
            part_particles_create(global.part_over, x, y, global.particles.dustland, 1);
    }
    else
    {
        vspd = 0;
    }
};

event_ymove = function()
{
    if (mypath == -4 && y >= landY && !solid_meeting(x, y, obj_solid))
    {
        has_collision = true;
        landY = -999;
        landYobj = -4;
    }
    
    return true;
};

event_bounce_extra = function()
{
    landY = -999;
    landYobj = -4;
};

timer[0] = 600;

timer_func[0] = function()
{
    var _yoff = ds_map_find_value(global.map_path_yoffs, object_get_name(object_index));
    
    if (is_undefined(_yoff))
        _yoff = 0;
    
    part_particles_create(global.part_over, x, y - _yoff, global.particles.smoke, 1);
    instance_destroy();
};

flicker = false;
timer[1] = -1;

timer_func[1] = function()
{
    flicker = !flicker;
};

cash = false;
collected = false;
star_count = 6;
timer[2] = -1;

timer_func[2] = function()
{
    var _x = x;
    var _y = y - 30;
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
    
    if (cash)
        score_spawn(_x, _y - 10, 2);
    
    instance_destroy();
};
