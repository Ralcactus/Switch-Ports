if (nextroom >= (array_length(rooms) + 1))
{
    nitro = obj_deathplatform;
    nitrox = nitro.x;
    nitroy = nitro.y;
    nitrow = 0;
    nitroh = 0;
}
else
{
    nitro = instance_nearest(room_width / 2, room_height / 2, obj_destroyablenitro);
    
    if (instance_exists(obj_destroyablenitroarrow))
    {
        var _nitroarrow = instance_nearest(room_width / 2, room_height / 2, obj_destroyablenitroarrow);
        var _nitroarrowdist = point_distance(room_width / 2, room_height / 2, _nitroarrow.x, _nitroarrow.y);
        var _nitrodist = point_distance(room_width / 2, room_height / 2, nitro.x, nitro.y);
        
        if (_nitroarrowdist <= _nitrodist)
        {
            if (in_saveroom(string("{0}_ARROW", real(_nitroarrow)), global.respawnroom) && !in_saveroom(string("{0}_NITRO", real(_nitroarrow)), global.respawnroom))
                nitro = _nitroarrow;
        }
    }
    
    nitrox = nitro.x;
    nitroy = nitro.y;
    nitrow = nitro.sprite_width;
    nitroh = nitro.sprite_height;
}
