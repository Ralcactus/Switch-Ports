function __input_restart()
{
    static _global = __input_global();
    
    _global.__restart_time = _global.__current_time;
    __input_clear_all();
    __input_gamepad_stop_trigger_effects(-3);
}
