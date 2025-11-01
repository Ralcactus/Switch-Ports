function __input_define_gamepad_types()
{
    static _global = __input_global();
    
    _global.__simple_type_lookup = {};
    
    with (_global.__simple_type_lookup)
    {
        XBoxOneController = "xbox one";
        CommunityXBoxOne = "xbox one";
        SteamControllerNeptune = "xbox one";
        CommunitySteamDeck = "xbox one";
        CommunityLuna = "xbox one";
        CommunityStadia = "xbox one";
        AppleController = "xbox one";
        XBox360Controller = "xbox 360";
        CommunityXBox360 = "xbox 360";
        CommunityDreamcast = "xbox 360";
        SteamController = "xbox 360";
        MobileTouch = "xbox 360";
        CommunityLikeXBox = "xbox one";
        PS5Controller = "ps5";
        CommunityPS5 = "ps5";
        PS4Controller = "ps4";
        XInputPS4Controller = "ps4";
        CommunityPS4 = "ps4";
        PS3Controller = "psx";
        CommunityPSX = "psx";
        SwitchHandheld = "switch";
        SwitchJoyConPair = "switch";
        SwitchProController = "switch";
        XInputSwitchController = "switch";
        SwitchInputOnlyController = "switch";
        CommunityLikeSwitch = "switch";
        Community8BitDo = "switch";
        HIDWiiClassic = "switch";
        CommunitySNES = "switch";
        CommunitySuperFamicom = "switch";
        SwitchJoyConLeft = "switch joycon left";
        SwitchJoyConSingle = "switch joycon left";
        HIDJoyConLeft = "switch joycon left";
        SwitchJoyConRight = "switch joycon right";
        HIDJoyConRight = "switch joycon right";
        CommunityGameCube = "gamecube";
        Unknown = "unknown";
        unknown = "unknown";
        SteamControllerV2 = "unknown";
        UnknownNonSteamController = "unknown";
        CommunityUnknown = "unknown";
        CommunitySteam = "unknown";
    }
}
