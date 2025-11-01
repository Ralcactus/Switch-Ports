function input_check_opposing_repeat(arg0, arg1, arg2 = 0, arg3 = false, arg4 = 10, arg5 = 30)
{
    static _global = __input_global();
    
    var _held_n = input_check(arg0, arg2);
    var _held_p = input_check(arg1, arg2);
    
    if (!_held_n && !_held_p)
        return 0;
    
    if (_held_n && _held_p && !arg3)
        return 0;
    
    var _repeat_n = input_check_repeat(arg0, arg2, arg4, arg5);
    var _repeat_p = input_check_repeat(arg1, arg2, arg4, arg5);
    
    if (!_repeat_n && !_repeat_p)
        return 0;
    
    if (!_held_p)
        return (_repeat_n && !input_check(arg1, arg2, arg4 + arg5)) ? -1 : 0;
    
    if (!_held_n)
        return (_repeat_p && !input_check(arg0, arg2, arg4 + arg5)) ? 1 : 0;
    
    var _player_verbs_struct = _global.__players[arg2].__verb_state_dict;
    var _verb_struct_n = variable_struct_get(_player_verbs_struct, arg0);
    var _verb_struct_p = variable_struct_get(_player_verbs_struct, arg1);
    
    if (_verb_struct_n.__press_time > _verb_struct_p.__press_time)
        return (_repeat_n && !input_check_pressed(arg1, arg2, arg4 + arg5)) ? -1 : 0;
    else
        return (_repeat_p && !input_check_pressed(arg1, arg2, arg4 + arg5)) ? 1 : 0;
    
    __input_error("Repeat opposing check unhandled");
}
