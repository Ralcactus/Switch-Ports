function trace()
{
    var _str = "";
    
    for (var i = 0; i < argument_count; i++)
        _str += string(argument[i]);
    
    show_debug_message(_str);
}

function in_debug_mode()
{
    return instance_exists(obj_debugmenu);
}

function in_debug_menu()
{
    return in_debug_mode() && obj_debugmenu.open;
}
