global.gamePaused = false;
pausemenu = false;
savedmusicpause = false;
manual = false;
selected = 0;
depth = -13000;
image_speed = 0.175;
pause_portraitX = -get_game_width();
pause_portraitY = get_game_height();
pause_pizzascoreX = get_game_width() * 2;
pause_pizzascoreY = get_game_height();
pausealpha = 0;
cursorx = 544;
cursory = 160;
global.noControlType = false;
wasusinggamepad = false;
detectedx = -196;
detected = false;
previnput = "keyboard_and_mouse";

if (gamepad_is_connected(0))
{
    previnput = "gamepad";
    wasusinggamepad = true;
    input_profile_set("gamepad");
}
else
{
    previnput = "keyboard_and_mouse";
    wasusinggamepad = false;
    input_profile_set("keyboard_and_mouse");
}

nocontrollerind = 0;

#region Pause Option Funcs
function resume_func()
{
    global.gamePaused = false;
    
    with (obj_music)
    {
        event_stop(global.pausemusic, true);
        
        if (global.music != noone)
        {
            if (global.music.event != noone)
                fmod_studio_event_instance_set_paused(global.music.event, other.savedmusicpause);
        }
    }
    
    event_pause_all(false);
    input_verb_consume(["jump", "attack", "down"]);
}

function restart_func()
{
    stop_music();
    resume_func();
    room_goto(obj_player.firstroom);
    player_reset();
}

function options_func()
{
    instance_create_depth(x, y, -13000, obj_optionsmenu);
}

function exit_func()
{
    stop_music();
    resume_func();
    player_reset();
    room_goto(Titlescreen);
    obj_player.state = states.actor;
}

function manual_func()
{
    instance_create_depth(x, y, -13000, obj_manual);
}
#endregion

// Add Options
var i = 0;
options[i++] = [0, resume_func];
options[i++] = [1, restart_func];
options[i++] = [2, options_func];
options[i++] = [3, exit_func];
