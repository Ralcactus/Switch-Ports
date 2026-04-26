function set_resolution_option(arg0)
{
    window_set_size(global.resolutions[arg0][0], global.resolutions[arg0][1]);
    window_center();
}

function create_option_menu(arg0, arg1, arg2, arg3 = camera_get_view_width(view_camera[0]) / 2, arg4 = 150, arg5 = 25)
{
    var q = 
    {
        centered: arg0,
        backto: arg1,
        options: arg2,
        xpad: arg3,
        ypad: arg4,
        textpad: arg5
    };
    return q;
}

function create_option_toggle(arg0, arg1, arg2, arg3)
{
    var q = 
    {
        name: arg1,
        desc: arg2,
        type: UnknownEnum.Value_0,
        alpha: 1,
        func: arg3,
        value: 0
    };
    array_push(arg0, q);
    return q;
}

function create_option_press(arg0, arg1, arg2, arg3)
{
    var q = 
    {
        name: arg1,
        desc: arg2,
        type: UnknownEnum.Value_3,
        alpha: 1,
        func: arg3,
        value: 0
    };
    array_push(arg0, q);
    return q;
}

function create_option_multichoice(arg0, arg1, arg2, arg3, arg4)
{
    var q = 
    {
        name: arg1,
        desc: arg2,
        type: UnknownEnum.Value_2,
        alpha: 1,
        choices: arg3,
        func: arg4,
        value: 0
    };
    array_push(arg0, q);
    return q;
}

function create_option_slider(arg0, arg1, arg2, arg3, arg4, arg5 = undefined)
{
    var q = 
    {
        name: arg1,
        desc: arg2,
        type: UnknownEnum.Value_1,
        alpha: 1,
        on_move: arg3,
        on_stop: arg4,
        value: 0,
        moving: false,
        sound: undefined
    };
    
    if (!is_undefined(arg5))
        q.sound = fmod_createEventInstance(arg5);
    
    array_push(arg0, q);
    return q;
}

function goto_menu(arg0)
{
    selectedmenu = arg0;
    optionselected = 0;
    textScroll = -9999;
    pgHeight = 0;
    showdesc = false;
}

function draw_option(arg0, arg1, arg2, arg3)
{
    draw_set_color(c_white);
    
    if (!arg3)
        draw_set_color(#666666);
    
    draw_text(arg0, arg1, arg2);
    draw_set_color(c_white);
}

function init_option()
{
    ini_open("optionData.ini");
    global.fullscreen = ini_read_real("Settings", "fullscrn", 0);
    global.selectedResolution = ini_read_real("Settings", "resolution", 1);
    global.smoothcam = false;
    global.hitstunEnabled = ini_read_real("Settings", "hitstun", 1);
    global.screentilt = false;
    global.playerrotate = ini_read_real("Settings", "playrot", 1);
    global.screenmelt = false;
    global.tvmessages = ini_read_real("Settings", "tvmsg", 1);
    global.lowperformance = ini_read_real("Settings", "lowperf", 0);
    global.smoothscale = ini_read_real("Settings", "smoothscale", 1);
    global.unfocusedMute = ini_read_real("Settings", "unfocusmute", 1);
    global.toggleTimer = ini_read_real("Settings", "timer", 1);
    global.controllerVibration = ini_read_real("Settings", "vibration", 1);
    global.musicVolume = ini_read_real("Settings", "musicvol", 0.6);
    global.dialogueVolume = ini_read_real("Settings", "dialoguevol", 1);
    global.soundVolume = ini_read_real("Settings", "soundvol", 1);
    global.masterVolume = ini_read_real("Settings", "mastervol", 1);
    ini_close();
}

function quick_write_option(arg0, arg1, arg2)
{
    ini_open("optionData.ini");
    
    if (is_string(arg2))
        ini_write_string(arg0, arg1, arg2);
    else
        ini_write_real(arg0, arg1, arg2);
    
    ini_close();
}
