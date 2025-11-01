function scr_player_load_sprites(arg0 = global.char)
{
    dir_ind = 0;
    
    if (arg0 == 0)
    {
        anim_idle = spr_map_buster_idle;
        anim_idle_boil = spr_map_buster_idle_boil;
        anim_walk = spr_map_buster_walk;
        anim_jump = spr_map_buster_jump;
        anim_jump_hold = spr_map_buster_jump_hold;
        anim_spin = spr_map_buster_spin;
        anim_climb = spr_map_buster_climb;
    }
    else if (arg0 == 1)
    {
        anim_idle = spr_map_bridget_idle;
        anim_idle_boil = spr_map_bridget_idle_boil;
        anim_walk = spr_map_bridget_walk;
        anim_jump = spr_map_bridget_jump;
        anim_jump_hold = spr_map_bridget_jump_hold;
        anim_spin = spr_map_bridget_spin;
        anim_climb = spr_map_bridget_climb;
    }
    
    if (object_index == obj_map_actor)
        anim_idle = anim_idle_boil;
    
    event_animend = function()
    {
        var _spr = anim_sprite;
        
        if (_spr == anim_jump)
            anim_play(anim_jump_hold);
        else if (_spr == anim_idle_boil)
            anim_play(anim_idle);
        else if (_spr == anim_idle)
            anim_play(anim_idle_boil);
    };
}
