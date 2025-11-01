trailer = true;
coins_xoff_length = 350;

if (room_persistent == true)
{
    var _str = room_get_name(room);
    show_message(string("!!! Room is persistent. Disable this. !!!\n{0}", _str));
}

texture_prefetch("tg_dialogue");
pattern_move = 0;
pattern_ind = 0;
alarm[3] = 20;

if (!audio_group_is_loaded(bgm_endless_lose))
{
    audio_group_load(bgm_endless_lose);
    alarm[0] = 1;
}
else
{
    alarm[0] = 1;
}

gui_alpha = 1;
gui_coins_xoff = 0;
gui_coins_in = false;
gui_coins_percent = 1;
coins_in_timer = 0;
timer[1] = -1;

timer_func[1] = function()
{
    gui_coins_in = true;
    gui_coins_percent = 1 - gui_coins_percent;
};

global.map_freeze = 0;
global.map_freeze_ignore = [];

if (layer_exists("FX"))
    layer_depth("FX", -room_height);

if (layer_exists("Tiles_Over"))
    layer_depth("Tiles_Over", -room_height - 1);

if (layer_exists("CamBounds"))
    layer_set_visible("CamBounds", false);

if (layer_exists("Tiles_1"))
    layer_set_visible("Tiles_1", false);

if (!instance_exists(obj_map_cam))
    instance_create_layer(x, y, layer, obj_map_cam);

if (layer_exists("GroundFloor"))
{
    var _inst = instance_create_layer(-768, -768, "GroundFloor", obj_solid);
    _inst.image_xscale = (room_width + 768) / 64;
    _inst.image_yscale = (room_height + 768) / 64;
    _inst.z = 16;
    _inst.height = 15;
}

music_fadeout = -4;
bgm_vol = 1;
timer[0] = 20;

timer_func[0] = function()
{
    if (map_name == undefined)
        exit;
    
    var _str = "<circle>";
    _str = string_insert(_str, map_name, 0);
    var _inst = instance_create_layer(0, 0, "GUI", obj_map_name);
    _inst.map_name = _str;
};

mygame = 0;

event_micro_win = function()
{
};

event_micro_loss = function()
{
};
