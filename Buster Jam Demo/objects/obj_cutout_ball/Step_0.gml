with (obj_map_player)
{
    var _before = mask_index;
    mask_index = spr_player_mask_3d_spin;
    
    if (instance_place_3d(x, y, z, other) && coyote_spin)
    {
        with (other)
            event_break();
    }
    
    mask_index = _before;
}

anim_logic();
