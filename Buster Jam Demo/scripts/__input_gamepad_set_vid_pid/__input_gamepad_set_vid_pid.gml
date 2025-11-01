function __input_gamepad_set_vid_pid()
{
    if (1 && (__input_global().__on_desktop || false))
    {
        var _legacy = __input_string_contains(__guid, "000000000000504944564944");
        var _result = __input_gamepad_guid_parse(__guid, _legacy, false);
        __vendor = _result.vendor;
        __product = _result.product;
        __xinput = __index < 4 && gamepad_get_description(__index) == "XInput STANDARD GAMEPAD";
    }
    else
    {
        __description = gamepad_get_description(__index);
        __vendor = "";
        __product = "";
        __xinput = undefined;
    }
}
