depth_pos = -bbox_bottom;
grounded = instance_place_3d(x, y, z + 1, obj_solid);

if (auto != -4)
{
    var _hspd = x - xprevious;
    var _vspd = y - yprevious;
    
    if (grounded)
    {
        if (_hspd == 0 && _vspd == 0)
            anim_play(anim_idle);
        else
            anim_play(anim_walk);
    }
    else if (anim_sprite != anim_jump && anim_sprite != anim_jump_hold)
    {
        anim_play(anim_jump);
    }
    
    if (_hspd > 0)
        facing = 1;
    
    if (_hspd < 0)
        facing = -1;
}
