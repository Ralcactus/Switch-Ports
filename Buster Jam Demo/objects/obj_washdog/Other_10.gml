if (controller.win)
{
    if (buffer_exists(buffer))
        buffer_delete(buffer);
    
    exit;
}

if (chunk == 0)
{
    buffer = buffer_create(surface_get_width(surf3) * surface_get_height(surf3) * 4, buffer_fixed, 1);
    buffer_get_surface(buffer, surf3, 0);
}

var _chunksize = buffer_get_size(buffer) / chunk_max;

for (var i = 0; i < _chunksize; i += 180)
{
    var _pos = i + (_chunksize * chunk);
    
    if ((_pos + 4) >= buffer_get_size(buffer))
        break;
    
    var _r = buffer_peek(buffer, _pos, buffer_u8);
    var _g = buffer_peek(buffer, _pos + 1, buffer_u8);
    var _b = buffer_peek(buffer, _pos + 2, buffer_u8);
    var _a = buffer_peek(buffer, _pos + 3, buffer_u8);
    var _col = make_colour_rgb(_r, _g, _b);
    
    if (_col == 3135)
        count++;
}

chunk++;

if (chunk > chunk_max)
{
    if (count < count_last)
    {
        var _snd = audio_play_sound_on(controller.audio, snd_pop, 0, 0);
        audio_sound_pitch(_snd, choose(0.925, 1, 1.075));
    }
    
    count_last = count;
    
    if (count <= 3)
        event_user(1);
    
    buffer_delete(buffer);
    chunk = 0;
    count = 0;
}
