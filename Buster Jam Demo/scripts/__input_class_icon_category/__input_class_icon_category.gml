function __input_class_icon_category(arg0) constructor
{
    static add = function(arg0, arg1)
    {
        static _a = __input_binding_get_label("gamepad button", 32769, false);
        static _b = __input_binding_get_label("gamepad button", 32770, false);
        
        if (__swap_ab)
        {
            if (arg0 == _a)
                arg0 = _b;
            else if (arg0 == _b)
                arg0 = _a;
        }
        
        variable_struct_set(__dictionary, arg0, arg1);
        return self;
    };
    
    __name = arg0;
    __dictionary = {};
    __swap_ab = __input_gamepad_type_swap_ab(arg0);
}
