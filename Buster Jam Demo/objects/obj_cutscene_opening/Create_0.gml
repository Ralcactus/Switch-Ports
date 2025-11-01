testvariablenothing = false;
texture_prefetch("tg_map_wizard");
my_seq = -4;
bgm_play = -4;
event_inherited();
array_timers = [];
scene_path = "Dialogue/opening.json";
act_buster = 0;
act_bridget = 1;
act_wizard = 2;
act_client = 3;
act_ball0 = 4;
act_lip = 5;
act_hissy = 6;
act_goblinjr = 7;
act_ben = 8;

if (global.debug)
    window_set_size(1920, 1080);

events = [function()
{
    event_delay(3);
}, function()
{
    event_camera_setup();
}, function()
{
    event_actor_create(act_buster, 2928, 2398, 0);
}, function()
{
    event_actor_sprite(act_buster, spr_map_buster_idle_boil);
}, function()
{
    event_actor_create(act_bridget, 2640, 2398, 0);
}, function()
{
    event_actor_sprite(act_bridget, spr_map_bridget_idle_boil);
}, function()
{
    event_actor_create(act_client, 3160, 2398, 0);
}, function()
{
    event_actor_sprite(act_client, spr_map_client_idle);
}, function()
{
    event_actor_facing(act_client, -1);
}, function()
{
    var _client = act_client;
    
    with (obj_map_actor)
    {
        if (ID == _client)
        {
            event_animend = function()
            {
                if (anim_sprite == spr_map_client_tiphat)
                {
                    anim_index = 1;
                    anim_speed = 0;
                }
            };
        }
    }
}, function()
{
    event_actor_create(act_ball0, 3160, 3139, 0);
}, function()
{
    event_actor_create(act_lip, 6026, 2568, 0);
}, function()
{
    event_actor_facing(act_lip, -1);
}, function()
{
    event_actor_sprite(act_lip, spr_map_lip_idle);
}, function()
{
    event_actor_create(act_hissy, 4373, 2295, 0);
}, function()
{
    event_actor_sprite(act_hissy, spr_map_hissy_sleeping);
}, function()
{
    event_actor_create(act_goblinjr, 5820, 2423, 0);
}, function()
{
    event_actor_sprite(act_goblinjr, spr_map_goblinjr_painting_idle);
}, function()
{
    event_actor_create(act_ben, 6274, 2432, 0);
}, function()
{
    event_actor_sprite(act_ben, spr_map_ben_idle);
}, function()
{
    event_actor_create(act_wizard, 5426, 2426, 0);
}, function()
{
    event_actor_sprite(act_wizard, spr_map_wizard_idle);
}, function()
{
    var _wizard = act_wizard;
    
    with (obj_map_actor)
    {
        if (ID == _wizard)
        {
            event_animend = function()
            {
                var _spr = anim_sprite;
                
                if (_spr == spr_map_wizard_unamused_staff_raise)
                    anim_play(spr_map_wizard_unamused_staff_raise_rest);
                else if (_spr == spr_map_wizard_unamused_staff_lower)
                    anim_play(spr_map_wizard_unamused);
            };
        }
    }
}, function()
{
    event_delay(120);
}, function()
{
    scene_create(scene_path, 0);
}, function()
{
    event_pause();
}, function()
{
    event_delay(5);
}, function()
{
    event_actor_sprite(act_client, spr_map_client_tiphat);
}, function()
{
    event_delay(60);
}, function()
{
    event_actor_sprite_speed(act_client, 1);
}, function()
{
    event_actor_sprite(act_client, spr_map_client_walk_down);
}, function()
{
    event_actor_speed(act_client, 6);
}, function()
{
    event_actor_move(act_client, [3160, 3302], false);
}, function()
{
    event_delay(90);
}, function()
{
    scene_create(scene_path, 3);
}, function()
{
    event_pause();
}, function()
{
    event_delay(120);
}, function()
{
    event_actor_sprite(act_buster, spr_map_buster_hands_excited);
}, function()
{
    event_actor_facing(act_buster, -1);
}, function()
{
    event_actor_sprite(act_bridget, spr_map_bridget_hands_excited);
}, function()
{
    event_actor_squish(act_buster);
}, function()
{
    event_actor_squish(act_bridget);
}, function()
{
    global.bgm_play = audio_play_sound(bgm_opening_awesome, 0, true);
}, function()
{
    scene_create(scene_path, 4);
}, function()
{
    event_pause();
}, function()
{
    audio_fadeout_stop(global.bgm_play, 0, 1000);
}, function()
{
    event_delay(60);
}, function()
{
    event_actor_facing(act_ball0, -1);
}, function()
{
    event_actor_speed(act_ball0, 5);
}, function()
{
    event_actor_sprite(act_ball0, spr_map_ball_walk);
}, function()
{
    event_actor_move(act_ball0, [3160, 2405], true);
}, function()
{
    array_push(array_timers, [90, function()
    {
        event_actor_facing(act_buster, 1);
        event_actor_sprite(act_bridget, spr_map_bridget_neutral);
        event_actor_sprite(act_buster, spr_map_buster_neutral);
    }]);
}, function()
{
    event_pause();
}, function()
{
    event_actor_sprite(act_ball0, spr_map_ball_idle);
}, function()
{
    event_delay(90);
}, function()
{
    event_actor_facing(act_ball0, 1);
}, function()
{
    event_delay(90);
}, function()
{
    scene_create(scene_path, 16, false);
}, function()
{
    event_pause();
}, function()
{
    event_delay(60);
}, function()
{
    event_actor_squish(act_ball0);
}, function()
{
    audio_play_sound(snd_micro_pistol_angel_speech, 0, 0);
}, function()
{
    event_actor_sprite(act_ball0, spr_map_ball_cough);
}, function()
{
    event_delay(90);
}, function()
{
    event_actor_sprite(act_ball0, spr_map_ball_walk);
}, function()
{
    event_actor_speed(act_ball0, 5);
}, function()
{
    event_actor_facing(act_ball0, -1);
}, function()
{
    event_actor_move(act_ball0, [3868, 2405], true);
}, function()
{
    event_pause();
}, function()
{
    event_delay(10);
}, function()
{
    event_actor_facing(act_buster, -1);
}, function()
{
    scene_create(scene_path, 17, false);
}, function()
{
    event_pause();
}, function()
{
    event_actor_snap(act_ball0, 5815, 2569, 0);
}, function()
{
    global.bgm_play = audio_play_sound(bgm_knivescutscene, 0, true);
}, function()
{
    event_camera_move(4224, 1824, true, 0.007407407407407408);
}, function()
{
    event_actor_sprite(act_ball0, spr_map_ball_idle, 0);
}, function()
{
    event_actor_sprite(act_lip, spr_map_lip_idle, 1);
}, function()
{
    event_actor_facing(act_ball0, -1);
}, function()
{
    event_pause();
}, function()
{
    event_actor_facing(act_buster, 1);
}, function()
{
    event_actor_snap(act_buster, 4080, 2482, 0);
}, function()
{
    event_actor_sprite(act_buster, spr_map_buster_walk_neutral);
}, function()
{
    event_actor_speed(act_buster, 10);
}, function()
{
    event_actor_move(act_buster, [4981, 2482], true);
}, function()
{
    event_actor_snap(act_bridget, 3921, 2396, 0);
}, function()
{
    event_actor_sprite(act_bridget, spr_map_bridget_walk_neutral);
}, function()
{
    event_actor_speed(act_bridget, 10);
}, function()
{
    event_actor_move(act_bridget, [4822, 2396], false);
}, function()
{
    event_pause();
}, function()
{
    event_actor_sprite(act_buster, spr_map_buster_neutral_ticked);
}, function()
{
    event_actor_sprite(act_bridget, spr_map_bridget_neutral);
}, function()
{
    event_delay(10);
}, function()
{
    scene_create(scene_path, 20, false);
}, function()
{
    event_pause();
}, function()
{
    event_delay(25);
}, function()
{
    event_actor_facing(act_wizard, -1);
}, function()
{
    event_delay(70);
}, function()
{
    event_actor_sprite(act_wizard, spr_map_wizard_ughback, -1);
}, function()
{
    scene_create(scene_path, 22, false);
}, function()
{
    event_pause();
}, function()
{
    event_actor_sprite(act_wizard, spr_map_wizard_unamused_staff_raise);
}, function()
{
    audio_play_sound(snd_Bu_defuse_fuseout, 0, 0);
}, function()
{
    event_delay(12);
}, function()
{
    get_cams();
    var _act = act_buster;
    var _x;
    
    with (obj_map_actor)
    {
        if (ID == _act)
            _x = x;
    }
    
    my_lightning_fx = instance_create_layer(_x, camy - 100, "Instances_Render0", obj_map_fx_layered);
    
    with (my_lightning_fx)
    {
        die_after_anim = false;
        anim_play(spr_map_fx_lightning);
        
        event_animend = function()
        {
            var _spr = anim_sprite;
            anim_play(spr_map_fx_lightning_zap);
            
            if (_spr == spr_map_fx_lightning)
            {
                with (obj_cutscene_opening)
                {
                    paused = false;
                    event_continue();
                }
            }
        };
    }
}, function()
{
    event_pause();
}, function()
{
    screen_shake(30, 30, 2);
}, function()
{
    audio_play_sound(snd_lightning, 0, 0);
}, function()
{
    event_actor_sprite(act_buster, spr_map_buster_zap);
}, function()
{
    var _act = act_buster;
    var _x, _y;
    
    with (obj_map_actor)
    {
        _x = x;
        _y = y;
    }
    
    my_zap_fx = instance_create_layer(_x, _y - 89, "Instances_Render0", obj_map_fx_layered);
    
    with (my_zap_fx)
    {
        anim_play(spr_map_fx_zap);
        anim_end_die = false;
    }
}, function()
{
    event_delay(30);
}, function()
{
    event_actor_sprite(act_buster, spr_map_buster_zap_charred);
}, function()
{
    with (my_zap_fx)
        instance_destroy();
}, function()
{
    with (my_lightning_fx)
        instance_destroy();
}, function()
{
    event_delay(60);
}, function()
{
    event_actor_sprite(act_wizard, spr_map_wizard_unamused_staff_lower);
}, function()
{
    event_delay(80);
}, function()
{
    event_actor_sprite(act_bridget, spr_map_bridget_handsonhips);
}, function()
{
    scene_create(scene_path, 31, false);
}, function()
{
    event_pause();
}, function()
{
    instance_create_layer(0, 0, "GUI", obj_geyser_overlay);
}, function()
{
    obj_map_geyser.visible = true;
}, function()
{
    event_actor_sprite(act_buster, spr_map_buster_blank, 0);
}, function()
{
    event_actor_sprite(act_bridget, spr_map_bridget_handsonhips_shock, 0);
}, function()
{
    event_actor_sprite(act_wizard, spr_map_wizard_surprised);
}, function()
{
    event_actor_sprite(act_hissy, spr_map_hissy_wakeup);
}, function()
{
    event_actor_sprite(act_ben, spr_map_ben_surprised_geyser);
}, function()
{
    array_push(array_timers, [75, function()
    {
        event_actor_sprite(act_buster, spr_map_buster_lookback, 0);
        event_actor_sprite(act_bridget, spr_map_bridget_lookback, 0);
        event_actor_sprite(act_wizard, spr_map_wizard_lookback);
        event_actor_facing(act_ball0, 1);
    }]);
}, function()
{
    event_delay(210);
}, function()
{
    event_actor_sprite(act_wizard, spr_map_wizard_grin);
}, function()
{
    event_actor_sprite(act_ben, spr_map_ben_idle, -1);
}, function()
{
    scene_create(scene_path, 38, false);
}, function()
{
    event_pause();
}, function()
{
    audio_play_sound(voice_wizard_evillaugh, 0, 0);
}, function()
{
    my_seq = layer_sequence_create("Sequence", 960, 540, seq_wizard_laugh);
}, function()
{
    event_actor_sprite(act_wizard, spr_map_wizard_laugh);
}, function()
{
    event_delay(169);
}, function()
{
    var _inst = instance_create_layer(0, 0, "FX", obj_map_wizard_poof);
    _inst.act_wizard = act_wizard;
    
    with (_inst)
        event_user(0);
}, function()
{
    event_delay(60);
}, function()
{
    audio_play_sound(snd_enemy_poof, 0, 0);
    var _act = act_ball0;
    
    with (obj_map_actor)
    {
        if (ID == _act)
        {
            var _fx = instance_create_layer(x, y - 48, "FX", obj_map_fx);
            
            with (_fx)
                anim_play(spr_map_poof_144_wizard);
            
            instance_destroy();
        }
    }
}, function()
{
    event_delay(15);
}, function()
{
    audio_play_sound(snd_enemy_poof, 0, 0);
    var _act = act_hissy;
    
    with (obj_map_actor)
    {
        if (ID == _act)
        {
            var _fx = instance_create_layer(x, y - 48, "FX", obj_map_fx);
            
            with (_fx)
                anim_play(spr_map_poof_144_wizard);
            
            instance_destroy();
        }
    }
}, function()
{
    event_delay(15);
}, function()
{
    audio_play_sound(snd_enemy_poof, 0, 0);
    var _act = act_lip;
    
    with (obj_map_actor)
    {
        if (ID == _act)
        {
            var _fx = instance_create_layer(x, y - 48, "FX", obj_map_fx);
            
            with (_fx)
                anim_play(spr_map_poof_144_wizard);
            
            instance_destroy();
        }
    }
}, function()
{
    event_delay(15);
}, function()
{
    event_delay(180);
}, function()
{
    with (obj_wizard_laugh_test)
        instance_destroy();
}, function()
{
    event_actor_sprite(act_buster, spr_map_buster_bruh);
}, function()
{
    event_actor_sprite(act_bridget, spr_map_bridget_neutral);
}, function()
{
    event_actor_create(act_wizard, 6336, 2426, 0);
}, function()
{
    event_actor_sprite(act_wizard, spr_map_wizard_idle_look);
}, function()
{
    event_actor_facing(act_wizard, -1);
}, function()
{
    event_actor_speed(act_wizard, 12);
}, function()
{
    event_actor_move(act_wizard, [5992, 2426], true);
}, function()
{
    event_pause();
}, function()
{
    event_delay(20);
}, function()
{
    scene_create(scene_path, 44);
}, function()
{
    event_pause();
}, function()
{
    event_delay(20);
}, function()
{
    event_actor_speed(act_wizard, 12);
}, function()
{
    event_actor_move(act_wizard, [6336, 2426], true);
}, function()
{
    event_pause();
}, function()
{
    event_delay(25);
}, function()
{
    event_camera_move(3936, 1824, true, 0.022222222222222223);
}, function()
{
    event_pause();
}, function()
{
    event_delay(15);
}, function()
{
    scene_create(scene_path, 45);
}, function()
{
    event_pause();
}, function()
{
    event_actor_sprite(act_buster, spr_map_buster_walk);
}, function()
{
    event_actor_sprite(act_bridget, spr_map_bridget_walk_neutral);
}, function()
{
    event_actor_speed(act_buster, 11);
}, function()
{
    event_actor_speed(act_bridget, 11);
}, function()
{
    event_actor_facing(act_buster, 1);
}, function()
{
    var _y = -4;
    
    with (obj_map_actor)
    {
        if (ID == other.act_buster)
            _y = y;
    }
    
    event_actor_move(act_buster, [6591, _y], false);
}, function()
{
    var _y = -4;
    
    with (obj_map_actor)
    {
        if (ID == other.act_bridget)
            _y = y;
    }
    
    event_actor_move(act_bridget, [6432, _y], false);
}, function()
{
    event_delay(50);
}, function()
{
    global.fadein_spd = 0.013333333333333334;
    room_goto_fade(rm_chapter_intro, 60);
    audio_fadeout_stop(global.bgm_play, 0, 1700);
}, function()
{
    event_delay(59940);
}];

textbox_events[7] = function()
{
    event_actor_sprite(act_bridget, spr_map_bridget_idle_boil);
};

textbox_events[8] = function()
{
    event_actor_sprite(act_buster, spr_map_buster_idle_boil);
};

textbox_events[9] = function()
{
    event_actor_sprite(act_buster, spr_map_buster_eyelids_grin);
};

textbox_events[10] = function()
{
    event_actor_sprite(act_bridget, spr_map_bridget_flustered);
};

textbox_events[13] = function()
{
    event_actor_sprite(act_bridget, spr_map_bridget_idle_boil);
    event_actor_sprite(act_buster, spr_map_buster_idle_boil);
};

textbox_events[14] = function()
{
    event_actor_sprite(act_buster, spr_map_buster_eyelids_grin);
};

textbox_events[15] = function()
{
    event_actor_sprite(act_buster, spr_map_buster_idle_boil);
};

textbox_events[19] = function()
{
    event_actor_sprite(act_goblinjr, spr_map_goblinjr_painting_walk);
    event_actor_speed(act_goblinjr, 5.5);
    event_actor_move(act_goblinjr, [6420, 2423], false);
};

textbox_events[21] = function()
{
    event_actor_sprite(act_wizard, spr_map_wizard_surprised, -1);
};

textbox_events[23] = function()
{
    event_actor_sprite(act_buster, spr_map_buster_not_scared, -1);
};

textbox_events[24] = function()
{
    event_actor_sprite(act_wizard, spr_map_wizard_grunt_look, -1);
};

textbox_events[25] = function()
{
    event_actor_sprite(act_buster, spr_map_buster_letsfight_rage, -1);
};

textbox_events[26] = function()
{
    event_actor_sprite(act_buster, spr_map_buster_not_scared, -1);
    event_actor_sprite(act_wizard, spr_map_wizard_idle_look, -1);
};

textbox_events[30] = function()
{
    event_actor_sprite(act_buster, spr_map_buster_eyelids_grin, -1);
};

textbox_events[51] = function()
{
    event_actor_sprite(act_wizard, spr_map_wizard_unamused);
};

textbox_events[57] = function()
{
    event_actor_sprite(act_wizard, spr_map_wizard_grunt_look, -1);
};

textbox_events[59] = function()
{
    event_actor_sprite(act_wizard, spr_map_wizard_surprised, -1);
    event_actor_speed(act_ben, 8);
    event_actor_move(act_ben, [5896, 2432], false);
};

textbox_events[33] = function()
{
    event_actor_facing(act_wizard, 1);
    event_actor_sprite(act_ben, spr_map_ben_talk);
};

textbox_events[34] = function()
{
    event_actor_sprite(act_ben, spr_map_ben_explain_right);
};

textbox_events[35] = function()
{
    event_actor_sprite(act_ben, spr_map_ben_talk);
};

textbox_events[53] = function()
{
    event_actor_sprite(act_wizard, spr_map_wizard_rage_buildup, 0);
    event_actor_sprite(act_ben, spr_map_ben_explain_left);
};

textbox_events[54] = function()
{
    event_actor_sprite(act_ben, spr_map_ben_idle);
};

textbox_events[36] = function()
{
    event_actor_sprite(act_ben, spr_map_ben_talk);
};

textbox_events[37] = function()
{
    event_actor_sprite(act_wizard, spr_map_wizard_rage, 0);
    event_actor_shake(act_ben, 1.5);
    event_actor_shake(act_wizard, 1.75);
    var _ben = act_ben;
    var _x = 0;
    var _y = 0;
    
    with (obj_map_actor)
    {
        if (ID == _ben)
        {
            _x = x;
            _y = y;
        }
    }
    
    event_actor_snap(act_ben, _x + 28, _y, 0);
    event_actor_sprite(act_ben, spr_map_ben_surprised, 0);
};

textbox_events[39] = function()
{
    event_actor_sprite(act_wizard, spr_map_wizard_idle, 0);
    event_actor_facing(act_wizard, -1);
    event_actor_sprite(act_buster, spr_map_buster_blank, 0);
    event_actor_sprite(act_bridget, spr_map_bridget_anxious, 0);
    event_actor_facing(act_ben, -1);
    event_actor_speed(act_ben, 8);
    event_actor_move(act_ben, [6274, 2432], false);
    event_actor_facing(act_ball0, -1);
    event_actor_sprite(act_hissy, spr_map_hissy_sleeping);
};

textbox_events[43] = function()
{
    event_actor_sprite(act_wizard, spr_map_wizard_grin, 0);
};

textbox_events[41] = function()
{
    event_actor_sprite(act_wizard, spr_map_wizard_grunt, 0);
};

textbox_events[42] = function()
{
    event_actor_sprite(act_wizard, spr_map_wizard_idle_look, 0);
};

textbox_events[32] = function()
{
    event_actor_sprite(act_buster, spr_map_buster_spin, 0);
    array_push(array_timers, [30, function()
    {
        event_actor_sprite(act_buster, spr_map_buster_bruh);
    }]);
};

textbox_events[1] = function()
{
    event_actor_visible(act_buster, false);
    event_actor_sprite(act_client, spr_map_client_paying);
    event_actor_snap(act_client, 3043, 2404, 0);
    event_actor_facing(act_client, 1);
};

textbox_events[2] = function()
{
    event_actor_visible(act_buster, true);
    event_actor_sprite(act_client, spr_map_client_idle, 0);
    event_actor_facing(act_client, -1);
    event_actor_snap(act_client, 3160, 2398, 0);
};

textbox_events[46] = function()
{
    event_actor_sprite(act_buster, spr_map_buster_squint);
};

textbox_events[47] = function()
{
    event_actor_facing(act_buster, -1);
    event_actor_sprite(act_buster, spr_map_buster_neutral);
};

textbox_events[50] = function()
{
    event_actor_sprite(act_buster, spr_map_buster_idle_boil);
    event_actor_sprite(act_bridget, spr_map_bridget_neutral);
};

time = 0;
