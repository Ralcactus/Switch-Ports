function input_icons_keyboard_and_mouse()
{
    static _global = __input_global();
    
    var _name = "keyboard and mouse";
    var _icon_holder = variable_struct_get(_global.__icons, _name);
    
    if (!is_struct(_icon_holder))
    {
        _icon_holder = new __input_class_icon_category(_name);
        variable_struct_set(_global.__icons, string(_name), _icon_holder);
    }
    
    return _icon_holder;
}
