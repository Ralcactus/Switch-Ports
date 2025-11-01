testvariablenothing = false;
global.hp_spr = spr_trans_hp_boss_blackbg;
global.hp_spr_lose = spr_trans_hp_boss_lost;

if (!audio_is_playing(global.bgm_play))
    global.bgm_play = audio_play_sound(bgm_subwayboss_macro, 0, true);

side_offset = 96;
side = -1;
side_move = side * side_offset;
zoom = 1;
shake = 0;
zoom_game = 1.05;
shake_dec = 0.1;
intro = true;
intro_zoomout = false;
alarm[0] = 1;
intro_zoom_percent = 0;
intro_zoom = 0.925;
boss_pan_down = false;
percent_boss_intro = 0;
macro_win = false;
timer[1] = -1;

timer_func[1] = function()
{
    intro_zoomout = true;
};

global.frenzy_name = "boss_knives";

event_zoom = function()
{
    zoom = 0.95;
};

global.microgame_hspd = -19;

event_spawn = function(arg0, arg1, arg2)
{
    var _x = 1920;
    var _y = 256;
    var _yoff = 0;
    
    switch (arg0)
    {
        case obj_macro_knives_block:
            _x = 2320;
            _y = 256;
            _yoff = 800;
            break;
        
        case obj_macro_knives_bom:
            _x = 2270;
            _y = 256;
            _yoff = 730;
            break;
        
        case obj_macro_knives_ninjastar:
            _x = 2270;
            _y = 256;
            _yoff = 730;
            break;
        
        case obj_macro_knives_sword:
            _x = 2020;
            _y = 350;
            _yoff = 580;
            break;
    }
    
    if (arg1 == 1)
        _y += _yoff;
    
    var _inst = instance_create_layer(_x, _y, "Instances", arg0);
    _inst.side = arg1;
    return _inst;
};

event_snake = function()
{
    var _inst = instance_create_layer(2320, 0, "Snake", obj_macro_knives_snake);
};

timer[0] = 60;

timer_func[0] = function()
{
    if (!events_done)
    {
        var _func = events[hits][event_pos];
        _func();
        event_pos++;
    }
    
    if (event_pos > (array_length(events[hits]) - 1))
    {
        events_done = true;
        timer[0] = -1;
    }
    else if (timer[0] <= 0)
    {
        timer[0] = irandom_range(90, 120);
    }
};

events[0] = [function()
{
    event_spawn(obj_macro_knives_ninjastar, -1);
}, function()
{
    event_spawn(obj_macro_knives_ninjastar, 1);
}, function()
{
    event_spawn(obj_macro_knives_ninjastar, -1);
}, function()
{
    event_spawn(obj_macro_knives_ninjastar, 1);
    timer[0] = 20;
}, function()
{
    event_spawn(obj_macro_knives_ninjastar, 1);
}, function()
{
    var _inst = event_spawn(obj_macro_knives_block, -1);
    _inst.glyph = true;
    event_spawn(obj_macro_knives_ninjastar, 1);
    timer[0] = 10;
}, function()
{
    event_spawn(obj_macro_knives_ninjastar, 1);
    timer[0] = 10;
}, function()
{
    event_spawn(obj_macro_knives_ninjastar, 1);
    timer[0] = 45;
}, function()
{
    event_snake();
    timer[0] = 50;
}, function()
{
    var _inst = event_spawn(obj_macro_knives_bom, -1);
    _inst.glyph = true;
}];
events[1] = [function()
{
    event_spawn(obj_macro_knives_sword, -1);
    timer[0] = 100;
}, function()
{
    event_spawn(obj_macro_knives_sword, 1);
    timer[0] = 100;
}, function()
{
    event_spawn(obj_macro_knives_sword, -1);
    event_spawn(obj_macro_knives_block, 1);
    timer[0] = 45;
}, function()
{
    event_snake();
    timer[0] = 50;
}, function()
{
    event_spawn(obj_macro_knives_bom, 1);
}];
events[2] = [function()
{
    var _inst = event_spawn(obj_macro_knives_block, -1);
    _inst.glyph = true;
    event_spawn(obj_macro_knives_ninjastar, 1);
    timer[0] = 10;
}, function()
{
    event_spawn(obj_macro_knives_ninjastar, 1);
    timer[0] = 10;
}, function()
{
    event_spawn(obj_macro_knives_ninjastar, 1);
}, function()
{
    event_spawn(obj_macro_knives_sword, -1);
    timer[0] = 60;
}, function()
{
    event_spawn(obj_macro_knives_sword, 1);
    timer[0] = 60;
}, function()
{
    event_spawn(obj_macro_knives_ninjastar, -1);
    timer[0] = 8;
}, function()
{
    event_spawn(obj_macro_knives_ninjastar, -1);
    event_spawn(obj_macro_knives_block, 1);
    timer[0] = 8;
}, function()
{
    event_spawn(obj_macro_knives_ninjastar, -1);
    timer[0] = 8;
}, function()
{
    event_spawn(obj_macro_knives_ninjastar, -1);
    timer[0] = 8;
}, function()
{
    event_spawn(obj_macro_knives_ninjastar, -1);
    timer[0] = 60;
}, function()
{
    event_spawn(obj_macro_knives_sword, 1);
    timer[0] = 8;
}, function()
{
    event_snake();
    timer[0] = 45;
}, function()
{
    event_spawn(obj_macro_knives_bom, -1);
}];

event_shake = function(arg0, arg1 = 0.1)
{
    shake = arg0;
    shake_dec = arg1;
};

event_next = function()
{
    events_done = false;
    event_pos = 0;
    timer[0] = 1;
};

hits = 0;
events_done = false;
event_pos = 0;
show_debug_overlay(false);
shake_min = 0;
