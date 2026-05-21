function scr_movingPlatforms(platformid, hcheck = true, vcheck = true)
{
    with (platformid)
    {
        if (hcheck)
            other.x += (x - xprevious);
        
        if (vcheck)
            other.y += (y - yprevious);
    }
}

#region Regular
function scr_upslope(x_pos, y_pos, MaxIncline = 3)
{
	// Move up slope
    for (var i = MaxIncline; i > 0; i--)
    {
        var _check = true;
        var _z = i - 1;
        
        repeat (i - 1)
        {
            if (!scr_solid(x_pos, y_pos - _z))
                _check = false;
            
            _z--;
        }
        
        if (scr_solid(x_pos, y_pos) && _check && !scr_solid(x_pos, y_pos - i))
            return i;
    }
    
    return false;
}

function scr_downslope(x_pos, y_pos, MaxDecline = 3)
{
	// Move down slope
    for (var i = 1; i < (MaxDecline + 1); i++)
    {
        var _check = true;
        var _z = 1;
        
        repeat (i)
        {
            if (scr_solid(x_pos, y_pos + _z))
                _check = false;
            
            _z++;
        }
        
        if (!scr_solid(x_pos, y_pos) && _check && scr_solid(x_pos, y_pos + (i + 1)))
            return i;
    }
    
    return false;
}

function scr_collide()
{
    scr_collision();
}
#endregion

#region Player
function scr_upslope_player(x_pos, y_pos, MaxIncline = 3)
{
	// Move up slope
    for (var i = MaxIncline; i > 0; i--)
    {
        var _check = true;
        var _z = i - 1;
        
        repeat (i - 1)
        {
            if (!scr_solid_player(x_pos, y_pos - _z))
                _check = false;
            
            _z--;
        }
        
        if (scr_solid_player(x_pos, y_pos) && _check && !scr_solid_player(x_pos, y_pos - i))
            return i;
    }
    
    return false;
}

function scr_downslope_player(x_pos, y_pos, MaxDecline = 3)
{
	// Move down slope
    for (var i = 1; i < (MaxDecline + 1); i++)
    {
        var _check = true;
        var _z = 1;
        
        repeat (i)
        {
            if (scr_solid_player(x_pos, y_pos + _z))
                _check = false;
            
            _z++;
        }
        
        if (!scr_solid_player(x_pos, y_pos) && _check && scr_solid_player(x_pos, y_pos + (i + 1)))
            return i;
    }
    
    return false;
}

function scr_collide_player()
{
    grounded = false;
    groundedSlope = false;
    grinding = false;
    onMovingPlatform = noone;
	
	//Store Old Hsp and Vsp
    prevHsp = hsp;
    prevVsp = vsp;
    
	#region Moving Platform
    with (obj_movingPlatform)
    {
        with (other)
        {
            var old_y = bbox_bottom;
            var other_hsp = other.x - other.xprevious;
            var other_vsp = other.y - other.yprevious;
            
            if (place_meeting(x + other_hsp, y, other.id) || (place_meeting(x, y + other_vsp + 1, other.id) && old_y < other.bbox_top))
            {
                var hcheck = scr_solid_player(x + other_hsp, y);
                var vcheck = scr_solid_player(x, y + other_vsp);
                scr_movingPlatforms(other.id, !hcheck, !vcheck);
                onMovingPlatform = other.id;
            }
        }
    }
	#endregion
    
	// Vertical
    repeat (abs(vsp))
    {
        if (!scr_solid_player(x, y + sign(vsp)))
            y += sign(vsp);
        else
        {
            vsp = 0;
            break;
        }
    }
    
	// Horizontal
    repeat (abs(hsp))
    {
		//Move Up Slope
        y -= scr_upslope_player(x + sign(hsp), y);
		//Move Down Slope
        y += scr_downslope_player(x + sign(hsp), y);
        
        if (!scr_solid_player(x + sign(hsp), y))
            x += sign(hsp);
        else
        {
            hsp = 0;
            break;
        }
    }
    
    if (vsp < 20)
        vsp += grav;
    
    var _oldGrounded = grounded;
    grounded = scr_solid_player(x, y + 1);
    groundedSlope = scr_slope_ext(x, y + 1) && scr_slope_ext(x, (y - bbox_top) + bbox_bottom);
    
    if (!grounded && _oldGrounded && instance_exists(onMovingPlatform))
    {
        hsp += (onMovingPlatform.x - onMovingPlatform.xprevious);
        vsp += (onMovingPlatform.y - onMovingPlatform.yprevious);
    }
}
#endregion

//what why does this need to exist???
function scr_collide_conehead()
{
    grounded = false;
    groundedSlope = false;
    onMovingPlatform = noone;
    
	#region Moving Platform
    with (obj_movingPlatform)
    {
        with (other.id)
        {
            var old_y = bbox_bottom;
            var other_hsp = other.x - other.xprevious;
            var other_vsp = other.y - other.yprevious;
            
            if (place_meeting(x - other_hsp, y, other.id) || (place_meeting(x, y + other_vsp + 1, other.id) && old_y < other.y))
            {
                var hcheck = scr_solid(x + other_hsp, y);
                var vcheck = scr_solid(x, y + other_vsp);
                scr_movingPlatforms(other.id, !hcheck, !vcheck);
                onMovingPlatform = other.id;
            }
        }
    }
	#endregion
    
	// Vertical
    repeat (abs(vsp))
    {
        if (!scr_solid(x, y + sign(vsp)))
            y += sign(vsp);
        else
        {
            vsp = 0;
            break;
        }
    }
    
	// Horizontal
    repeat (abs(hsp))
    {
		//Move Up Slope
        y -= scr_upslope(x + sign(hsp), y);
		//Move Down Slope
        y += scr_downslope(x + sign(hsp), y);
        
        if (!scr_solid(x + sign(hsp), y))
            x += sign(hsp);
    }
    
    if (vsp < 10)
        vsp += grav;
    
    var _oldGrounded = grounded;
    grounded = scr_solid(x, y + 1);
    groundedSlope = slopeCheck(x, y);
    
    if (!grounded && _oldGrounded && instance_exists(onMovingPlatform))
    {
        hsp += (onMovingPlatform.x - onMovingPlatform.xprevious);
        vsp += (onMovingPlatform.y - onMovingPlatform.yprevious);
    }
}
