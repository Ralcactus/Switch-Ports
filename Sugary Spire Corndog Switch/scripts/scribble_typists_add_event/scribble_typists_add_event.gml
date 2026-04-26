function scribble_typists_add_event(arg0, arg1)
{
    if (!variable_global_exists("__scribble_typewriter_events"))
        global.__scribble_typewriter_events = ds_map_create();
    
    if (!is_string(arg0))
    {
        __scribble_error("Event names should be strings.\n(Input to script was \"", arg0, "\")");
        exit;
    }
    
    if (!is_method(arg1))
    {
        if (is_real(arg1))
        {
            if (!script_exists(arg1))
            {
                __scribble_error("Script with asset index ", arg1, " doesn't exist\n ", false);
                exit;
            }
        }
        else
        {
            __scribble_error("Invalid function provided\n(Input datatype was \"", typeof(arg1), "\")");
            exit;
        }
    }
    
    if (ds_map_exists(global.__scribble_colours, arg0))
    {
        __scribble_trace("Warning! Event name \"" + arg0 + "\" has already been defined as a colour");
        exit;
    }
    
    if (ds_map_exists(global.__scribble_effects, arg0))
    {
        __scribble_trace("Warning! Event name \"" + arg0 + "\" has already been defined as an effect");
        exit;
    }
    
    var _old_function = ds_map_find_value(global.__scribble_typewriter_events, arg0);
    
    if (!is_undefined(_old_function))
    {
        if (is_numeric(_old_function) && _old_function < 0)
            __scribble_trace("Warning! Overwriting event [" + arg0 + "] tied to <invalid script>");
        else
            __scribble_trace("Warning! Overwriting event [" + arg0 + "] tied to \"" + (is_method(_old_function) ? string(_old_function) : script_get_name(_old_function)) + "\"");
    }
    
    ds_map_set(global.__scribble_typewriter_events, arg0, arg1);
}
