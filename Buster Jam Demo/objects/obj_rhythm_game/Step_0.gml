ind_pressed[0] = input_check_pressed("jump");
ind_pressed[1] = input_check_pressed("action");
var _objs = [obj_rhythm_event_buster, obj_rhythm_event_bridget];
beat_scale = easy_smooth(beat_scale, 1, 2);

for (var i = 0; i < array_length(ind_pressed); i++)
{
    if (ind_pressed[i])
    {
        var _array = instance_rectangle_array(x - width, y - height, x + width, y + height, _objs[i]);
        
        if (array_length(_array) == 0)
        {
            event_hurt();
        }
        else
        {
            var _closest = 999;
            var _grab = -4;
            
            for (var j = 0; j < array_length(_array); j++)
            {
                if (_array[j].offset < _closest)
                    _grab = _array[j].id;
            }
            
            with (_grab)
                hit = true;
            
            var _dist = _grab.x - x;
            
            if (abs(_dist) == 0)
            {
                var _ind;
                
                if (_grab.image_alpha >= 0.9)
                    _ind = 2;
                else if (_grab.image_alpha >= 0.6)
                    _ind = 1;
                else
                    _ind = 0;
                
                print(string("ind:{0}", _ind));
                score += score_data[_ind][0];
                last_score = score_data[_ind][1];
            }
            else if (abs(_dist) <= 10)
            {
                score += score_data[2][0];
                last_score = score_data[2][1];
            }
            else if (abs(_dist) <= 30)
            {
                score += score_data[1][0];
                last_score = score_data[1][1];
            }
            else
            {
                score += score_data[0][0];
                last_score = score_data[0][1];
            }
            
            print("got it");
            ind_pressed[i] = false;
            continue;
        }
        
        beat_scale = 0.88;
    }
}

var _pos = audio_sound_get_track_position(bgm_play);

for (var i = 0; i < array_length(events); i++)
{
    var _time = events[i].time;
    
    if (_pos >= (_time - (2 / global.spd)))
    {
        var _obj;
        
        if (events[i].ind == 0)
            _obj = obj_rhythm_event_buster;
        else
            _obj = obj_rhythm_event_bridget;
        
        var _inst = instance_create_layer(-300, 0, "Events", _obj);
        _inst.time = events[i].time;
        array_delete(events, i, 1);
    }
}

if (keyboard_check_pressed(vk_f1))
{
    var _inst = instance_create_layer(0, 0, layer, obj_rhythm_editor);
    _inst.events = events_remember;
    _inst.bgm = bgm;
    _inst.bpm = bpm;
    
    with (par_rhythm_event)
        instance_destroy();
    
    audio_stop_all();
    instance_destroy();
}
