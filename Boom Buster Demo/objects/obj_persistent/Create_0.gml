global.palette = 0;
global.opening = true;
global.level_select = 0;
var _loading = instance_create_layer(0, 0, layer, obj_loading);
_loading.audio_groups_load = [bgm_buster];

_loading.event_done = function()
{
    room_goto(rm_disclaimer);
};

global.performance = false;
global.debug = false;
global.bgmPlay = -4;
global.stage = 1;
global.act = 1;
str[0] = "left";
str[1] = "right";
str[2] = "up";
str[3] = "down";
str[4] = "jump";
str[5] = "spin";
str[6] = "dash";
str[7] = "crouch";
str[8] = "drop";
str[9] = "start";
str[10] = "select";
global.world = 1;
font_dollars = font_add_sprite_ext(spr_font_dollars, "$.0123456789", true, -8);
font_coins = font_add_sprite_ext(spr_font_coin, "$.0123456789", true, -8);
font_alarm = font_add_sprite_ext(spr_font_alarm, "0123456789.-", false, 7);
var _mapstring = string("ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,.!?/:{0}{1}'()*-$%[]<>+", "\"", "");
font_main = font_add_sprite_ext(spr_font_main, _mapstring, true, 0);
font_bombleft = font_add_sprite_ext(spr_font_bombLeft, "987654321", true, 0);
font_bombmiddle = font_add_sprite_ext(spr_font_bombMiddle, "9876543210", false, 0);
font_bombright = font_add_sprite_ext(spr_font_bombRight, "9876543210", true, 0);
font_controls = font_add_sprite_ext(spr_font_keys, "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-+←→↑↓", false, 0);
global.map_particles = ds_map_create();

detect_resolution = function()
{
    global.resolution = 0;
    
    if (display_get_width() <= 1920)
        global.resolution = 1;
    
    if (display_get_width() <= 1440)
        global.resolution = 2;
    
    if (display_get_width() <= 1280)
        global.resolution = 3;
    
    if (display_get_width() <= 960)
        global.resolution = 4;
    
    if (global.resolution >= 2)
        global.texfilter = true;
};

resize_resolution = function()
{
    resW[0] = 1920;
    resH[0] = 1080;
    resW[1] = 1440;
    resH[1] = 810;
    resW[2] = 1280;
    resH[2] = 720;
    resW[3] = 960;
    resH[3] = 540;
    resW[4] = 800;
    resH[4] = 450;
    window_set_size(resW[global.resolution], resH[global.resolution]);
    window_center();
};

detect_resolution();
resize_resolution();
ini_open("options.ini");
global.resolution = ini_read_real("OPTIONS", "Resolution", 0);
var _fullscreen = ini_read_real("OPTIONS", "Fullscreen", false);

if (_fullscreen)
    window_set_fullscreen(_fullscreen);

global.colorblind = ini_read_real("OPTIONS", "Colorblind", false);
global.vol_master = ini_read_real("OPTIONS", "Master Volume", 0.5);
global.vol_bgm = ini_read_real("OPTIONS", "BGM Volume", 1);
global.vol_sfx = ini_read_real("OPTIONS", "SFX Volume", 1);
global.texfilter = ini_read_real("OPTIONS", "Texture Filter", false);
global.vsync = ini_read_real("OPTIONS", "Vsync", false);
display_reset(0, global.vsync);
global.deadzone = ini_read_real("OPTIONS", "Gamepad Deadzone", 1);
global.crouch_down = true;
fixed_ini_close();
init_game_globals();
randomize();
global.list_ignorefreeze = ds_list_create();
global.audio_queues = ds_list_create();
global.map_path_yoffs = ds_map_create();
ds_map_add(global.map_path_yoffs, "obj_dynalife", 37);
ds_map_add(global.map_path_yoffs, "obj_bom", 32);
global.particles = 
{
    rundustR: part_type_create(),
    rundustL: part_type_create(),
    jumpdust: part_type_create(),
    dustland: part_type_create(),
    dashsmokeR: part_type_create(),
    dashsmokeL: part_type_create(),
    sparkleGreen: part_type_create(),
    sparkleTinyYellow: part_type_create(),
    explosion: part_type_create(),
    hitmarker: part_type_create(),
    smack: part_type_create(),
    smoke: part_type_create(),
    ring: part_type_create(),
    ringthick: part_type_create(),
    ember: part_type_create()
};
part_type_sprite_simple(global.particles.rundustR, spr_fx_rundust);
part_type_sprite_simple(global.particles.rundustL, spr_fx_rundust);
part_type_scale(global.particles.rundustL, -1, 1);
part_type_sprite_simple(global.particles.jumpdust, spr_fx_jumpdust);
part_type_sprite_simple(global.particles.dustland, spr_fx_dustland);
part_type_sprite_simple(global.particles.dashsmokeR, spr_fx_dashsmoke);
part_type_sprite_simple(global.particles.dashsmokeL, spr_fx_dashsmoke);
part_type_scale(global.particles.dashsmokeL, -1, 1);
part_type_sprite_simple(global.particles.sparkleGreen, spr_fx_sparkle_green);
part_type_orientation(global.particles.sparkleGreen, 0, 360, choose(-3, 3), 0, 0);
part_type_alpha1(global.particles.sparkleGreen, random_range(0.25, 0.55));
part_type_sprite_simple(global.particles.sparkleTinyYellow, spr_fx_sparkle_tiny_yellow);
part_type_orientation(global.particles.sparkleTinyYellow, 0, 360, choose(-3, 3), 0, 0);
part_type_alpha1(global.particles.sparkleTinyYellow, random_range(0.25, 0.55));
part_type_sprite_simple(global.particles.explosion, spr_fx_explosion);
part_type_sprite_simple(global.particles.hitmarker, spr_fx_hitmarker);
part_type_sprite_simple(global.particles.smack, spr_fx_smack);
part_type_sprite_simple(global.particles.smoke, spr_fx_smoke);
part_type_sprite_simple(global.particles.ember, spr_fireball_ember);
var _part = global.particles.ring;
part_type_shape(_part, 5);
part_type_size(_part, 0.1, 0.1, 0.1, 0);
part_type_scale(_part, 1, 1);
part_type_speed(_part, 0, 0, 0, 0);
part_type_direction(_part, 80, 100, 0, 0);
part_type_gravity(_part, 0, 270);
part_type_orientation(_part, 0, 0, 0, 0, false);
part_type_colour2(_part, 65535, 16777215);
part_type_alpha3(_part, 1, 0.7, 0);
part_type_blend(_part, false);
part_type_life(_part, 22, 22);
_part = global.particles.ringthick;
part_type_shape(_part, 5);
part_type_size(_part, 0.2, 0.2, 0.12, 0);
part_type_scale(_part, 1, 1);
part_type_speed(_part, 0, 0, 0, 0);
part_type_direction(_part, 80, 100, 0, 0);
part_type_gravity(_part, 0, 270);
part_type_orientation(_part, 0, 0, 0, 0, false);
part_type_colour2(_part, 16777215, 16777215);
part_type_alpha3(_part, 1, 0.7, 0);
part_type_blend(_part, false);
part_type_life(_part, 22, 22);
global.part_over_nostun = part_system_create_layer("Particles_Over", true);
global.part_over = part_system_create_layer("Particles_Over", true);
global.part_behind = part_system_create_layer("Particles_Behind", true);
global.part_gui = part_system_create_layer("GUI", true);
part_system_automatic_draw(global.part_gui, false);
global.input[0] = instance_create_layer(0, 0, layer, par_input);
global.gtexel_size = shader_get_uniform(sha_palswap, "texel_size");
global.gpal_uvs = shader_get_uniform(sha_palswap, "palette_UVs");
global.gpal_index = shader_get_uniform(sha_palswap, "palette_index");
global.gpal_tex = shader_get_sampler_index(sha_palswap, "palette_texture");
shake_default = 0.32;

for (var c = 0; c < 2; c++)
{
    global.screenshake[c] = 0;
    shake_strength[c] = 0;
    shake_speed[c] = shake_default;
}

app_resize = 1;
application_surface_draw_enable(false);
surface_resize(application_surface, 1408, 1080);
map_volumes = ds_map_create();
var _audio = tag_get_asset_ids("bgm", 2);

for (var i = 0; i < array_length(_audio); i++)
    ds_map_add(map_volumes, _audio[i], audio_sound_get_gain(_audio[i]));

_audio = tag_get_asset_ids("snd", 2);

for (var i = 0; i < array_length(_audio); i++)
    ds_map_add(map_volumes, _audio[i], audio_sound_get_gain(_audio[i]));

set_audio = function()
{
    var _bgms = tag_get_asset_ids("bgm", 2);
    
    for (var i = 0; i < array_length(_bgms); i++)
    {
        var _base = ds_map_find_value(map_volumes, _bgms[i]);
        var _vol = _base * global.vol_bgm * global.vol_master;
        audio_sound_gain(_bgms[i], _vol, 0);
    }
    
    var _snds = tag_get_asset_ids("snd", 2);
    
    for (var i = 0; i < array_length(_snds); i++)
    {
        var _base = ds_map_find_value(map_volumes, _snds[i]);
        var _vol = _base * global.vol_sfx * global.vol_master;
        audio_sound_gain(_snds[i], _vol, 0);
    }
};

set_audio();
