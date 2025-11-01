event_inherited();
events = [function()
{
    event_camera_setup();
}, function()
{
    event_actor_create_player_auto(0);
}, function()
{
    event_actor_create_follower_auto(1);
}, function()
{
    event_actor_auto(0, -4);
}, function()
{
    event_actor_squish(0);
}, function()
{
    event_actor_sprite(0, spr_map_buster_woah, 0);
}, function()
{
    event_create_scene("Dialogue/W1/first_wall.json", 0);
}, function()
{
    event_actor_auto(0, 0);
}, function()
{
    event_actor_move(0, 0, true);
}, function()
{
    event_camera_move(2421, 768);
}, function()
{
    event_camera_percent_tie_actor(0);
}, function()
{
    event_actor_move(1, 1, false);
}, function()
{
    event_pause();
}, function()
{
    event_delay(30);
}, function()
{
    event_actor_facing(0, -1);
}, function()
{
    event_actor_squish(0);
}, function()
{
    event_actor_sprite(0, spr_map_buster_hands_excited, 0);
}, function()
{
    event_create_scene("Dialogue/W1/first_wall.json", 1);
}, function()
{
    event_actor_facing(0, 1);
}, function()
{
    event_actor_sprite(0, spr_map_buster_idle_boil);
}, function()
{
    event_delay(40);
}, function()
{
    custom_event_createspin();
}, function()
{
    event_actor_visible(0, false);
}, function()
{
    event_delay(300);
}, function()
{
    event_actor_sprite(1, spr_map_bridget_neutral);
}, function()
{
    event_create_scene("Dialogue/W1/first_wall.json", 4);
}, function()
{
    event_actor_sprite(1, spr_map_bridget_mouthclosed);
}, function()
{
    event_delay(60);
}, function()
{
    custom_event_lastspin();
}, function()
{
    event_pause();
}, function()
{
    event_actor_facing(0, -1);
}, function()
{
    event_actor_snap(0, obj_map_cutscene_firstwall_busterspin.x, obj_map_cutscene_firstwall_busterspin.y, obj_map_cutscene_firstwall_busterspin.z);
}, function()
{
    event_delay(1);
}, function()
{
    event_actor_visible(0, true);
}, function()
{
    with (obj_map_cutscene_firstwall_busterspin)
        instance_destroy();
}, function()
{
    event_delay(30);
}, function()
{
    event_create_scene("Dialogue/W1/first_wall.json", 5);
}, function()
{
    room_goto_fade(rm_boomtown_wall_frenzy, 60, global.bgm_play);
}, function()
{
    event_pause();
}];

textbox_events[7] = function()
{
    event_actor_sprite(1, spr_map_bridget_idle_boil);
};

textbox_events[19] = function()
{
    event_actor_sprite(1, spr_map_bridget_thinking);
};

textbox_events[20] = function()
{
    event_actor_facing(0, 1);
    event_actor_sprite(0, spr_map_buster_think);
    event_actor_squish(0);
};

textbox_events[21] = function()
{
    event_actor_sprite(0, spr_map_buster_imawesome);
    event_actor_facing(0, -1);
    event_actor_squish(0);
    event_actor_sprite(1, spr_map_bridget_mouthclosed);
};

textbox_events[22] = function()
{
    event_actor_facing(0, 1);
};

textbox_events[24] = function()
{
    event_actor_squish(0);
    event_actor_sprite(0, spr_map_buster_letsfight);
};

textbox_events[25] = function()
{
    event_actor_facing(0, 1);
};

textbox_events[36] = function()
{
    event_actor_sprite(0, spr_map_buster_letsfight_rage);
};

textbox_events[11] = function()
{
    event_actor_facing(0, -1);
    event_actor_sprite(0, spr_map_buster_bruh);
};

textbox_events[14] = function()
{
    event_actor_facing(0, -1);
    event_actor_sprite(0, spr_map_buster_idle_boil);
};

textbox_events[16] = function()
{
    event_actor_facing(0, -1);
};

custom_event_createspin = function()
{
    var _x, _y;
    
    with (obj_map_actor)
    {
        if (ID == 0)
        {
            _x = x;
            _y = y;
        }
    }
    
    instance_create_layer(_x, _y, layer, obj_map_cutscene_firstwall_busterspin);
};

custom_event_lastspin = function()
{
    with (obj_map_cutscene_firstwall_busterspin)
        last_spin = true;
};
