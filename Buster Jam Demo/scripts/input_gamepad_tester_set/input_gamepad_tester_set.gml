function input_gamepad_tester_set(arg0)
{
    static _global = __input_global();
    
    if (_global.__allow_gamepad_tester)
    {
        if (_global.__gamepad_tester_data.__enabled != arg0)
        {
            if (arg0)
            {
                __input_gamepad_tester_build_gui();
                _global.__gamepad_tester_data.__enabled = true;
            }
            else
            {
                __input_gamepad_tester_destroy_gui();
                _global.__gamepad_tester_data.__enabled = false;
            }
        }
    }
    else
    {
        __input_error("Gamepad tester not available on GameMaker versions before 2023.8");
    }
}
