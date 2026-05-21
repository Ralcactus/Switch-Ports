#region Roomnames
for (var i = 0; room_exists(i); i++)
    global.roomlist[i] = room_get_name(i);
#endregion

///////////////

#region Escape
function sh_escape(args)
{
    var arg0 = string(args[1]);
    var arg1 = args[2];
    var arg2 = args[3];
    
    switch (arg0)
    {
        case "true":
        case "1":
            arg0 = true;
            break;
        
        case "false":
        case "0":
            arg0 = false;
            break;
        
        default:
            arg0 = !global.panic;
            break;
    }
    
    global.panic = arg0;
    var _minutes = real(string_digits(arg1));
    var _seconds = real(string_digits(arg2));
    global.fill = ((_minutes * 60) + _seconds) * 60;
    global.wave = 0;
    global.maxwave = global.fill;
    
    if (!instance_exists(obj_panicchanger))
        instance_create(x, y, obj_panicchanger);
}

function meta_escape()
{
    return 
    {
        description: "activates escape and sets escape time",
        arguments: ["<bool>", "<min>", "<sec>"],
        suggestions: [["true", "false"], [], []],
        argumentDescriptions: ["activate/deactivate escape", "set minutes", "set seconds"]
    };
}
#endregion

#region Toggle Collisions
function sh_toggle_collisions(args)
{
    var arg1 = args[1];
    
    switch (arg1)
    {
        case "true":
        case "1":
            arg1 = true;
            break;
        
        case "false":
        case "0":
            arg1 = false;
            break;
        
        default:
            arg1 = !global.showcollisions;
            break;
    }
    
    global.showcollisions = arg1;
    toggle_collision_function();
}

function meta_toggle_collisions()
{
    return 
    {
        description: "toggles collision object visibility",
        arguments: ["<bool>"],
        suggestions: [["true", "false"]],
        argumentDescriptions: ["toggles visibility"]
    };
}

function toggle_collision_function()
{
    if (!variable_global_exists("showcollisionarray"))
    {
        i = 0;
        global.showcollisionarray[i++] = obj_solid;
        global.showcollisionarray[i++] = obj_cameraRegion;
        global.showcollisionarray[i++] = obj_slope;
        global.showcollisionarray[i++] = obj_slopePlatform;
        global.showcollisionarray[i++] = obj_platform;
        global.showcollisionarray[i++] = obj_sidePlatform;
        global.showcollisionarray[i++] = obj_cottonplatform;
        global.showcollisionarray[i++] = obj_traingo;
        global.showcollisionarray[i++] = obj_traindestroy;
        global.showcollisionarray[i++] = obj_trainTurnTrigger;
        global.showcollisionarray[i++] = obj_trainSlowDownTrigger;
        global.showcollisionarray[i++] = obj_trainSpeedUpTrigger;
        global.showcollisionarray[i++] = obj_movingPlatformTrigger;
        global.showcollisionarray[i++] = obj_movingPlatform_attach;
        global.showcollisionarray[i++] = obj_secretdestroyable;
        global.showcollisionarray[i++] = obj_secretdestroyable_Point;
        global.showcollisionarray[i++] = obj_secretdestroyable_big;
        global.showcollisionarray[i++] = obj_secretdestroyable_bigPoint;
        global.showcollisionarray[i++] = obj_secretdestroyable_metal;
        global.showcollisionarray[i++] = obj_secretdestroyable_tiles2;
        global.showcollisionarray[i++] = obj_secretdestroyable_tiles3;
        global.showcollisionarray[i++] = obj_secretdestroyable_tiles4;
        global.showcollisionarray[i++] = obj_secretdestroyable_tiles5;
        global.showcollisionarray[i++] = obj_eventtrigger;
        global.showcollisionarray[i++] = obj_doortrigger_parent;
        global.showcollisionarray[i++] = obj_doorS;
        global.showcollisionarray[i++] = obj_doorA;
        global.showcollisionarray[i++] = obj_doorB;
        global.showcollisionarray[i++] = obj_doorC;
        global.showcollisionarray[i++] = obj_doorD;
        global.showcollisionarray[i++] = obj_doorE;
        global.showcollisionarray[i++] = obj_doorP;
        global.showcollisionarray[i++] = obj_grindRail;
        global.showcollisionarray[i++] = obj_grindRail_Slope;
        global.showcollisionarray[i++] = obj_minecartRail;
        global.showcollisionarray[i++] = obj_minecartRail_Slope;
    }
    
    var array = global.showcollisionarray;
    var length = array_length(array);
	//Start from the end to the start (more optimized)
    
    for (var i = length - 1; i >= 0; i--)
    {
        with (array[i])
        {
            if (object_index == array[i])
            {
                visible = global.showcollisions;
                
                if (object_index != obj_solid && object_index != obj_slope)
                    image_alpha = 0.6;
            }
        }
    }
}
#endregion

#region Debug Mode
function sh_toggle_debugmode(args)
{
    var arg1 = args[1];
    
    switch (arg1)
    {
        case "true":
        case "1":
            arg1 = true;
            break;
        
        case "false":
        case "0":
            arg1 = false;
            break;
        
        default:
            arg1 = !global.debugmode;
            break;
    }
    
    global.debugmode = arg1;
}

function meta_toggle_debugmode()
{
    return 
    {
        description: "toggles debugmode",
        arguments: ["<bool>"],
        suggestions: [["true", "false"]],
        argumentDescriptions: ["toggles debugmode"]
    };
}
#endregion

#region Room Goto
function sh_room_goto(args)
{
    var arg1 = asset_get_index(args[1]);
    var arg2 = args[2];
    //Error Check 
    if (asset_get_type(args[1]) != 3)
        return "Can't find room " + string(args[1]);//Shamelessy took this from Ethgaming
    //Go to Room
    if (asset_get_type(args[1]) == 3)
    {
        obj_player.targetRoom = arg1;
        obj_player.targetDoor = arg2;
        instance_create(0, 0, obj_fadeout);
    }
}

function meta_room_goto()
{
    return 
    {
        description: "allows you to go to another room",
        arguments: ["<room>", "<door>"],
        suggestions: [global.roomlist, ["N/A", "A", "B", "C", "D", "E", "P", "S"]],
        argumentDescriptions: ["sets targetRoom", "sets targetDoor"]
    };
}
#endregion

#region Instance_Create
function sh_instance_create(args)
{
    instance_create(args[1], args[2], asset_get_index(args[3]));
}

function meta_instance_create()
{
    return 
    {
        description: "create an object",
        arguments: ["<x>", "<y>", "<object>"],
        suggestions: [mouseArgumentType.worldX, mouseArgumentType.worldY, []],
        argumentDescriptions: ["the X coordinate to create the object at", "the Y coordinate to create the object at", "the object to create"]
    };
}
#endregion

#region Noclip
function sh_noclip(args)
{
    if (obj_player.state != states.noclip)
        obj_player.state = states.noclip;
    else
        obj_player.state = states.normal;
}

function meta_noclip()
{
    return 
    {
        description: "toggle noclip",
        arguments: [],
        suggestions: [],
        argumentDescriptions: []
    };
}
#endregion

#region Fuck You
function sh_fuckyou(args)
{
    audio_stop_sound(sound_youfuckindick);
    audio_stop_sound(sound_BITCH);
    scr_sound(sound_youfuckindick, sound_BITCH);
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
#endregion

#region Give All
function sh_give_all(args)
{
    for (var numb = 1; numb < 6; numb++)
    {
        var spawn;
        
        switch (numb)
        {
            case 1:
                spawn = obj_confectimallow;
                break;
            
            case 2:
                spawn = obj_confectichoco;
                break;
            
            case 3:
                spawn = obj_confecticrack;
                break;
            
            case 4:
                spawn = obj_confectiworm;
                break;
            
            case 5:
                spawn = obj_confecticandy;
                break;
            
            default:
                break;
        }
        
        instance_create(x, y, spawn);
    }
    
    global.treasure = 1;
    global.secretfound = 3;
    global.collect = global.srank;
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
#endregion