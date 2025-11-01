function input_virtual_destroy_all()
{
    static _global = __input_global();
    
    var _i = 0;
    
    repeat (array_length(_global.__virtual_array))
    {
        with (_global.__virtual_array[_i])
        {
            if (!__background)
                destroy();
        }
        
        _i++;
    }
}
