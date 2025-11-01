var _pos = audio_sound_get_track_position(obj_rhythm_game.bgm_play);
offset = (time - _pos) * global.spd;
var _offset = offset;

if (_offset < 0)
    _offset = 0;

if (ind == 0)
    x = 960 - (960 * _offset);
else
    x = 960 + (960 * _offset);

image_index = ind;

if (offset <= 0)
{
    image_alpha = 1 + (offset * 11);
    
    if (hit)
    {
        event_user(0);
        instance_destroy();
    }
}

if (image_alpha <= 0)
{
    instance_destroy();
    
    if (!hit)
    {
        with (obj_rhythm_game)
            event_hurt();
    }
}
