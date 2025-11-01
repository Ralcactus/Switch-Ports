function scr_frenzy_freeze()
{
    if (instance_exists(obj_map_frenzy_controller) && obj_map_frenzy_controller.game_in)
        return true;
    
    return false;
}
