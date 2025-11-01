function input_mouse_x(arg0 = undefined)
{
    static _global = __input_global();
    
    return _global.__pointer_x[arg0 ?? _global.__pointer_coord_space];
}
