function physics_apply_3d()
{
    var _slope_below = instance_place_3d(x, y, z + 1, obj_slope_3d);
    var _vspd = vspd;
    
    if (_slope_below && _slope_below.slope_dir == 1)
        vspd *= 0.5;
    
    move[0] += hspd * global.delta_game_factor;
    move[1] += vspd * global.delta_game_factor;
    move[2] += zspd * global.delta_game_factor;
    
    for (var c = 0; c < 3; c++)
    {
        move_sub[c] += move[c];
        move_calc[c] = round(move_sub[c]);
        move_sub[c] -= move_calc[c];
    }
    
    vspd = _vspd;
    
    repeat (abs(move_calc[0]))
    {
        var _xdir = sign(move_calc[0]);
        
        if (instance_place_3d(x + _xdir, y, z, obj_solid) && !instance_place_3d(x + _xdir, y, z + 1, obj_solid))
            z++;
        
        if (instance_place_3d(x + _xdir, y, z, par_ground) && !instance_place_3d(x + _xdir, y, z - 1, par_ground) && instance_place_3d(x, y, z + 1, par_ground))
            z--;
        
        if (instance_place_3d(x, y, z + 1, par_ground) && !instance_place_3d(x + _xdir, y, z, obj_solid) && !instance_place_3d(x + _xdir, y, z + 1, par_ground) && instance_place_3d(x + _xdir, y, z + 2, par_ground))
            z++;
        
        if (instance_place_3d(x + _xdir, y, z, obj_solid))
        {
            event_wall_x();
            break;
        }
        
        x += _xdir;
    }
    
    repeat (abs(move_calc[1]))
    {
        var _ydir = sign(move_calc[1]);
        
        if (instance_place_3d(x, y + _ydir, z, obj_solid) && !instance_place_3d(x, y + _ydir, z + 1, obj_solid))
            z++;
        
        if (instance_place_3d(x, y + _ydir, z, par_ground) && !instance_place_3d(x, y + _ydir, z - 1, par_ground) && instance_place_3d(x, y, z + 1, par_ground))
            z--;
        
        if (instance_place_3d(x, y, z + 1, par_ground) && !instance_place_3d(x, y + _ydir, z, obj_solid) && !instance_place_3d(x, y + _ydir, z + 1, par_ground) && instance_place_3d(x, y + _ydir, z + 2, par_ground))
            z++;
        
        if (instance_place_3d(x, y + _ydir, z, obj_solid))
        {
            event_wall_y();
            break;
        }
        
        y += _ydir;
    }
    
    repeat (abs(move_calc[2]))
    {
        var _zdir = sign(move_calc[2]);
        
        if (instance_place_3d(x, y, z + _zdir, obj_solid))
        {
            (_zdir ? event_floor : event_ceiling)();
            break;
        }
        
        z += _zdir;
    }
    
    if (!instance_place_3d(x, y, z + 1, obj_solid) && instance_place_3d(x, y, z + 8, obj_solid) && _slope_below)
    {
        while (!instance_place_3d(x, y, z + 1, obj_solid))
            z++;
    }
}
