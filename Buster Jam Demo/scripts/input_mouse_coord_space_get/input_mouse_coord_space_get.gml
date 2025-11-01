function input_mouse_coord_space_get()
{
    static _global = __input_global();
    
    return _global.__pointer_coord_space;
}
