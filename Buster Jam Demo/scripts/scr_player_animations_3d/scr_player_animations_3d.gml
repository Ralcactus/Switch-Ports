function scr_player_animations_3d()
{
    if (vspd < 0)
        dir_ind = 1;
    
    if (vspd > 0 || (hspd != 0 && vspd == 0))
        dir_ind = 0;
    
    var _idle = anim_idle;
    var _idle_boil = anim_idle_boil;
    var _walk = anim_walk;
    var _jump = anim_jump;
    var _jump_hold = anim_jump_hold;
    var _climb = anim_climb;
    var _grounded = instance_place_3d(x, y, z + 1, obj_solid);
    
    if (state == state_free)
    {
        anim_speed = 1;
        
        if (action == action_spin)
        {
            anim_play(anim_spin);
        }
        else if (!_grounded)
        {
            if (anim_sprite != _jump && anim_sprite != _jump_hold)
                anim_play(_jump);
        }
        else if (hspd == 0 && vspd == 0)
        {
            if (anim_sprite != _idle && anim_sprite != _idle_boil)
            {
                anim_play(_idle_boil);
                
                if (object_index == obj_map_player_follower)
                    anim_index = 3;
                else
                    anim_index = 1;
            }
        }
        else
        {
            anim_play(_walk);
        }
    }
    else if (state == state_climb)
    {
        if (z == zprevious)
            anim_speed = 0;
        else
            anim_speed = 1;
        
        anim_play(_climb);
    }
}
