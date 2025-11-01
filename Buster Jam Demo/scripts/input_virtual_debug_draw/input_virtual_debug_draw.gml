function input_virtual_debug_draw()
{
    static _global = __input_global();
    
    var _i = 0;
    
    repeat (array_length(_global.__virtual_array))
    {
        _global.__virtual_array[_i].debug_draw();
        _i++;
    }
}
