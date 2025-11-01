testvariablenothing = false;

if (global.cutscene_swap || hurt || scr_map_exit_freeze())
    exit;

scr_player_inputs();

if (opening)
{
    repeat (12)
    {
        var _xbefore = x;
        var _ybefore = y;
        x += (xAxis * movespd);
        y += (yAxis * movespd);
        var _hspd = x - _xbefore;
        var _vspd = y - _ybefore;
        var _y = y;
        var _struct = 
        {
            x: x,
            y: _y,
            z: z,
            hspd: _hspd,
            vspd: _vspd,
            zspd: zspd,
            grounded: grounded,
            dir: dir,
            facing: facing,
            jump: false,
            running: false,
            state: state
        };
        array_push(array_record, _struct);
        
        if (array_length(array_record) == record_max)
            array_shift(array_record);
    }
    
    opening = false;
    array_delete(array_record, array_length(array_record) - 1, 1);
}

scr_player_step();
event_user(state);

if (hspd == 0 && vspd == 0)
{
    image_speed = 0;
    image_index = 0;
}
else
{
    image_speed = 1;
}

physics_apply_3d();
grounded = instance_place_3d(x, y, z + 1, obj_solid);

if (!(hspd == 0 && vspd == 0))
    dir = point_direction(0, 0, hspd, vspd);

scr_shadow_z();

if (global.follower)
{
    var _hspd = xprevious - x;
    var _vspd = yprevious - y;
    var _zspd = zprevious - z;
    var _moving = false;
    
    if (_hspd != 0 || _vspd != 0 || (_zspd != 0 && record_this_jump))
        _moving = true;
    
    if (!obj_map_player_follower.grounded)
        _moving = true;
    
    var _jumping = jumping;
    
    if (!record_this_jump)
        _jumping = false;
    
    if (state == state_climb && obj_map_player_follower.state == state_climb && zspd == 0)
        _moving = false;
    
    if (!global.cutscene_swap && _moving)
    {
        repeat (max(1, round(1 * global.delta_real_factor)))
        {
            var _y = y;
            var _struct = 
            {
                x: x,
                y: _y,
                z: z,
                hspd: hspd,
                vspd: vspd,
                zspd: zspd,
                grounded: grounded,
                dir: dir,
                facing: facing,
                jump: _jumping,
                running: running,
                state: state
            };
            
            if (!record_this_jump)
            {
                struct_set(_struct, "zspd", 0);
                struct_set(_struct, "z", undefined);
                struct_set(_struct, "grounded", true);
            }
            
            array_push(array_record, _struct);
            
            if (array_length(array_record) == record_max)
                array_shift(array_record);
        }
    }
    
    with (obj_map_player_follower)
        event_user(0);
}

if (instance_place_3d(x, y, z, obj_map_hurt))
    event_hurt();
