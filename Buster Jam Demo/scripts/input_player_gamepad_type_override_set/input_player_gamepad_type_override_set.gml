function input_player_gamepad_type_override_set(arg0, arg1 = 0)
{
    static _global = __input_global();
    
    if (arg1 < 0)
    {
        __input_error("Invalid player index provided (", arg1, ")");
        return undefined;
    }
    
    if (arg1 >= 2)
    {
        __input_error("Player index too large (", arg1, " must be less than ", 2, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    if (arg0 != undefined && arg0 != "xbox one" && arg0 != "xbox 360" && arg0 != "ps5" && arg0 != "ps4" && arg0 != "psx" && arg0 != "switch" && arg0 != "switch joycon left" && arg0 != "switch joycon right" && arg0 != "gamecube")
        __input_error("Gamepad type \"", arg0, "\" not supported");
    
    _global.__players[arg1].__gamepad_type_override = arg0;
}
