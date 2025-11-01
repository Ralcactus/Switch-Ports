function input_icon_touch(arg0)
{
    static _global = __input_global();
    
    var _name = "virtual button";
    var _icon_holder = variable_struct_get(_global.__icons, _name);
    
    if (!is_struct(_icon_holder))
    {
        _icon_holder = new __input_class_icon_category(_name);
        variable_struct_set(_global.__icons, string(_name), _icon_holder);
    }
    
    _icon_holder.add(-3, arg0);
    return _icon_holder;
}
