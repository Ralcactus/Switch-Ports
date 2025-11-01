function input_source_mode_set(arg0)
{
    static _global = __input_global();
    
    if (arg0 != _global.__source_mode)
    {
        _global.__previous_source_mode = _global.__source_mode;
        
        switch (arg0)
        {
            case (0 << 0):
                break;
            
            case (1 << 0):
                __input_trace("Storing previous source mode (", _global.__previous_source_mode, ")");
                break;
            
            case (2 << 0):
                var _i = 1;
                
                repeat (1)
                {
                    input_source_clear(_i);
                    _i++;
                }
                
                break;
            
            case (3 << 0):
            case (4 << 0):
                input_source_set(-3, 0, false);
                break;
        }
    }
    
    _global.__source_mode = arg0;
}
