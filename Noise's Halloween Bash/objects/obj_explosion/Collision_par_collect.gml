if (game_paused())
    exit;

if (image_index < 9)
{
    if (pow)
    {
        with (other.id)
            event_user(0);
    }
    else
    {
        var _spr = other.sprite_index;
        var _ind = other.image_index;
        var _z = other.depth;
        
        with (instance_create_depth(other.x, other.y, other.depth, obj_flyingcollect))
        {
            sprite_index = _spr;
            image_index = _ind;
            z = _z;
        }
        
        event_replay("event:/sfx/misc/flyoff", other.x, other.y);
        instance_destroy(other.id);
    }
}
