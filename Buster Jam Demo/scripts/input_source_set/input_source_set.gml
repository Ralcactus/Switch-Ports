function input_source_set(arg0, arg1 = 0, arg2 = true, arg3 = true)
{
    static _global = __input_global();
    
    if (arg1 < 0)
    {
        __input_error("Invalid player index provided (", arg1, ")");
        return undefined;
    }
    
    if (arg1 >= 2)
    {
        __input_error("Player index too large (", arg1, " must be less than ", 2, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    if (arg0 == -3)
    {
        if (arg3)
            input_source_clear(-3);
        
        with (_global.__players[arg1])
        {
            if (_global.__keyboard_allowed)
                __source_add(__input_global().__source_keyboard);
            
            if (_global.__mouse_allowed)
                __source_add(__input_global().__source_mouse);
            
            if (_global.__touch_allowed)
                __source_add(__input_global().__source_touch);
            
            if (_global.__gamepad_allowed)
            {
                var _i = 0;
                
                repeat (array_length(__input_global().__source_gamepad))
                {
                    __source_add(__input_global().__source_gamepad[_i]);
                    _i++;
                }
            }
            
            if (arg2)
                __profile_set_auto();
        }
        
        exit;
    }
    
    if (_global.__use_is_instanceof)
    {
        if (!is_instanceof(arg0, __input_class_source))
        {
            if (arg0 == __input_global().__source_gamepad)
                __input_error("Cannot use INPUT_GAMEPAD for a source\nPlease use a specific gamepad e.g. INPUT_GAMEPAD[1]");
            else
                __input_error("Invalid source provided (", arg0, ")");
        }
    }
    else if (instanceof(arg0) != "__input_class_source")
    {
        if (arg0 == __input_global().__source_gamepad)
            __input_error("Cannot use INPUT_GAMEPAD for a source\nPlease use a specific gamepad e.g. INPUT_GAMEPAD[1]");
        else
            __input_error("Invalid source provided (", arg0, ")");
    }
    
    if (arg0 == __input_global().__source_keyboard)
    {
        if (!_global.__any_keyboard_binding_defined && !_global.__any_mouse_binding_defined)
            __input_error("Cannot claim ", arg0, ", no keyboard or mouse bindings have been created in a default profile (see __input_config_verbs())");
    }
    else if (arg0 == __input_global().__source_mouse)
    {
        if (!_global.__any_mouse_binding_defined)
            __input_error("Cannot claim ", arg0, ", no mouse bindings have been created in a default profile (see __input_config_verbs())");
    }
    else if (arg0.__source == (2 << 0))
    {
        if (!_global.__any_gamepad_binding_defined)
            __input_error("Cannot claim ", arg0, ", no gamepad bindings have been created in a default profile (see __input_config_verbs())");
    }
    
    if (arg3)
        __input_source_relinquish(arg0);
    
    with (_global.__players[arg1])
    {
        __sources_clear();
        __source_add(arg0);
        
        if (arg2)
            __profile_set_auto();
    }
}
