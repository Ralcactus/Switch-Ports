for (var i = 0; room_exists(i); i++)
    global.RoomNameList[i] = room_get_name(i);

for (var i = 0; object_exists(i); i++)
    global.ObjectNameList[i] = object_get_name(i);

function scr_parseBool(arg0, arg1)
{
    var true_strings = ["1", "y", "true", "yes", "t", "+"];
    var false_strings = ["0", "n", "false", "no", "f", "-"];
    arg0 = string_lower(arg0);
    
    if (array_contains(true_strings, arg0))
    {
        return true;
    }
    else if (array_contains(false_strings, arg0))
    {
        return false;
    }
    else
    {
        show_debug_message(string("SHELL WARNING: Couldn't parse {0} as a string, using default value of {1}.", arg0, arg1));
        return arg1;
    }
}

function sh_escape(arg0_)
{
    var arg0 = scr_parseBool(string(arg0_[1]), !global.panic);
    var arg1 = arg0_[2];
    var arg2 = arg0_[3];
    global.panic = arg0;
    var minutes = real(string_digits(arg1));
    var seconds = real(string_digits(arg2));
    global.fill = ((minutes * 60) + seconds) * 60;
    obj_tv.target_fill = global.fill;
    global.wave = 0;
    global.maxwave = global.fill;
    
    if (!instance_exists(obj_panicchanger))
        instance_create(x, y, obj_panicchanger);
}

function meta_escape()
{
    return 
    {
        description: "Activates escape and sets escape time",
        arguments: ["<bool>", "<min>", "<sec>"],
        suggestions: [["true", "false"], [], []],
        argumentDescriptions: ["Escape mode", "Minutes left", "Seconds left"]
    };
}

function sh_character(arg0)
{
    var choosen_character = UnknownEnum.Value_0;
    
    switch (arg0[1])
    {
        default:
            show_debug_message(string("SHELL WARNING: [{0}] is not a valid character. Defaulting to Pizzelle.", arg0[1]));
        
        case "Pizzelle":
            choosen_character = UnknownEnum.Value_0;
            break;
        
        case "Pizzano":
            choosen_character = UnknownEnum.Value_1;
            break;
        
        case "Gumbob":
            choosen_character = UnknownEnum.Value_3;
            break;
        
        case "Coneboy":
            choosen_character = UnknownEnum.Value_4;
            break;
        
        case "Rosette":
            choosen_character = UnknownEnum.Value_2;
            break;
    }
    
    scr_player_changeCharacter(obj_parent_player, choosen_character);
}

function meta_character()
{
    return 
    {
        description: "Change the character you're currently playing as.",
        arguments: ["<character>"],
        suggestions: [["Pizzelle", "Pizzano", "Gumbob", "Rosette", "Coneboy"]],
        argumentDescriptions: ["The character to switch to."]
    };
}

function sh_toggle_collisions(arg0)
{
    var arg1 = scr_parseBool(arg0[1], !global.showcollisions);
    global.showcollisions = arg1;
    toggle_collision_function();
}

function meta_toggle_collisions()
{
    return 
    {
        description: "Toggles collision object visibility.",
        arguments: ["<bool>"],
        suggestions: [["true", "false"]],
        argumentDescriptions: ["Visibility"]
    };
}

function toggle_collision_function()
{
    if (!variable_global_exists("showcollisionarray"))
        global.showcollisionarray = [obj_solid, obj_slope, obj_slopePlatform, obj_platform, obj_sidePlatform, obj_solid_background, obj_slope_background, obj_slopePlatform_background, obj_platform_background, obj_sidePlatform_background, obj_cameraRegion, obj_cottonplatform, obj_traingo, obj_traindestroy, obj_trainTurnTrigger, obj_trainSlowDownTrigger, obj_trainSpeedUpTrigger, obj_creamThiefGoTrigger, obj_creamThiefTurnTrigger, obj_creamThiefJumpTrigger, obj_creamThiefGrabTrigger, obj_creamThiefLoseTrigger, obj_creamThiefTauntTrigger, obj_movingPlatformTrigger, obj_movingPlatform_attach, obj_secretdestroyable, obj_secretdestroyable_Point, obj_secretdestroyable_big, obj_secretdestroyable_big_hard, obj_secretdestroyable_bigPoint, obj_secretdestroyable_metal, obj_secretdestroyable_tiles2, obj_secretdestroyable_tiles3, obj_secretdestroyable_tiles4, obj_secretdestroyable_tiles5, obj_eventtrigger, obj_parent_doortrigger, obj_doorS, obj_doorA, obj_doorB, obj_doorC, obj_doorD, obj_doorE, obj_doorP, obj_grindRail, obj_grindRail_Slope, obj_minecartRail, obj_minecartRail_Slope, obj_hangRail, obj_gnomeTNTBlock, obj_casinoSlope, obj_casinoSolid];
    
    var array = global.showcollisionarray;
    var length = array_length(array);
    var i = length - 1;
    
    while (i >= 0)
    {
        with (array[i])
        {
            if (object_index == array[i])
            {
                visible = global.showcollisions;
                depth = 0;
                
                if (object_index != obj_solid && object_index != obj_slope)
                    image_alpha = 0.6;
            }
        }
        
        i--;
    }
}

function sh_showtiles(arg0)
{
    var arg1 = scr_parseBool(arg0[1], !global.showtiles);
    global.showtiles = arg1;
    show_tiles_function();
}

function meta_showtiles()
{
    return 
    {
        description: "Toggles tile layer visibility.",
        arguments: ["<bool>"],
        suggestions: [["true", "false"]],
        argumentDescriptions: ["Visibility"]
    };
}

function show_tiles_function()
{
    for (var i = 0; i < array_length(tiles_array); i++)
        layer_set_visible(tiles_array[i], global.showtiles);
}

function scr_shell_inittiles()
{
    tiles_array = [];
    var _layers = layer_get_all();
    
    for (var i = 0; i < array_length(_layers); i++)
    {
        var tile_id = layer_tilemap_get_id_fixed(_layers[i]);
        
        if (layer_exists(_layers[i]) && tile_id != -1 && layer_get_visible(_layers[i]))
            array_push(tiles_array, _layers[i]);
    }
}

function sh_toggle_debugmode(arg0)
{
    var arg1 = scr_parseBool(arg0[1], !global.DebugMode);
    global.DebugMode = arg1;
    show_debug_log(arg1);
}

function meta_toggle_debugmode()
{
    return 
    {
        description: "Toggles debug mode.",
        arguments: ["<bool>"],
        suggestions: [["true", "false"]],
        argumentDescriptions: ["Debug state"]
    };
}

function sh_room_goto(arg0)
{
    var arg1 = asset_get_index(arg0[1]);
    var arg2 = arg0[2];
    
    if (asset_get_type(arg0[1]) != 3)
    {
        return "Can't find room " + string(arg0[1]);
    }
    else
    {
        obj_parent_player.targetRoom = arg1;
        obj_parent_player.targetDoor = arg2;
        instance_create(0, 0, obj_fadeoutTransition);
    }
}

function meta_room_goto()
{
    return 
    {
        description: "Changes current room.",
        arguments: ["<room_id>", "<door>"],
        suggestions: [global.RoomNameList, ["N/A", "A", "B", "C", "D", "E", "P", "S"]],
        argumentDescriptions: ["targetRoom", "targetDoor"]
    };
}

function sh_instance_create(arg0)
{
    var _obj = asset_get_index(arg0[1]);
    
    if (_obj > -1)
        instance_create(arg0[2] ?? mouse_x, arg0[3] ?? mouse_y, _obj);
}

function meta_instance_create()
{
    return 
    {
        description: "Spawn a new object.",
        arguments: ["<object_id>", "<x>", "<y>"],
        suggestions: [global.ObjectNameList, UnknownEnum.Value_0, UnknownEnum.Value_1],
        argumentDescriptions: ["The object to spawn", "The X spawn coordinate", "The Y spawn coordinate"]
    };
}

function sh_noclip(arg0)
{
    if (obj_parent_player.state != UnknownEnum.Value_134)
        obj_parent_player.state = UnknownEnum.Value_134;
    else
        obj_parent_player.state = UnknownEnum.Value_1;
}

function meta_noclip()
{
    return 
    {
        description: "Toggle noclip.",
        arguments: [],
        suggestions: [],
        argumentDescriptions: []
    };
}

function sh_fuckyou(arg0)
{
    event_play_oneshot("event:/SFX/ui/fuckyou");
}

function meta_fuckyou()
{
    return 
    {
        description: "fuck you",
        arguments: [],
        suggestions: [],
        argumentDescriptions: [],
        hidden: true,
        deferred: false
    };
}

function sh_give_all(arg0)
{
    var confecti_objs = [obj_confectimallow, obj_confectichoco, obj_confecticrack, obj_confectiworm, obj_confecticandy];
    
    for (var i = 0; i < array_length(confecti_objs); i++)
        instance_create(x, y, confecti_objs[i]);
    
    global.Treasure = true;
    global.secretfound = 3;
    global.Collect = global.srank;
}

function meta_give_all()
{
    return 
    {
        description: "Gives you all 5 confecti, 3 secrets, secret treasure, and S rank score.",
        arguments: [],
        suggestions: [],
        argumentDescriptions: []
    };
}

function sh_setlap(arg0)
{
    global.lapcount = real(string_digits(arg0[1]));
}

function meta_setlap()
{
    return 
    {
        description: "Set lap",
        arguments: ["<lapcount>"],
        suggestions: [],
        argumentDescriptions: []
    };
}
