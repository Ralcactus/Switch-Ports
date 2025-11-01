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
    event_create_scene("Dialogue/W1/fountain.json", 0);
}, function()
{
    event_actor_move(0, 0, false);
}, function()
{
    event_actor_move(1, 1, true);
}, function()
{
    event_camera_move(96, 1344);
}, function()
{
    event_camera_percent_tie_actor(1);
}, function()
{
    event_pause();
}, function()
{
    event_delay(2);
}, function()
{
    event_actor_facing(0, 1);
}, function()
{
    event_actor_facing(1, -1);
}, function()
{
    event_delay(30);
}, function()
{
    event_create_scene("Dialogue/W1/fountain.json", 1);
}, function()
{
    event_actor_sprite(0, spr_map_buster_spin, 0);
}, function()
{
    event_delay(40);
}, function()
{
    event_actor_sprite(0, spr_map_buster_idle, 0);
}, function()
{
    event_delay(60);
}, function()
{
    event_create_scene("Dialogue/W1/fountain.json", 6);
}, function()
{
    room_goto_fade(rm_boomtown_frenzy, 60, global.bgm_play);
}, function()
{
    event_pause();
}];

textbox_events[6] = function()
{
    event_actor_facing(0, 1);
};

textbox_events[9] = function()
{
    event_actor_facing(0, -1);
};

var _func = function()
{
    event_actor_sprite(0, spr_map_buster_spin, 0);
    event_actor_sprite(1, spr_map_buster_spin, 0);
    event_actor_facing(0, -1);
};

textbox_events[11] = _func;

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
