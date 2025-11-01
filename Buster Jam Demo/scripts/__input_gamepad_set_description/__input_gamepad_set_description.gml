function __input_gamepad_set_description()
{
    if (__xinput || false)
    {
        __description = "XInput";
    }
    else if (!(1 && (__input_global().__on_desktop || false)))
    {
        __input_trace("SDL2 remapping unsupported for this platform");
        __description = gamepad_get_description(__index);
    }
    else
    {
    }
}
