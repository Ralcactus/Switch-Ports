global.fadein_spd = 0.05;
global.fadeout_spd = 0.05;
event_user(2);
global.debug = false;

if (global.debug)
    show_debug_overlay(false);

global.hp_spr = spr_trans_hp;
global.hp_spr = spr_trans_hp_lost;
global.games_beat = -4;
global.window_scale = 1;
ini_open("settings.ini");
global.keyboard = ini_read_real("GAME", "Keyboard Scheme", 0);
global.gamepad_icons = ini_read_real("GAME", "Gamepad Icons", 0);
global.vsync = ini_read_real("VIDEO", "Vsync", false);
display_reset(0, global.vsync);
global.texfilter = ini_read_real("VIDEO", "Texfilter", false);
gpu_set_texfilter(global.texfilter);
var _fullscreen = ini_read_real("VIDEO", "Fullscreen", true);
global.window_scale = ini_read_real("VIDEO", "Window Scale", 1);
global.master_vol = ini_read_real("AUDIO", "Master", 0.5);
global.bgm_vol = ini_read_real("AUDIO", "BGM", 1);
global.sfx_vol = ini_read_real("AUDIO", "SFX", 1);
fixed_ini_close();
event_user(1);
scr_resolution_adapt();
sounds = [];
musics = [];
var _exists = false;
var _str = "Audio/audio_data.json";
var _names = [];
var _audio_data = json_load(_str);

if (!file_exists(_str))
{
    show_message("'audio_data.json' missing. Some audio errors may occurr.\nIf this was an accident, please reinstall the game.");
    sounds = [];
    musics = [];
    _exists = false;
}
else
{
    sounds = _audio_data[0];
    musics = _audio_data[1];
    _exists = true;
}

for (var i = 0; i < array_length(sounds); i++)
    array_push(_names, sounds[i][0]);

for (var i = 0; i < array_length(musics); i++)
    array_push(_names, musics[i][0]);

var _counter = 0;

while (audio_exists(_counter))
{
    var _name = audio_get_name(_counter);
    var _gain = audio_sound_get_gain(asset_get_index(_name));
    print(string("{0}: {1}", _name, _gain));
    _counter++;
    
    if (array_contains(_names, _name))
    {
        print("file already in table");
        continue;
    }
    
    if (string_char_at(_name, 1) == "s" && string_char_at(_name, 2) == "n" && string_char_at(_name, 3) == "d")
    {
        array_push(sounds, [_name, _gain]);
        continue;
    }
    else if (string_char_at(_name, 1) == "b" && string_char_at(_name, 2) == "g" && string_char_at(_name, 3) == "m")
    {
        array_push(musics, [_name, _gain]);
    }
    else if (string_char_at(_name, 1) == "v" && string_char_at(_name, 2) == "o" && string_char_at(_name, 3) == "i" && string_char_at(_name, 4) == "c" && string_char_at(_name, 5) == "e")
    {
        array_push(sounds, [_name, _gain]);
    }
}

global.bgm_play = -4;
audio_sound_loop_start(bgm_boomtown, 9.14);
audio_sound_loop_start(bgm_tutorial_frenzy, 1.714);
audio_sound_loop_start(bgm_results, 17.21);
audio_sound_loop_start(bgm_results_boss, 8);
audio_sound_loop_start(bgm_subwayboss_140, 20.57);
audio_sound_loop_end(bgm_subwayboss_140, 116.57);
audio_sound_loop_start(bgm_subwayboss_160, 17.99875);
audio_sound_loop_end(bgm_subwayboss_160, 101.99875);
audio_sound_loop_start(bgm_subwayboss_170, 16.939999999999998);
audio_sound_loop_end(bgm_subwayboss_170, 95.99882352941175);
audio_sound_loop_start(bgm_subwayboss_loss_140, 20.57);
audio_sound_loop_end(bgm_subwayboss_loss_140, 116.57);
audio_sound_loop_start(bgm_subwayboss_loss_160, 17.99875);
audio_sound_loop_end(bgm_subwayboss_loss_160, 101.99875);
audio_sound_loop_start(bgm_subwayboss_loss_170, 16.939999999999998);
audio_sound_loop_end(bgm_subwayboss_loss_170, 95.99882352941175);
audio_sound_loop_start(bgm_frenzy_gameover, 2.297);
audio_sound_loop_start(bgm_title, 7.44);
audio_sound_loop_end(bgm_title, 59.53);
event_user(0);
scr_microgames_data();
global.font_dialogue = font_add_sprite_ext(spr_font_dialogue, " ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.,\"'!?$%@&*()-+=/:;~_<>1234567890", true, 0);
global.map_font_spacing = ds_map_create();
ds_map_add(global.map_font_spacing, " ", 35);
ds_map_add(global.map_font_spacing, "y", -6);
ds_map_add(global.map_font_spacing, "g", -6);
ds_map_add(global.map_font_spacing, ",", 4);
ds_map_add(global.map_font_spacing, ".", 4);
ds_map_add(global.map_font_spacing, "!", 2);
global.map_font_spacing_after = ds_map_create();
ds_map_add(global.map_font_spacing_after, "Y", -6);
ds_map_add(global.map_font_spacing_after, "'", 3);
global.font_dialogue_outline = font_add_sprite_ext(spr_font_dialogue_outline, " ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.,\"'!?$%@&*()-+=/:;~_<>1234567890", true, -7);
global.font_splash = font_add_sprite_ext(spr_font_splash, " ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!?':.,%", true, -14);
global.font_score = font_add_sprite_ext(spr_font_score, "0123456789", false, -32);
global.micro_id_total = 0;
global.follower = true;
global.gtexel_size = shader_get_uniform(sha_palswap, "texel_size");
global.gpal_uvs = shader_get_uniform(sha_palswap, "palette_UVs");
global.gpal_index = shader_get_uniform(sha_palswap, "palette_index");
global.gpal_tex = shader_get_sampler_index(sha_palswap, "palette_texture");
scr_init_dialogue_globals();
global.map_got = ds_map_create();
global.coins = 0;
global.save_block = false;
global.screen_shake[0] = 0;
global.screen_shake[1] = 0;
global.screen_shake_dec = 0.22;
scr_reset_save_data();
texture_debug_messages(true);
global.map_freeze = 0;
global.map_freeze_ignore = [];
window_set_caption("Buster Jam DEMO");
global.hp_max = 4;
global.hp = 4;
room_goto(rm_network_setup);
randomize();

if (!global.debug)
    window_set_cursor(cr_none);

global.delta_game_factor = 1;
global.delta_real_factor = 1;
global.speedup = 1;
global.char = 0;
global.cutscene_swap = false;
global.cutscene_swap_percent = 0;
global.spawnID = 0;
global.bgm = -4;
global.bgm_play = -4;
global.masterclip_performance = false;
global.multiplayer = false;
global.steam_userID = undefined;
