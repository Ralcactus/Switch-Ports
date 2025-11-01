if (global.cutscene_swap)
{
    global.cutscene_swap_percent = approach(global.cutscene_swap_percent, 1, 0.12);
    
    if (global.cutscene_swap_percent == 1)
    {
        global.char = !global.char;
        global.cutscene_swap_percent = 0;
        global.cutscene_swap = false;
    }
}

global.map_freeze = approach(global.map_freeze, 0, 1);

if (global.map_freeze == 0)
    global.map_freeze_ignore = [];

if (keyboard_check_pressed(ord("M")) && !instance_exists(obj_microgame_controller) && global.debug)
{
    var _dist = 210;
    micro_games = ["gart_jump", "pistol", "demoswing", "kiss", "firework", "kiss", "bunny_follow", "superhero", "food_catch", "skate", "tickle_monkey", "coin", "defuse", "dodge", "button"];
    var _choose = micro_games[mygame];
    var _inst = microgame_create(0, 0, struct_get(global.microgames_data, _choose), undefined, undefined, undefined, true, false);
    scr_microgame_center(_inst);
}

if (keyboard_check_pressed(ord("B")) && global.debug)
{
    room_goto(rm_boomtown_boss);
    audio_stop_all();
}

if (keyboard_check_pressed(ord("E")) && keyboard_check(vk_control) && global.debug)
{
    room_goto(rm_boomtown_boss);
    audio_stop_all();
}

if (audio_is_playing(music_fadeout))
{
    if (audio_sound_get_gain(music_fadeout) == 0)
        audio_stop_sound(music_fadeout);
}

if (input_check_pressed("pause") && !instance_exists(obj_microgame_controller) && !instance_exists(obj_scene_manager) && !instance_exists(par_map_cutscene) && !instance_exists(obj_player_hurt))
    instance_create_layer(0, 0, "GUI", obj_pause);

timer_logic(0);

if (!scr_map_exit_freeze())
    timer_logic(1);
