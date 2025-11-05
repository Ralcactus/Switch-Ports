crackshake = max(0, crackshake - 5);
var _status = video_get_status();

if (input_check_pressed("attack") && _status != 1)
{
    video_close();
    input_verb_consume(["jump", "attack", "inv"]);
    instance_destroy();
    exit;
}

if (!started)
{
    if (input_check_pressed("jump"))
    {
        started = true;
        changeflash = 1;
        event_play_oneshot("event:/sfx/misc/switchvideo");
        video_open(string("{0}Data/Video/{1}.mkv", working_directory, videos[selected]));
        video_set_volume(global.mastervolume);
        video_enable_loop(false);
    }
    else
        exit;
}

if (changeflash >= 1 && _status == 0)
{
    video_open(string("{0}Data/Video/{1}.mkv", working_directory, videos[selected]));
    video_set_volume(global.mastervolume);
    video_enable_loop(false);
}

if (_status != 1)
{
    var _dir = input_check_opposing_pressed("left", "right");
    var _prevselected = selected;
    selected += _dir;
    selected = clamp(selected, 0, array_length(videos) - 1);
    
    if (selected < 1)
    {
        if (crack < 3)
        {
            if (++crack == 3)
            {
                event_play_oneshot("event:/sfx/misc/forcevideo");
                save_easteregg("wasThatTheBiteOf87");
            }
            else
            {
                event_play_oneshot("event:/sfx/misc/mapclick");
                selected = _prevselected;
            }
            
            crackshake = 40;
        }
    }
    
    if (selected != _prevselected)
    {
        changeflash = 1.15;
        video_close();
        event_play_oneshot("event:/sfx/misc/switchvideo");
        event_play_oneshot("event:/sfx/pausemenu/move");
    }
}

if (_status == 2 || _status == 3)
    changeflash = approach(changeflash, 0, 0.05);

if (input_check_pressed("jump"))
{
    if (_status == 0)
    {
        video_open(string("{0}Data/Video/{1}.mkv", working_directory, videos[selected]));
        video_set_volume(global.mastervolume);
        video_enable_loop(false);
    }
    else if (_status == 2)
        video_pause();
    else if (_status == 3)
        video_resume();
}
