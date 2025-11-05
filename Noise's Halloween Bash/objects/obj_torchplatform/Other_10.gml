scale = min(scale + 0.1, 1);
image_xscale = scale * dir;
image_yscale = scale;
event_set_3d_position(loopsnd, x, y);
var _firecycle = get_cycle(370);

if (!skipfirecycle)
{
    if (_firecycle >= 240)
    {
        if (sprite_index != spr_frogplat_firestart && sprite_index != spr_frogplat_fire)
        {
            sprite_index = spr_frogplat_firestart;
            image_index = 0;
            fmod_studio_event_instance_start(loopsnd);
        }
    }
    else if (_firecycle >= 200)
    {
        if (sprite_index != spr_frogplat_bouncefireprep && sprite_index != spr_frogplat_fireprep)
        {
            sprite_index = spr_frogplat_bouncefireprep;
            image_index = 0;
            scr_fmod_soundeffectONESHOT("event:/sfx/enemy/fireplatprep", x, y);
        }
        
        if (sprite_index != spr_frogplat_bouncefireprep)
            sprite_index = spr_frogplat_fireprep;
    }
    else if (_firecycle >= 0)
    {
        if (sprite_index != spr_frogplat_idle && sprite_index != spr_frogplat_bounce)
        {
            event_stop(loopsnd, false);
            sprite_index = spr_frogplat_bounce;
            
            if (sprite_index != spr_frogplat_bouncefireprep)
                image_index = 0;
        }
    }
}
else if (_firecycle < 200)
    skipfirecycle = false;

if (sprite_index != spr_frogplat_firestart && sprite_index != spr_frogplat_fire)
{
    if (event_isplaying(loopsnd))
        event_stop(loopsnd, false);
}

if (sprite_animation_end())
{
    switch (sprite_index)
    {
        case spr_frogplat_bounce:
            sprite_index = spr_frogplat_idle;
            break;
        
        case spr_frogplat_bouncefireprep:
            sprite_index = spr_frogplat_fireprep;
            break;
        
        case spr_frogplat_firestart:
            sprite_index = spr_frogplat_fire;
            break;
    }
}

if (sprite_index == spr_frogplat_fire)
{
    if (!instance_exists(fireid))
        fireid = instance_create_depth(x, y, depth, obj_torchplatformfire);
    else
    {
        fireid.x = x;
        fireid.y = y;
    }
}
else if (instance_exists(fireid))
    instance_destroy(fireid);

if (path != noone)
{
    var _framestocomplete = floor((path_get_length(path) / abs(movespeed)) * (path_get_closed(path) ? 1 : 2));
    var _cycle = get_cycle(_framestocomplete, cycleoffset);
    var _halftime = _framestocomplete / 2;
    
    if (skipcycle)
    {
        x = round(path_get_x(path, 0));
        y = round(path_get_y(path, 0));
        
        if (_cycle == 0)
            skipcycle = false;
    }
    else
    {
        var _pathpos;
        
        if (path_get_closed(path))
            _pathpos = _cycle / _framestocomplete;
        else
        {
            _pathpos = _cycle / _halftime;
            
            if (_pathpos > 1)
                _pathpos = 1 - (_pathpos - 1);
        }
        
        if (sign(movespeed) == -1)
            _pathpos = 1 - _pathpos;
        
        x = round(path_get_x(path, _pathpos));
        y = round(path_get_y(path, _pathpos));
    }
}
