function physics_init_2d()
{
    my_solid = obj_solid_micro;
    my_onewayU = obj_onewayU;
    my_onewayL = obj_onewayL;
    my_onewayR = obj_onewayR;
    my_onewayD = obj_onewayD;
    my_ground_par = par_ground;
    my_barrier = obj_barrier;
    hspd = 0;
    vspd = 0;
    grav = 1.2;
    
    for (var i = 0; i < 2; i++)
    {
        move[i] = 0;
        move_sub[i] = 0;
        move_forces[0] = [];
        move_forces[1] = [];
    }
    
    hspd_platform = 0;
    hspd_conveyor = 0;
    can_slope_down = true;
    has_collision = true;
    bounce_blocks = 1;
    has_gravity = true;
    array_ignore_obj = [];
    array_ignore_id = [];
    my_kinematic_semi = -4;
    
    xmove_collide = function(arg0)
    {
        var _xdir = sign(arg0);
        
        repeat (abs(arg0))
        {
            if (!has_collision)
            {
                x += _xdir;
                event_xmove();
            }
            else
            {
                var _grounded = on_ground();
                var _sloped = false;
                
                if (!_sloped && solid_meeting(x + _xdir, y, my_ground_par) && !solid_meeting(x + _xdir, y - 1, my_solid) && on_ground())
                {
                    _sloped = true;
                    y--;
                }
                
                if (solid_meeting(x + _xdir, y, my_solid) || place_meeting(x + _xdir, y, my_barrier))
                {
                    event_wall();
                    break;
                }
                
                x += _xdir;
                
                if (!on_ground() && _grounded && solid_meeting(x, y + 4, my_ground_par))
                {
                    if (can_slope_down)
                    {
                        var i;
                        
                        for (i = 0; i < 4; i++)
                        {
                            y++;
                            i++;
                            
                            if (on_ground())
                                break;
                        }
                        
                        if (!on_ground() && i == 4)
                            y -= 4;
                    }
                }
                
                event_xmove();
            }
        }
    };
    
    ymove_collide = function(arg0)
    {
        var _ydir = sign(arg0);
        
        repeat (abs(arg0))
        {
            if (!has_collision)
            {
                y += _ydir;
                event_ymove();
            }
            else
            {
                var _obj = _ydir ? my_onewayU : my_onewayD;
                
                if (!(_ydir == 1 && !on_ground()) && solid_meeting(x, y + _ydir, _obj))
                {
                    (_ydir ? event_floor : event_ceiling)();
                    break;
                }
                
                if (solid_meeting(x, y + _ydir, my_solid))
                {
                    (_ydir ? event_floor : event_ceiling)();
                    break;
                }
                
                y += _ydir;
                event_ymove();
            }
        }
    };
    
    event_wall = function()
    {
        hspd = 0;
    };
    
    event_floor = function()
    {
        vspd = 0;
    };
    
    event_ceiling = function()
    {
        vspd = 0;
    };
    
    event_xmove = function()
    {
    };
    
    event_ymove = function()
    {
    };
}
