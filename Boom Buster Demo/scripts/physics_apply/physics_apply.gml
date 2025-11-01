function physics_apply()
{
    if (!instance_exists(self))
        exit;
    
    move[0] = 0;
    move[1] = 0;
    
    for (var i = 0; i < array_length(move_forces[0]); i++)
        move[0] += variable_instance_get(id, move_forces[0][i]);
    
    for (var i = 0; i < array_length(move_forces[1]); i++)
        move[1] += variable_instance_get(id, move_forces[1][i]);
    
    if (has_collision && solid_meeting(x, y + 1, obj_conveyor))
    {
        var _inst = instance_place(x, y + 1, obj_conveyor);
        
        if (y <= _inst.y)
            move[0] += _inst.force;
    }
    
    if (has_collision && place_meeting(x, y + 1, obj_conveyor_semi))
    {
        var _inst = instance_place(x, y + 1, obj_conveyor_semi);
        
        if (y <= _inst.y)
            move[0] += _inst.force;
    }
    
    move[0] += hspd;
    move[1] += vspd;
    
    for (var c = 0; c < 2; c++)
    {
        move_sub[c] += move[c];
        move_calc[c] = round(move_sub[c]);
        move_sub[c] -= move_calc[c];
    }
    
    var _xdir = sign(move_calc[0]);
    var _ydir = sign(move_calc[1]);
    
    if (has_collision && solid_meeting(x, y, obj_solid) && !solid_meeting(x, y + 8, obj_solid))
    {
        while (solid_meeting(x, y, obj_solid))
        {
            y++;
            
            if (!solid_meeting(x, y, obj_solid))
                break;
        }
    }
    
    repeat (abs(move_calc[0]))
    {
        if (!has_collision)
        {
            x += _xdir;
            event_xmove();
        }
        else
        {
            if (solid_meeting(x + _xdir, y, obj_solid) && !solid_meeting(x + _xdir, y + 1, obj_solid))
                y++;
            
            if (solid_meeting(x + _xdir, y, par_ground) && !solid_meeting(x + _xdir, y - 1, par_ground) && on_ground())
                y--;
            
            if (can_slope_down && on_ground() && !solid_meeting(x + _xdir, y, obj_solid) && !solid_meeting(x + _xdir, y + 1, par_ground) && solid_meeting(x + _xdir, y + 2, par_ground))
                y++;
            
            var _obj = _xdir ? obj_onewayL : obj_onewayR;
            
            if (place_meeting(x + _xdir, y, _obj))
            {
                var _inst = instance_place(x + _xdir, y, _obj);
                
                if (!place_meeting(x - _xdir, y, _inst))
                {
                    event_wall();
                    break;
                }
            }
            
            if (solid_meeting(x + _xdir, y, obj_solid))
            {
                event_wall();
                break;
            }
            
            x += _xdir;
            event_xmove();
        }
    }
    
    repeat (abs(move_calc[1]))
    {
        if (!has_collision)
        {
            y += _ydir;
            
            if (!event_ymove())
                break;
        }
        else
        {
            var _obj = _ydir ? obj_onewayU : obj_onewayD;
            
            if (place_meeting(x, y + _ydir, _obj))
            {
                var _inst = instance_place(x, y + _ydir, _obj);
                
                if (!place_meeting(x, y - _ydir, _inst))
                {
                    (_ydir ? event_floor : event_ceiling)();
                    break;
                }
            }
            
            if (_ydir > 0 && place_meeting(x, y + _ydir, obj_movingsemi))
            {
                var _inst = instance_place(x, y + _ydir, obj_movingsemi);
                
                if (_inst && !place_meeting(x, y - 1, _inst))
                {
                    with (_inst)
                        event_oof();
                    
                    event_floor();
                    break;
                }
            }
            
            if (solid_meeting(x, y + _ydir, obj_solid))
            {
                (_ydir ? event_floor : event_ceiling)();
                break;
            }
            
            y += _ydir;
            
            if (!event_ymove())
                break;
        }
    }
    
    if (((has_collision && !on_ground()) || !has_collision) && grav != 0 && has_gravity)
        vspd += grav;
    
    if (instance_exists(self) && ds_list_size(list_ignore) > 0)
    {
        for (var i = 0; i < ds_list_size(list_ignore); i++)
        {
            if (!place_meeting(x, y, ds_list_find_value(list_ignore, i)))
                ds_list_delete(list_ignore, i);
        }
    }
}
