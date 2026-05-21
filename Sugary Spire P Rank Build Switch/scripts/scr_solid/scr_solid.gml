/// @desc With this function you can check for collision objects.
/// @param {any*} x The X position to check.
/// @param {any*} y The Y position to check.
/// @param {bool} [no_slope] Toggle to check for Slopes.
function scr_solid(pos_x, pos_y, no_slope = false)
{
    return place_meeting_collision(pos_x, pos_y, no_slope);
}

/// @desc With this function you can check for collision objects. For Players.
/// @param {any*} x The X position to check.
/// @param {any*} y The Y position to check.
/// @param {bool} [no_slope] Toggle to check for Slopes.
function scr_solid_player(pos_x, pos_y, no_slope = false)
{
    return place_meeting_collision(pos_x, pos_y, no_slope);
}
