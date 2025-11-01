function __input_gamepad_guid_parse(arg0, arg1, arg2)
{
    var _vendor = "";
    var _product = "";
    var _description = "";
    
    if (arg0 == "00000000000000000000000000000000")
    {
        if (1 && !arg2)
            __input_trace("Warning! GUID was empty");
        
        return 
        {
            vendor: "",
            product: "",
            description: ""
        };
    }
    
    if (arg1)
    {
        _vendor = string_copy(arg0, 1, 4);
        _product = string_copy(arg0, 5, 4);
    }
    else if (string_copy(arg0, 13, 4) != "0000" && true)
    {
        _description = string_copy(arg0, 1, 20);
    }
    else
    {
        if (string_copy(arg0, 21, 4) != "0000")
        {
            if (1 && !arg2)
                __input_trace("Warning! GUID \"", arg0, "\" does not fit expected pattern. VID+PID cannot be extracted");
            
            return 
            {
                vendor: "",
                product: "",
                description: ""
            };
        }
        
        if (string_copy(arg0, 1, 4) != "0300" && string_copy(arg0, 1, 4) != "0500")
        {
            if (1 && !arg2)
                __input_trace("Warning! GUID \"", arg0, "\" driver ID does not match expected (Found ", string_copy(arg0, 1, 4), ", expect either 0300 or 0500)");
        }
        
        _vendor = string_copy(arg0, 9, 4);
        _product = string_copy(arg0, 17, 4);
    }
    
    return 
    {
        vendor: _vendor,
        product: _product,
        description: _description
    };
}
