var _num = ds_list_size(billboardlist);
var _ind = 0;

for (var i = 0; i < _num; i++)
{
    with (billboardlist[| i])
    {
        if (!visible)
            continue;
        
        gpu_set_depth(depth);
        event_user(7);
        
        if (object_index != obj_player && object_index != obj_philbert && object_get_parent(object_index) != par_enemy)
            continue;
        
        var _shadow = 0;
        
        if (object_index == obj_player)
        {
            if (state == states.actor || state == states.nitrocutscene)
                continue;
            
            var _asc = instance_find(obj_ascendingplayer, 0);
            
            if (_asc)
            {
                if (_asc.shadowind >= sprite_get_number(tex_shadow))
                    continue;
                else
                    _shadow = _asc.shadowind;
            }
            
            if (sprite_index == spr_player_dead && image_index >= 17)
                continue;
            
            if (sprite_index == spr_player_deadloop)
                continue;
            
            if (sprite_index == spr_player_nothing)
                continue;
            
            if (state == states.nitrocutscene)
                continue;
            
            if (state == states.actor)
                continue;
            
            if (state == states.debug)
                continue;
        }
        
        var _ray = room_height;
        var _rotray = room_height;
        var _prevx = x;
        var _prevy = y;
        var _yoff = 0;
        var _xoff = 0;
        var _angle = 0;
        var _mask = (mask_index == -1) ? sprite_index : mask_index;
        _ray = fast_ray(x, bbox_bottom, x, room_height);
        
        if (object_index == obj_player)
        {
            _yoff = 40 * abs(angle_difference(0, angle) / 180);
            _xoff = (64 * angle_difference(0, angle)) / 180;
            _ray = fast_ray(x - _xoff, bbox_bottom - _yoff, x - _xoff, room_height);
            _rotray = fast_ray(bbox_left - _xoff, bbox_bottom - _yoff, bbox_right - _xoff, room_height);
            
            if (grounded)
                _angle = angle;
            else
            {
                x -= _xoff;
                y = (_rotray - sprite_get_yoffset(_mask)) + (sprite_get_height(_mask) - sprite_get_bbox_bottom(_mask));
                _angle = get_floor_angle();
            }
        }
        else if (scr_solid(x, y + 1))
            _angle = get_floor_angle();
        else
        {
            _rotray = fast_ray(bbox_left, bbox_bottom, bbox_right, room_height);
            y = (_rotray - sprite_get_yoffset(_mask)) + (sprite_get_height(_mask) - sprite_get_bbox_bottom(_mask));
            _angle = get_floor_angle();
        }
        
        x = _prevx;
        y = _prevy;
        var _size = max(125 - point_distance(0, bbox_bottom, 0, _ray), 0) / 125;
        
        if (object_index == obj_philbert)
            _size *= 48;
        else
            _size *= 32;
        
        if (object_index == obj_player)
            _ray += 0.25;
        
        other.toshadow[_ind++] = 
        {
            x: x - _xoff,
            y: _ray,
            depth: depth,
            angle: _angle,
            size: _size,
            index: _shadow
        };
    }
}

gpu_set_depth(depth);
