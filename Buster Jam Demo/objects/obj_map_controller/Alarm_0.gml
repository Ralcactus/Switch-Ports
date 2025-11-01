testvariablenothing = false;

if (!audio_group_is_loaded(bgm_endless_lose))
{
    alarm[0] = 1;
    exit;
}

instance_create_layer(x, y, "Instances_Render0", obj_depthsorter);

if (layer_exists("Instances_Render1"))
{
    var _inst = instance_create_layer(x, y, "Instances_Render1", obj_depthsorter);
    _inst.render_layer = 1;
}

if (global.bgm != bgm)
{
    if (audio_is_playing(global.bgm_play))
    {
        if (global.bgm != -4)
        {
            music_fadeout = audio_play_sound(global.bgm, 0, true);
            audio_sound_set_track_position(music_fadeout, audio_sound_get_track_position(global.bgm_play));
            audio_sound_gain(music_fadeout, 0, 600);
        }
        
        audio_stop_sound(global.bgm_play);
    }
    
    global.bgm = bgm;
}

if (!audio_is_playing(global.bgm_play) && global.bgm != -4)
{
    global.bgm_play = audio_play_sound(global.bgm, 0, true);
    audio_sound_gain(global.bgm_play, 0, 0);
}

if (audio_is_playing(global.bgm_play))
    audio_sound_gain(global.bgm_play, bgm_vol, 600);

global.map_names = 
{
    rm_boomtown_test: "Test Grounds",
    rm_boomtown_intro: "City Gates",
    rm_boomtown_firstspikes: "First St.",
    rm_boomtown_1_fuseblocks: "Brainache Blvd.",
    rm_boomtown_1_save: "Prospect Aly.",
    rm_boomtown_wall: "Prospect Pkwy.",
    rm_boomtown_2_1: "Diamond Drv.",
    rm_boomtown_2_2: "Crown Heights",
    rm_boomtown_ubend: "Borough Bend",
    rm_boomtown_abe: "Lincoln Center",
    rm_boomtown_jimmy: "Lincoln Aly.",
    rm_boomtown_stairs: "Goldman Anx.",
    rm_boomtown_train: "Chill Cool Fun Train Ride"
};
map_name = struct_get(global.map_names, room_get_name(room));
