wizard_ind = 0;
input = global.input[0];
global.world = 0;
global.stage = 1;

var func_go = function()
{
    global.act = 1;
    var _room = asset_get_index(string("rm_{0}_s{1}a{2}", world_to_name(global.world), global.stage, global.act));
    var _trans = room_goto_triangles(_room);
    audio_sound_gain(obj_title.bgm, 0, 800);
    
    _trans.func_roomend = function()
    {
        audio_stop_all();
    };
    
    deac = true;
};

var func_palette = function()
{
    audio_stop_play(snd_coin, 0, 0);
    global.palette++;
    
    if (global.palette > (sprite_get_width(pal_buster) - 3))
        global.palette = 0;
};

menu = 
{
    options: ["TUTORIAL", "STAGE 1", "STAGE 2", "STAGE 3", "STAGE 4", "STAGE 5", "MINI-BOSS"],
    functions: [func_go, func_go, func_go, func_go, func_go, func_go, func_go]
};

for (var i = 0; i < 6; i++)
    beat[i] = false;

ini_open("save.ini");

for (var i = 0; i < 5; i++)
{
    var _str = string("city s{0}", i + 1);
    
    if (ini_read_real(_str, "Highscore", 0) > 0)
        beat[i] = true;
}

if (ini_read_real("city s7", "Highscore", 0) > 0)
    beat[5] = true;

fixed_ini_close();
var _allbeat = true;

for (var i = 0; i < 6; i++)
{
    if (beat[i] == false)
    {
        _allbeat = false;
        break;
    }
}

if (_allbeat)
{
    menu = 
    {
        options: ["TUTORIAL", "STAGE 1", "STAGE 2", "STAGE 3", "STAGE 4", "STAGE 5", "MINI-BOSS", "PALETTE"],
        functions: [func_go, func_go, func_go, func_go, func_go, func_go, func_go, func_palette]
    };
}

deac = false;

get_stats = function()
{
    ini_open("save.ini");
    var _str = string("{0} s{1}", world_to_name(global.world), global.stage);
    highscore = ini_read_real(_str, "Highscore", 0);
    
    for (var i = 0; i < 3; i++)
        food[i] = ini_read_real(_str, string("Food {0}", i), false);
    
    fixed_ini_close();
};

get_stats();
buster_jig_index = 0;
static_ind = 0;
static_alpha = 0.15;

if (global.level_select != 0)
{
    selected_option = global.level_select;
    obj_title.bg_yoff = (selected_option / (array_length(menu.options) - 1)) * (sprite_get_height(bgr_title) - 1080);
    obj_title.bg_yoff *= -1;
    obj_title.bg_yoff_lerp = obj_title.bg_yoff;
}
else
{
    selected_option = 0;
}
