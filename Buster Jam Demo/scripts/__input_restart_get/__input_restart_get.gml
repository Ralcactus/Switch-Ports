function __input_restart_get()
{
    static _global = __input_global();
    
    return _global.__restart_time == _global.__current_time;
}
