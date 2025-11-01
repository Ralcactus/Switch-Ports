event_inherited();
events = [function()
{
    event_delay(3);
}, function()
{
    event_camera_setup();
}, function()
{
    x = obj_map_cam.x - 960;
    y = obj_map_cam.y - 540;
}, function()
{
    event_actor_create_player_auto(0);
}, function()
{
    event_actor_auto(0, -4);
}, function()
{
    event_actor_create_follower_auto(1);
}, function()
{
    event_actor_auto(1, -4);
}, function()
{
    event_actor_snap_to_marker(1, 2);
}, function()
{
    event_delay(1);
}, function()
{
    event_actor_facing(1, 1);
}, function()
{
    event_actor_sprite(0, spr_map_buster_squint);
}, function()
{
    event_actor_sprite(1, spr_map_bridget_idle_boil);
}, function()
{
    event_delay(90);
}, function()
{
    event_create_scene("Dialogue/W1/first_wall.json", 27);
}, function()
{
    event_actor_speed(1, 4);
}, function()
{
    event_actor_auto(1, 1);
}, function()
{
    event_actor_move(1, [obj_map_player_follower.x, obj_map_player_follower.y], true);
}, function()
{
    event_pause();
}, function()
{
    event_end();
}];

textbox_events[28] = function()
{
    event_actor_facing(0, -1);
    event_actor_sprite(0, spr_map_buster_idle_boil);
    event_actor_squish(1);
    event_actor_sprite(1, spr_map_bridget_hands_excited);
};

textbox_events[29] = function()
{
    event_actor_squish(1);
    event_actor_sprite(1, spr_map_bridget_idle_boil);
};

textbox_events[30] = function()
{
    event_actor_squish(0);
    event_actor_sprite(0, spr_map_buster_letsfight);
};

textbox_events[31] = function()
{
    event_actor_sprite(0, spr_map_buster_eyelids_grin);
    event_actor_squish(1);
    event_actor_sprite(1, spr_map_bridget_flustered);
};

textbox_events[32] = function()
{
    event_actor_sprite(0, spr_map_buster_idle_boil);
    event_actor_squish(1);
    event_actor_sprite(1, spr_map_bridget_idle_boil);
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
