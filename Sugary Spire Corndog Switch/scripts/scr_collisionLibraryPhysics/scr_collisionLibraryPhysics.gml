function scr_collision_init()
{
    grounded = false;
    groundedSlope = false;
    terminalVelocity = 10;
    onMovingPlatform = -4;
    grav = 0;
    hsp = 0;
    vsp = 0;
    prevHsp = 0;
    prevVsp = 0;
    fracHsp = 0;
    fracVsp = 0;
    hspCarry = 0;
    vspCarry = 0;
    true_hsp = 0;
    true_vsp = 0;
    conveyorHsp = 0;
    useConveyorFlag = false;
}

function scr_collision()
{
    var _old_grounded = grounded;
    grounded = false;
    groundedSlope = false;
    onMovingPlatform = -4;
    
    with (obj_movingPlatform)
    {
        if (!hasMove)
            self.moveCode();
        
        var _hspeed = x - xprevious;
        var _vspeed = y - yprevious;
        
        with (other.id)
        {
            x += _hspeed;
            y += _vspeed;
            
            if (place_meeting_collision(x, y + 1, UnknownEnum.Value_m5) && place_meeting(x, y + 1, other))
                onMovingPlatform = other.id;
            
            x -= _hspeed;
            y -= _vspeed;
        }
    }
    
    if (instance_exists(onMovingPlatform))
        kinematics_movingPlatforms(id, onMovingPlatform, true);
    
    var conveyor_hsp = 0;
    
    if (useConveyorFlag)
        conveyor_hsp = conveyorHsp;
    
    useConveyorFlag = false;
    var true_hsp = hsp;
    var true_vsp = vsp;
    var final_hsp = hsp + hspCarry + conveyor_hsp;
    var final_vsp = vsp + vspCarry;
    hsp = absfloor(final_hsp);
    vsp = absfloor(final_vsp);
    var whole_integer = 0;
    fracHsp += (final_hsp - hsp);
    
    if (abs(fracHsp) >= 1)
    {
        whole_integer = absfloor(fracHsp);
        hsp += whole_integer;
        fracHsp -= whole_integer;
    }
    
    fracVsp += (final_vsp - vsp);
    
    if (abs(fracVsp) >= 1)
    {
        whole_integer = absfloor(fracVsp);
        vsp += whole_integer;
        fracVsp -= whole_integer;
    }
    
    var move_hsp = clamp(abs(hsp), 0, bbox_right - bbox_left) * sign(hsp);
    
    repeat (ceil(abs(hsp) / (bbox_right - bbox_left)))
    {
        if (!place_meeting_collision(x + move_hsp, y) && !(place_meeting_collision(x, y + 1) && !place_meeting_collision(x + move_hsp, y + 1)))
        {
            x += move_hsp;
        }
        else
        {
            repeat (abs(move_hsp))
            {
                y -= slope_check_up(x + sign(move_hsp), y);
                
                if (!variable_instance_exists(id, "state") || state != UnknownEnum.Value_5)
                    y += slope_check_down(x + sign(move_hsp), y);
                
                if (!variable_instance_exists(id, "state") || state != UnknownEnum.Value_5)
                    y += reverseSlope_check_down(x + sign(move_hsp), y);
                
                if (vsp <= 0 && place_meeting_collision(x, y - 1))
                    y -= reverseSlope_check_up(x + sign(move_hsp), y);
                
                if (!place_meeting_collision(x + sign(move_hsp), y))
                {
                    x += sign(move_hsp);
                }
                else
                {
                    true_hsp = 0;
                    move_hsp = 0;
                    hsp = 0;
                    break;
                }
            }
            
            break;
        }
    }
    
    var move_vsp = clamp(abs(vsp), 0, bbox_bottom - bbox_top) * sign(vsp);
    
    repeat (ceil(abs(vsp) / (bbox_bottom - bbox_top)))
    {
        if (!place_meeting_collision(x, y + move_vsp))
        {
            y += move_vsp;
        }
        else
        {
            repeat (abs(move_vsp))
            {
                if (vsp < 0)
                {
                    x -= slope_check_left(x, y + sign(vsp));
                    x += slope_check_right(x, y + sign(vsp));
                }
                
                if (!place_meeting_collision(x, y + sign(move_vsp)))
                {
                    y += sign(move_vsp);
                }
                else
                {
                    true_vsp = 0;
                    move_vsp = 0;
                    vsp = 0;
                    break;
                }
            }
            
            break;
        }
    }
    
    hsp = true_hsp;
    vsp = true_vsp;
    hspCarry = 0;
    vspCarry = 0;
    
    if (vsp < terminalVelocity)
        vsp += grav;
    
    grounded = place_meeting_collision(x, y + 1);
    groundedSlope = place_meeting_slope(x, y + 1);
    
    if (!grounded && _old_grounded && instance_exists(onMovingPlatform))
    {
        hspCarry = (onMovingPlatform.x - onMovingPlatform.xprevious) / 2;
        vspCarry = (onMovingPlatform.y - onMovingPlatform.yprevious) / 2;
    }
    
    prevHsp = hsp;
    prevVsp = vsp;
}

function kinematics_movingPlatforms(arg0, arg1, arg2 = true)
{
    with (arg1)
    {
        var _hsp = round(x - xprevious);
        var _vsp = round(y - yprevious);
        
        if (!arg2)
        {
            with (arg0)
            {
                x += _hsp;
                y += _vsp;
            }
        }
        else
        {
            with (arg0)
            {
                repeat (abs(_hsp))
                {
                    if (!place_meeting_collision(x + sign(_hsp), y))
                    {
                        x += sign(_hsp);
                    }
                    else
                    {
                        _hsp = 0;
                        break;
                    }
                }
                
                repeat (abs(_vsp))
                {
                    if (!place_meeting_collision(x, y + sign(_vsp)))
                    {
                        y += sign(_vsp);
                    }
                    else
                    {
                        _vsp = 0;
                        break;
                    }
                }
            }
        }
    }
}

function slope_check_up(arg0, arg1, arg2 = 3)
{
    for (var i = arg2; i > 0; i--)
    {
        var _check = true;
        var _z = i - 1;
        
        repeat (i - 1)
        {
            if (!place_meeting_collision(arg0, arg1 - _z))
                _check = false;
            
            _z--;
        }
        
        if (place_meeting_collision(arg0, arg1) && _check && !place_meeting_collision(arg0, arg1 - i))
            return i;
    }
    
    return 0;
}

function slope_check_down(arg0, arg1, arg2 = 3)
{
    for (var i = 1; i < (arg2 + 1); i++)
    {
        var _check = true;
        var _z = 1;
        
        repeat (i)
        {
            if (place_meeting_collision(arg0, arg1 + _z))
                _check = false;
            
            _z++;
        }
        
        if (!place_meeting_collision(arg0, arg1) && _check && place_meeting_collision(arg0, arg1 + (i + 1)))
            return i;
    }
    
    return 0;
}

function slope_check_left(arg0, arg1, arg2 = 3)
{
    for (var i = 0; i < arg2; i++)
    {
        if (place_meeting_collision(arg0, arg1) && !place_meeting_collision(arg0 - i, arg1))
            return i;
    }
    
    return 0;
}

function slope_check_right(arg0, arg1, arg2 = 3)
{
    for (var i = 0; i < arg2; i++)
    {
        if (place_meeting_collision(arg0, arg1) && !place_meeting_collision(arg0 + i, arg1))
            return i;
    }
    
    return 0;
}

function reverseSlope_check_down(arg0, arg1, arg2 = 3)
{
    for (var i = 0; i < arg2; i++)
    {
        if (place_meeting_collision(arg0, arg1) && !place_meeting_collision(arg0, arg1 + i))
            return i;
    }
    
    return 0;
}

function reverseSlope_check_up(arg0, arg1, arg2 = 3)
{
    for (var i = 0; i < arg2; i++)
    {
        if (!place_meeting_collision(arg0, arg1) && !place_meeting_collision(arg0, arg1 - i) && place_meeting_collision(arg0, arg1 - (i + 1)))
            return i;
    }
    
    return 0;
}
