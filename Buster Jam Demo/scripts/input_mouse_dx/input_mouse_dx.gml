function input_mouse_dx(arg0 = undefined)
{
    static _global = __input_global();
    
    return _global.__pointer_dx[arg0 ?? _global.__pointer_coord_space];
}
