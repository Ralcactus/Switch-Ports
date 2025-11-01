event_inherited();
audio_play_sound(choose(voice_buster_ow, voice_buster_ow2), 0, 0);
audio_play_sound(snd_ouch, 0, 0);
timer[0] = 30;

timer_func[0] = function()
{
    room_goto_fade(room);
    exit;
    
    with (obj_map_player)
        instance_destroy();
    
    with (obj_map_player_follower)
        instance_destroy();
    
    with (obj_playerspawn)
    {
        if (ID == global.spawnID)
            event_user(0);
    }
    
    with (obj_map_player)
    {
        deac = true;
        ignore_render = true;
    }
    
    with (obj_map_player_follower)
        ignore_render = true;
    
    timer[1] = 2;
    xstart = x;
    ystart = y;
    zstart = z;
};

timer[1] = -1;

timer_func[1] = function()
{
    xto = obj_map_player.x;
    yto = obj_map_player.y;
    zto = obj_map_player.z;
    return_to_player = true;
};

anim_init();
global.map_freeze = 999999;
array_push(global.map_freeze_ignore, id);
facing = 1;
shake = 1;
return_to_player = false;
percent = 0;
