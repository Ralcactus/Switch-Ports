function input_icons_gamepad(arg0)
{
    static _global = __input_global();
    
    if (arg0 == "not a binding")
        __input_error("Please use input_icon_not_a_binding() to define \"not a binding\" fallback icon");
    
    if (arg0 == "empty")
        __input_error("Please use input_icon_empty() to define empty binding fallback icon");
    
    if (arg0 == "keyboard")
        __input_error("Please use input_icons_keyboard() to define keyboard icons");
    
    var _icon_holder = variable_struct_get(_global.__icons, arg0);
    
    if (!is_struct(_icon_holder))
    {
        _icon_holder = new __input_class_icon_category(arg0);
        variable_struct_set(_global.__icons, string(arg0), _icon_holder);
    }
    
    return _icon_holder;
}
