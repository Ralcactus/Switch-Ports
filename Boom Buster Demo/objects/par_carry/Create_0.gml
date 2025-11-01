physics_init();
anim_init();
xscale_squish = 1;
yscale_squish = 1;
carry_yoff = 0;
facing = 1;
collected = false;
throwable = false;
ignore = -4;
ignore_timer = 0;
carried = -4;
carried_tossY = -999;
tossed = false;
thrown = false;
dropped = false;
landYobj = -4;
landY = -999;
tossY = -999;
collide_with_ceiling = false;
landed = false;
inPipe = -4;
abrupt_land = false;
hspd_bounce = 0;
array_push(move_forces[0], "hspd_bounce");
wings = false;
time = 0;
wings_sin = 0;
wing_ind = 0;

event_wings_away = function()
{
    var _inst = instance_create_depth(x, y, layer_get_depth(layer) + 1, obj_wings_away);
    _inst.anim_index = wing_ind;
    wings = false;
};

event_floor = function()
{
    if (inPipe)
    {
        var _jump = -6;
        vspd = choose(_jump, _jump * 1.3, _jump * 1.6);
        exit;
    }
    
    var _vspd = vspd;
    var _tossed = tossed;
    var _dropped = dropped;
    
    if (place_meeting(x, y + 1, obj_movingsemi) || place_meeting(x, y + 1, obj_conveyor) || place_meeting(x, y + 1, obj_conveyor_semi))
    {
        var _fine = false;
        
        if (place_meeting(x, y + 1, obj_movingsemi))
        {
            var _inst = instance_place(x, y + 1, obj_movingsemi);
            
            if (_inst.hspd == 0 && _inst.vspd == 0)
                _fine = true;
        }
        
        if (!_fine)
        {
            if (vspd >= 14)
                part_particles_create(global.part_over, x, y, global.particles.dustland, 1);
            
            vspd = 0;
            exit;
        }
    }
    
    if (_dropped || abrupt_land)
    {
        hspd_bounce = random_range(-4, 4);
        dropped = false;
        abrupt_land = false;
    }
    
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

event_wall = function()
{
    if (inPipe)
        hspd = -hspd;
    else
        hspd = 0;
};

event_ymove = function()
{
    if (tossed && (place_meeting(x, y + 1, obj_caution_solid) || place_meeting(x, y + 1, obj_caution_semisolid)))
    {
        var _list = ds_list_create();
        instance_place_list(x, y + 1, obj_caution_solid, _list, false);
        var _blocked = false;
        
        for (var i = 0; i < ds_list_size(_list); i++)
        {
            var _inst = ds_list_find_value(_list, i);
            
            if (carried_tossY <= _inst.y)
            {
                with (ds_list_find_value(_list, i))
                    event_user(0);
                
                _blocked = true;
            }
        }
        
        ds_list_destroy(_list);
        _list = ds_list_create();
        instance_place_list(x, y + 1, obj_caution_semisolid, _list, false);
        
        for (var i = 0; i < ds_list_size(_list); i++)
        {
            var _inst = ds_list_find_value(_list, i);
            
            if (carried_tossY <= _inst.y)
            {
                with (ds_list_find_value(_list, i))
                    event_user(0);
                
                _blocked = true;
            }
        }
        
        ds_list_destroy(_list);
        
        if (_blocked)
        {
            tossed = false;
            thrown = false;
            has_collision = true;
            abrupt_land = true;
            event_floor();
            landY = -999;
            ignore_timer = -1;
            ignore = -4;
            return false;
        }
    }
    
    if (mypath != -4 && !on_path && y >= landY)
    {
        on_path = true;
        x = path_get_x(mypath, path_pos);
        y = path_get_y(mypath, path_pos);
        return false;
    }
    
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

timer[1] = -1;

timer_func[1] = function()
{
    thrown = false;
    grav = 1.2;
};

event_wall = function()
{
    if (throwable && ignore != -4)
    {
        ignore = -4;
        ignore_timer = -1;
    }
    
    hspd = -hspd;
};

path_init();
create_explosion_radius = false;

event_explode = function()
{
    if (create_explosion_radius)
    {
        var _inst = instance_create_layer(x, y, "Collision", obj_explosion_radius);
        _inst.image_xscale = 2.5;
        _inst.image_yscale = 2.5;
    }
    
    part_particles_create(global.part_over_nostun, x, y - 32, global.particles.explosion, 1);
    screen_shake(8, 8);
    audio_play_sound(snd_explosion, 0, 0);
    instance_destroy();
};
