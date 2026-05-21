/// @desc With this function you can check for collision slopes (Depecrated)
/// @param {bool} [no_platform] Ignore platform slopes?
function scr_slope(no_platform = false)
{
    return scr_slope_ext(x, y + 1, no_platform);
}

/// @desc With this function you can check for collision slopes.
/// @param {any*} x The X position to check.
/// @param {any*} y The Y position to check.
/// @param {bool} [no_platform] Ignore platform slopes?
function scr_slope_ext(pos_x, pos_y, no_platform = false)
{
    return place_meeting_slope(pos_x, pos_y, !no_platform);
}

function scr_solid_slope(arg0, arg1)
{
    place_meeting_slopeSolid(arg0, arg1);
}

//still needed
function slopeCheck(x_pos, y_pos)
{
    return scr_slope_ext(x_pos, y_pos + 1) && !scr_solid_slope(x_pos, y_pos + 1) && !scr_solid_slope(x_pos, y_pos) && scr_slope_ext(x_pos, (y_pos - bbox_top) + bbox_bottom);
}

function scr_slopePlatform(arg0, arg1)
{
    place_meeting_slopePlatform(arg0, arg1);
}

/// @desc Checks for Slope below player. Returns Slope Acceleration.
/// @returns {real} Slope Acceleration.
function slopeMomentum_acceleration()
{
    if (place_meeting_slope(x, y + 1, false))
    {
        with (instance_place(x, y + 1, obj_slope))
        {
            var slope_acceleration = abs(image_yscale) / abs(image_xscale);
            
            if (sign(image_xscale) >= 1)
                return -slope_acceleration;
            else
                return slope_acceleration;
        }
    }
    
    if (place_meeting_slopePlatform(x, y + 1))
    {
        with (instance_place(x, y + 1, obj_slopePlatform))
        {
            var slope_acceleration = abs(image_yscale) / abs(image_xscale);
            
            if (sign(image_xscale) >= 1)
                return -slope_acceleration;
            else
                return slope_acceleration;
        }
    }
}

/// @desc Checks for Slope below player. Returns Slope Direction.
/// @returns {real} Slope Direction.
function slopeMomentum_direction()
{
    if (place_meeting_slope(x, y + 1, false))
    {
        with (instance_place(x, y + 1, obj_slope))
            return sign(image_xscale);
    }
    
    if (place_meeting_slopePlatform(x, y + 1))
    {
        with (instance_place(x, y + 1, obj_slopePlatform))
            return sign(image_xscale);
    }
}

function player_slopeMomentum(add, sub = add)
{
    var inst = instance_place(x, y + 1, obj_slopePlatform);
    
    if (instance_place(x, y + 1, obj_slope) != noone)
        inst = instance_place(x, y + 1, obj_slope);
    
    if (groundedSlope && inst != noone)
    {
        var _xscale = sign(inst.image_xscale);
        var slope_acceleration = abs(inst.image_yscale) / abs(inst.image_xscale);
        
        if (sign(image_xscale) == _xscale)
            movespeed -= (sub * slope_acceleration);
        else
            movespeed += (add * slope_acceleration);
    }
}
