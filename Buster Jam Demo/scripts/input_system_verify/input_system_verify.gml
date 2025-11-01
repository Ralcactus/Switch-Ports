function input_system_verify(arg0, arg1 = false)
{
    var _backup = input_system_export(false);
    var _error = undefined;
    
    try
    {
        input_system_import(arg0);
    }
    catch (_error)
    {
        __input_trace("input_system_verify() failed with the following error: ", _error);
    }
    
    input_system_import(_backup);
    
    if (arg1)
        return _error;
    else
        return _error == undefined;
}
