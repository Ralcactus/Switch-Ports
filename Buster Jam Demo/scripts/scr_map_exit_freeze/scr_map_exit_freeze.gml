function scr_map_exit_freeze(arg0 = id)
{
    var _manual_freeze;
    
    if (global.map_freeze && !array_contains(global.map_freeze_ignore, arg0))
        _manual_freeze = true;
    else
        _manual_freeze = false;
    
    if (instance_exists(obj_map_frenzy_controller) && obj_map_frenzy_controller.game_in)
        return true;
    
    if (_manual_freeze)
        return true;
    
    return false;
}
