if (xAxis != 0 || yAxis != 0)
{
    var _dir = point_direction(x, y, x + xAxis, y + yAxis);
    
    if (input_source_using(__input_global().__source_gamepad, 0) && !input_check("dpad_right") && !input_check("dpad_left") && !input_check("dpad_up") && !input_check("dpad_down"))
    {
        var _amnt = 30;
        _dir = round(_dir / _amnt) * _amnt;
    }
    
    var _walkspd;
    
    if (abs(xAxis) <= 0.1)
        _walkspd = 0;
    else
        _walkspd = movespd;
    
    var _movespd = _walkspd + boostspd;
    hspd = lengthdir_x(_movespd, _dir);
    
    if (abs(yAxis) <= 0.1)
        _walkspd = 0;
    else
        _walkspd = movespd;
    
    _movespd = _walkspd + boostspd;
    vspd = lengthdir_y(_movespd, _dir);
}
else
{
    hspd = 0;
    vspd = 0;
}

scr_player_state_free();

if (grounded)
{
    if (aPressed)
    {
        zspd = -jump_strength;
        jumping = true;
        audio_play_sound(snd_jump, 0, 0);
    }
}
else if (action == action_spin)
{
    zspd += (grav * global.delta_game_factor);
}
else
{
    zspd += (grav * global.delta_game_factor);
}

if (zspd > vspd_max)
    zspd = vspd_max;

var _ladder = -4;
image_xscale = 0.45;
_ladder = instance_place_3d(x, y - 1, z, obj_ladder_3d);
image_xscale = 1;

if (_ladder && instance_place_3d(x, y - 1, z, obj_solid) && yAxis < 0)
{
    hspd = 0;
    vspd = 0;
    zspd = 0;
    action = action_free;
    timer[0] = -1;
    my_ladder = _ladder;
    x = _ladder.x + (48 * _ladder.image_xscale);
    obj_map_cam.lag = 4;
    state = state_climb;
    
    with (obj_solid_ladder)
        mask_index = spr_nothing;
    
    exit;
}

image_xscale = 0.25;
_ladder = instance_place_3d(x, y + 1, z + 1, obj_ladder_3d);

if (_ladder && yAxis > 0 && instance_place_3d(x, y + 1, z, obj_solid_ladder))
{
    obj_map_cam.lag = 4;
    x = _ladder.x + (48 * _ladder.image_xscale);
    y = _ladder.y + 28;
    z = _ladder.z - _ladder.height;
    hspd = 0;
    vspd = 0;
    zspd = 0;
    state = state_climb;
    my_ladder = _ladder;
    
    with (obj_solid_ladder)
        mask_index = spr_nothing;
}

image_xscale = 1;
