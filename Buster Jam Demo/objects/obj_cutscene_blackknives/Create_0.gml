testvariablenothing = false;
bgm_play = -4;
event_inherited();
array_timers = [];
scene_path = "Dialogue/W1/black_knives_meeting.json";
act_buster = 0;
act_bridget = 1;
act_lance = 2;
act_dennis = 3;
act_jade = 4;
act_snake = 5;
ambience_play = audio_play_sound(bgm_subway_ambience, 0, true);
audio_sound_gain(ambience_play, 0, 0);
audio_sound_gain(ambience_play, 1, 3000);

custom_function_destroy_standing = function()
{
    with (obj_cutscene_blackknives_standing)
        instance_destroy();
};

events = [function()
{
    event_delay(3);
}, function()
{
    event_camera_setup();
}, function()
{
    x = 2504;
    y = 1872;
}, function()
{
    event_actor_create(0, 3481, 2352, 0);
}, function()
{
    event_actor_create(1, 3520, 2368, 0);
}, function()
{
    event_actor_sprite(0, spr_map_bb_subway);
}, function()
{
    event_actor_visible(1, false);
}, function()
{
    event_actor_create(act_lance, 2339, 2571, 0);
}, function()
{
    event_actor_create(act_dennis, 2097, 2572, 0);
}, function()
{
    event_actor_create(act_jade, 2198, 2403, 0);
}, function()
{
    event_actor_create(act_snake, 1961, 2407, 0);
}, function()
{
    event_actor_sprite(2, spr_map_lance_idle, 0);
}, function()
{
    event_actor_sprite(3, spr_map_dennis_idle, 0);
}, function()
{
    event_actor_sprite(4, spr_map_jade_idle, 0);
}, function()
{
    event_actor_sprite(5, spr_map_snake_idle, 0);
}, function()
{
    event_delay(321.25);
}, function()
{
    event_actor_sprite(0, spr_map_bb_subway_giggle);
}, function()
{
    event_delay(90);
}, function()
{
    event_create_scene(scene_path, 0, false);
}, function()
{
    audio_sound_gain(ambience_play, 0, 0);
}, function()
{
    instance_create_layer(0, 0, "GUI", obj_cutscene_blackknives_phone);
}, function()
{
    event_delay(210);
}, function()
{
    with (obj_cutscene_blackknives_phone)
        event_muffle();
    
    audio_sound_gain(ambience_play, 0.5, 0);
}, function()
{
    event_delay(180);
}, function()
{
    event_create_scene(scene_path, 2, false);
}, function()
{
    audio_stop_sound(ambience_play);
}, function()
{
    with (obj_cutscene_blackknives_phone)
        instance_destroy();
}, function()
{
    get_cams();
    var _star = instance_create_layer(camx - 50, (camy + 540) - 200, "FX", obj_blackknives_ninjastar);
    _star.xto = 3293;
    _star.yto = 2193;
    _star.ID = 0;
}, function()
{
    event_delay(5);
}, function()
{
    get_cams();
    var _star = instance_create_layer(camx - 50, (camy + 540) - 200, "FX", obj_blackknives_ninjastar);
    _star.xto = 3373;
    _star.yto = 2183;
    _star.ID = 1;
}, function()
{
    event_delay(5);
}, function()
{
    get_cams();
    var _star = instance_create_layer(camx - 50, (camy + 540) - 200, "FX", obj_blackknives_ninjastar);
    _star.xto = 3446;
    _star.yto = 2190;
    _star.ID = 2;
}, function()
{
    event_delay(90);
}, function()
{
    event_create_scene(scene_path, 45);
}, function()
{
    event_actor_speed(0, 10, 0.022222222222222223);
}, function()
{
    event_actor_speed(1, 10, 0.022222222222222223);
}, function()
{
    event_actor_move_jump(0, [2976, 2496], false, 96);
}, function()
{
    event_actor_move_jump(1, [3104, 2559], false, 96);
}, function()
{
    event_actor_sprite(0, spr_map_buster_jump_tense);
}, function()
{
    event_actor_sprite(1, spr_map_bridget_jump_ditzy);
}, function()
{
    array_push(array_timers, [45, function()
    {
        event_actor_sprite(0, spr_map_buster_blank);
    }]);
}, function()
{
    array_push(array_timers, [45, function()
    {
        event_actor_sprite(1, spr_map_bridget_nervous);
    }]);
}, function()
{
    event_actor_facing(0, -1);
}, function()
{
    event_actor_facing(1, -1);
}, function()
{
    bgm_play = audio_play_sound(bgm_knivescutscene, 0, true);
}, function()
{
    event_camera_move(1680, 1872, true, 0.011111111111111112);
}, function()
{
    event_pause();
}, function()
{
    event_delay(60);
}, function()
{
    event_create_scene(scene_path, 3, false);
}, function()
{
    event_actor_sprite(act_lance, spr_map_lance_squint, 0);
}, function()
{
    event_delay(60);
}, function()
{
    event_actor_sprite(act_dennis, spr_map_dennis_idle, 0);
}, function()
{
    event_delay(90);
}, function()
{
    event_actor_facing(2, 1);
}, function()
{
    event_actor_shake(2);
}, function()
{
    event_actor_sprite(2, spr_map_lance_explain, 0);
}, function()
{
    event_create_scene(scene_path, 8, false);
}, function()
{
    event_actor_shake(act_lance);
}, function()
{
    event_actor_sprite(act_lance, spr_map_lance_scream, 0);
}, function()
{
    event_delay(90);
}, function()
{
    event_actor_sprite(act_dennis, spr_map_dennis_idle, 0);
}, function()
{
    event_delay(70);
}, function()
{
    event_actor_sprite(act_jade, spr_map_jade_facepalm, 0);
}, function()
{
    event_delay(60);
}, function()
{
    event_create_scene(scene_path, 12, false);
}, function()
{
    event_actor_sprite_speed(act_lance, 0);
}, function()
{
    event_delay(70);
}, function()
{
    event_actor_shake(act_lance);
}, function()
{
    event_actor_sprite(act_lance, spr_map_lance_kermit, 0);
}, function()
{
    event_actor_facing(act_lance, -1);
}, function()
{
    event_actor_sprite_speed(act_lance, 1);
}, function()
{
    event_delay(60);
}, function()
{
    event_actor_facing(act_lance, 1);
}, function()
{
    event_actor_sprite(act_lance, spr_map_lance_idle, 0);
}, function()
{
    event_actor_sprite(act_dennis, spr_map_dennis_idle, 0);
}, function()
{
    event_delay(30);
}, function()
{
    event_create_scene(scene_path, 15, false);
}, function()
{
    instance_create_layer(0, 0, "GUI", obj_cutscene_blackknives_standing);
}, function()
{
    event_delay(300);
}, function()
{
    event_actor_sprite(act_lance, spr_map_lance_awesome, 0);
}, function()
{
    event_actor_sprite(act_dennis, spr_map_dennis_awesome, 0);
}, function()
{
    event_actor_sprite(act_jade, spr_map_jade_awesome, 0);
}, function()
{
    event_actor_sprite(0, spr_map_buster_not_scared);
}, function()
{
    event_actor_sprite(1, spr_map_bridget_scared);
}, function()
{
    custom_function_destroy_standing();
}, function()
{
    event_delay(90);
}, function()
{
    event_create_scene(scene_path, 44, false);
}, function()
{
    event_delay(90);
}, function()
{
    event_actor_sprite(act_jade, spr_map_jade_facepalm, 0);
}, function()
{
    event_delay(90);
}, function()
{
    event_actor_speed(4, 14);
}, function()
{
    event_actor_move(act_jade, [2544, 2499], true);
}, function()
{
    event_pause();
}, function()
{
    event_delay(25);
}, function()
{
    event_actor_sprite(act_jade, spr_map_jade_idle, 0);
}, function()
{
    event_create_scene(scene_path, 26, false);
}, function()
{
    audio_play_sound(snd_shashing, 0, 0);
}, function()
{
    event_actor_shake(1);
}, function()
{
    event_actor_sprite(1, spr_map_bridget_scared);
}, function()
{
    for (var i = act_lance; i <= act_snake; i++)
    {
        event_actor_shake(i);
        var _pos = event_actor_get_pos(i);
        event_actor_speed(i, 10);
        event_actor_move(i, [_pos[0] + 72, _pos[1]], false);
    }
    
    event_actor_sprite(act_lance, spr_map_lance_threat, 0);
    event_actor_sprite(act_dennis, spr_map_dennis_threat, 0);
    event_actor_sprite(act_jade, spr_map_jade_threat, 0);
    event_actor_sprite(act_snake, spr_map_snake_threat, 0);
}, function()
{
    event_delay(75);
}, function()
{
    event_create_scene(scene_path, 51, false);
}, function()
{
    instance_create_layer(0, 0, "GUI", obj_cutscene_blackknives_fightpose);
}, function()
{
    event_delay(100);
}, function()
{
    array_push(array_timers, [150, function()
    {
        event_custom_end();
    }]);
}, function()
{
    event_create_scene(scene_path, 43, false);
}];

event_custom_end = function()
{
    room_goto_fade(rm_boomtown_boss, 120, true);
    
    if (audio_is_playing(bgm_play))
        audio_sound_gain(bgm_play, 0, 1000);
    
    event_pause();
};

textbox_events[1] = function()
{
    event_actor_sprite(0, spr_map_bb_subway_huh);
};

textbox_events[46] = function()
{
    event_actor_sprite(0, spr_map_bb_subway_look);
};

textbox_events[3] = function()
{
    event_actor_sprite(0, spr_map_buster_letsfight_rage);
};

textbox_events[4] = function()
{
    event_actor_sprite(0, spr_map_buster_blank);
};

textbox_events[6] = function()
{
    event_actor_sprite(3, spr_map_dennis_talk, 0);
};

textbox_events[9] = function()
{
    event_actor_sprite(3, spr_map_dennis_lookup, 0);
};

var _func = function()
{
    event_actor_sprite(2, spr_map_lance_abouttokill, 0);
    event_actor_sprite(4, spr_map_jade_annoyed, 0);
};

textbox_events[11] = _func;

textbox_events[13] = function()
{
    event_actor_sprite(4, spr_map_jade_idle, 0);
    event_actor_sprite(0, spr_map_buster_bruh);
};

textbox_events[17] = function()
{
    event_actor_sprite(1, spr_map_bridget_thinking);
};

textbox_events[18] = function()
{
    event_actor_sprite(1, spr_map_bridget_blank);
};

textbox_events[21] = function()
{
    event_actor_shake(1, 1.65);
    event_actor_sprite(1, spr_map_bridget_scream, 0);
};

textbox_events[22] = function()
{
    event_actor_sprite(2, spr_map_lance_idle, 0);
    event_actor_sprite(3, spr_map_dennis_idle, 0);
    event_actor_sprite(4, spr_map_jade_idle, 0);
    event_actor_sprite(1, spr_map_bridget_scared, 0);
};

textbox_events[24] = function()
{
    event_actor_sprite(2, spr_map_lance_abouttokill, 0);
};

textbox_events[29] = function()
{
    event_actor_sprite(4, spr_map_jade_seriously, 0);
};

textbox_events[31] = function()
{
    event_actor_sprite(1, spr_map_bridget_scream, 0);
};

textbox_events[32] = function()
{
    event_actor_sprite(1, spr_map_bridget_anxious);
    event_actor_shake(2);
    event_actor_sprite(2, spr_map_lance_whine, 0);
};

textbox_events[48] = function()
{
    event_actor_sprite(4, spr_map_jade_uhhuh, 0);
};

textbox_events[33] = function()
{
    event_actor_sprite(2, spr_map_lance_annoyed, 0);
    event_actor_speed(2, 17);
    event_actor_shake(2, 1.5);
    event_actor_move(2, [2221, 2413], false);
};

textbox_events[35] = function()
{
    event_actor_sprite(act_lance, spr_map_lance_mybad, 0);
    event_actor_snap(act_lance, 2317, 2413, false);
    event_actor_shake(act_lance);
};

textbox_events[36] = function()
{
    event_actor_sprite(act_jade, spr_map_jade_idle, 0);
    event_actor_sprite(0, spr_map_buster_bruh);
};

textbox_events[37] = function()
{
    event_actor_shake(2);
    event_actor_sprite(2, spr_map_lance_scream, 0);
    event_actor_facing(2, -1);
    event_actor_sprite(0, spr_map_buster_blank);
};

textbox_events[38] = function()
{
    event_actor_shake(2);
    event_actor_sprite(2, spr_map_lance_idle, 0);
    event_actor_facing(2, 1);
    event_actor_sprite(0, spr_map_buster_bruh);
};

textbox_events[49] = function()
{
    event_actor_sprite(2, spr_map_lance_rage, 0);
};

textbox_events[41] = function()
{
    event_actor_sprite(0, spr_map_buster_squint);
};

textbox_events[54] = function()
{
    event_actor_sprite(0, spr_map_buster_eyelids_grin);
};

texture_prefetch("tg_cutscene_assassins");
time = 0;
