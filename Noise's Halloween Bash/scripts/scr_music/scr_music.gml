function add_music(_rm, _music, _is_continuous, _func = noone)
{
    var musicstruct = 
    {
        continuous: _is_continuous,
        event: noone,
        mumethod: noone
    };
    
    with (musicstruct)
    {
        if (_func != noone)
            mumethod = method(self, _func);
        
        if (_music != noone)
        {
            eventname = _music;
            event = event_instance(_music);
        }
    }
    
    musicmap[? _rm] = musicstruct;
}

function stop_music()
{
    with (obj_music)
    {
        if (global.music != noone)
        {
            if (global.music.event != noone)
                event_stop(global.music.event, game_paused() || room == Jeg);
            
            global.music = noone;
        }
    }
}

function timeline_wrapauto(_pos, _length, event_inst)
{
    var pos = fmod_studio_event_instance_get_timeline_position(_pos);
    var length = fmod_studio_event_description_get_length(fmod_studio_system_get_event(_length));
    fmod_studio_event_instance_set_timeline_position(event_inst, wrap(pos, 1, length - 1));
}

function play_music(_rm, _stop_music = true)
{
    var mu = musicmap[? _rm];
    
    if (!is_undefined(mu))
    {
        var prevmusic = global.music;
        
        if (prevmusic == noone || mu.eventname != prevmusic.eventname)
        {
            fmod_studio_event_instance_start(mu.event);
            fmod_studio_event_instance_set_paused(mu.event, false);
            
            if (mu.continuous && prevmusic != noone)
                timeline_wrapauto(prevmusic.event, mu.eventname, mu.event);
            
            if (prevmusic != noone)
            {
                if (prevmusic.event != noone)
                    event_stop(prevmusic.event, _stop_music);
            }
            
            global.music = mu;
        }
    }
    
    if (global.music != noone && global.music.mumethod != noone)
        global.music.mumethod(_rm);
}
