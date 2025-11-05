global.instancelist = ds_list_create();

function scr_define_collide()
{
    vsp = 0;
    hsp = 0;
    platspeedV = 0;
    platspeedH = 0;
    inertiaV = 0;
    inertiaH = 0;
    grav = 0;
    grounded = false;
    terminalVelocity = 12;
    maxSnapUp = 2.75;
    triggerNitros = false;
    hit_vertical = -1;
    hit_horizontal = -1;
    step_vertical = -1;
    step_horizontal = -1;
    collision_objects = [obj_solid, obj_slope, obj_slopePlatform, obj_platform, obj_oneWayWall];
    moving_objects = [obj_deathplatformend, obj_movingPlatform];
    collide_destructibles = -1;
    forceHspUpdate = false;
    forceVspUpdate = false;
    prevGrounded = grounded;
}

function scr_collide()
{
    prevGrounded = grounded;
    platspeedV = 0;
    platspeedH = 0;
    var _movinghspd = 0;
    var _movingvspd = 0;
    var _initialid = id;
    
    with (obj_destroyablemovingnitro)
    {
        if (!done_move && id != _initialid)
            event_perform(ev_step, ev_step_begin);
    }
    
    for (var i = 0; i < array_length(moving_objects); i++)
    {
        with (moving_objects[i])
        {
            if (!done_move && id != _initialid)
                event_perform(ev_step, ev_step_begin);
            
            var _xdiff = x - xprevious;
            var _ydiff = y - yprevious;
            
            with (other.id)
            {
                var old_x = x;
                var old_y = y;
                var _oldbbox = bbox_bottom;
                x += _xdiff;
                y += _ydiff;
                
                if (vsp >= 0)
                {
                    var _check1 = scr_solid(x, y + 1, other.id);
                    var _check2 = _oldbbox + ceil(vsp);
                    
                    if (!_check1)
                        _check2 = fast_ray(bbox_left, _oldbbox, bbox_right, _oldbbox + ceil(vsp), other.id) + 1;
                    
                    if (_check1 || _check2 != (_oldbbox + ceil(vsp)))
                    {
                        _movinghspd = _xdiff;
                        _movingvspd = _ydiff;
                        
                        if (_check2 != (_oldbbox + ceil(vsp)) && !_check1)
                            _movingvspd += (_check2 - bbox_bottom);
                        
                        platspeedV = _ydiff;
                        platspeedH = _xdiff;
                        
                        if (vsp > 0)
                        {
                            var v = clamp(vsp, -1, 1);
                            vsp = 0;
                            
                            if (hit_vertical != -1)
                                hit_vertical(v);
                            
                            test_ground(true);
                        }
                    }
                }
                
                x = old_x;
                y = old_y;
            }
        }
    }
    
    var vy = vsp;
    vy += _movingvspd;
    
    repeat (ceil(abs(vy)))
    {
        var v = clamp(vy, -1, 1);
        var vnop = clamp(vy - _movingvspd, -1, 1);
        scr_collide_destructibles(0, v);
        
        if (forceVspUpdate)
        {
            vy = vsp;
            vy += _movingvspd;
            v = clamp(vy, -1, 1);
            vnop = clamp(vy - _movingvspd, -1, 1);
            forceVspUpdate = false;
        }
        
        if (step_vertical != -1 && !step_vertical(v))
        {
            if (_movingvspd > 0)
                vy -= vsp;
            else
                break;
        }
        
        if (!scr_solid(x, y + v, collision_objects))
        {
            if (vnop < 0)
                grounded = false;
            
            y += v;
            vy -= v;
        }
        else
        {
            vsp = 0;
            
            if (hit_vertical != -1)
                hit_vertical(v);
            
            test_ground(true);
            break;
        }
    }
    
    var vx = hsp;
    vx += _movinghspd;
    
    repeat (ceil(abs(vx)))
    {
        var v = clamp(vx, -1, 1);
        scr_collide_destructibles(v, 0);
        
        if (forceHspUpdate)
        {
            vx = hsp;
            vx += _movinghspd;
            v = clamp(vx, -1, 1);
            forceHspUpdate = false;
        }
        
        var cDefault = scr_solid(x + v, y, collision_objects);
        var skipCollision = false;
        var snapPrecision = 0.25;
        var maxSnapDown = 3;
        var snap = 0;
        var ogY = y;
        
        if (cDefault)
        {
            while (scr_solid(x + v, y, collision_objects))
            {
                skipCollision = true;
                y -= snapPrecision;
                snap += snapPrecision;
                
                if (snap > maxSnapUp)
                {
                    skipCollision = false;
                    y = ogY;
                    break;
                }
            }
        }
        else
        {
            skipCollision = true;
            
            while (!scr_solid(x + v, y + snapPrecision, collision_objects))
            {
                y += snapPrecision;
                snap += snapPrecision;
                
                if (snap > maxSnapDown)
                {
                    y = ogY;
                    break;
                }
            }
        }
        
        test_ground();
        
        if (step_horizontal != -1 && !step_horizontal(v))
        {
            if (_movingvspd > 0)
                vx -= hsp;
            else
                break;
        }
        
        if (skipCollision)
        {
            x += v;
            vx -= v;
        }
        else
        {
            hsp = 0;
            
            if (hit_horizontal != -1)
                hit_horizontal(v);
            
            break;
        }
    }
    
    if (vsp < terminalVelocity)
        vsp += grav;
    
    test_ground();
    
    if (!grounded)
    {
        inertiaH = _movinghspd / 2;
        inertiaV = _movingvspd / 2;
    }
    else
    {
        inertiaH = 0;
        inertiaV = 0;
    }
    
    hit_vertical = -1;
    hit_horizontal = -1;
    step_vertical = -1;
    step_horizontal = -1;
    collide_destructibles = -1;
}

function test_ground(_override = false)
{
    if (_override || vsp >= 0)
        grounded = scr_solid(x, y + 1);
}

function scr_solid(_x, _y, _obj_array = [obj_solid, obj_slope, obj_slopePlatform, obj_platform, obj_oneWayWall])
{
    static il = global.instancelist;
    
    ds_list_clear(il);
    var old_x = x;
    var old_y = y;
    x = _x;
    y = _y;
    var num = instance_place_list(x, y, _obj_array, il, true);
    var _collided = false;
    
    for (var i = 0; i < num; i++)
    {
        var b = il[| i];
        var obj = b.object_index;
        
        if (b.canCollide != -1 && !b.canCollide(id, old_x, old_y))
            continue;
        
        if (object_is_parent_or_ancestor(obj_platform, obj))
        {
            var _sidecheck = (sign(b.image_yscale) > 0) ? (y >= old_y) : (y <= old_y);
            _collided = _sidecheck && !place_meeting(x, old_y, b);
        }
        else if (object_is_parent_or_ancestor(obj_oneWayWall, obj))
        {
            var _sidecheck = (sign(b.image_xscale) < 0) ? (x >= old_x) : (x <= old_x);
            _collided = _sidecheck && !place_meeting(old_x, y, b);
        }
        else if (object_is_parent_or_ancestor(obj_slope, obj))
        {
            with (b)
            {
                var object_side = 0;
                var slope_start = 0;
                var slope_end = 0;
                
                if (image_xscale > 0)
                {
                    object_side = other.bbox_right;
                    slope_start = bbox_bottom;
                    slope_end = bbox_top;
                }
                else
                {
                    object_side = other.bbox_left;
                    slope_start = bbox_top;
                    slope_end = bbox_bottom;
                }
                
                var s = lerp(slope_start, slope_end, (object_side - bbox_left) / (bbox_right - bbox_left));
                
                if (other.bbox_bottom >= s)
                    _collided = true;
            }
        }
        else if (object_is_parent_or_ancestor(obj_slopePlatform, obj))
        {
            var s, o_s;
            
            with (b)
            {
                var object_side = 0;
                var slope_start = 0;
                var slope_end = 0;
                
                if (image_xscale > 0)
                {
                    slope_start = bbox_bottom;
                    slope_end = bbox_top;
                }
                else
                {
                    slope_start = bbox_top;
                    slope_end = bbox_bottom;
                }
                
                other.x = old_x;
                object_side = (image_xscale > 0) ? other.bbox_right : other.bbox_left;
                o_s = lerp(slope_start, slope_end, (object_side - bbox_left) / (bbox_right - bbox_left));
                other.x = _x;
                object_side = (image_xscale > 0) ? other.bbox_right : other.bbox_left;
                s = lerp(slope_start, slope_end, (object_side - bbox_left) / (bbox_right - bbox_left));
            }
            
            y = old_y;
            var o_bbox_bottom = bbox_bottom;
            y = _y;
            
            if (y >= old_y && bbox_bottom >= s && o_bbox_bottom <= (o_s + 2))
                _collided = true;
        }
        else
            _collided = true;
        
        if (_collided)
        {
            ds_list_clear(il);
            x = old_x;
            y = old_y;
            return true;
        }
    }
    
    ds_list_clear(il);
    x = old_x;
    y = old_y;
    return false;
}

function scr_destroy_horizontal(_h, _obj_array = [par_destructible, obj_destroyablecheckpoint])
{
    static il = global.instancelist;
    
    var _hitblock = false;
    
    if (_h != 0)
    {
        var _num = instance_place_list(x + _h, y, _obj_array, il, false);
        
        while (!ds_list_empty(il))
        {
            var _inst = il[| 0];
            ds_list_delete(il, 0);
            
            if (variable_instance_exists(_inst, "canCollide"))
            {
                if (_inst.canCollide != -1 && !_inst.canCollide(id, x, y))
                    continue;
            }
            
            _hitblock = true;
            
            with (_inst)
            {
                switch (object_index)
                {
                    case obj_destroyablecheckpoint:
                        event_perform(ev_destroy, 0);
                        gamepadvibrate(0.4, 0, 8);
                        break;
                    
                    default:
                        instance_destroy();
                        gamepadvibrate(0.4, 0, 8);
                }
            }
        }
    }
    
    ds_list_clear(il);
    return _hitblock;
}

function scr_destroy_vertical(_v, _obj_array = [par_destructible, obj_destroyablecheckpoint])
{
    static il = global.instancelist;
    
    var _hitblock = false;
    
    if (_v != 0)
    {
        var _num = instance_place_list(x, y + _v, _obj_array, il, false);
        
        while (!ds_list_empty(il))
        {
            var _inst = il[| 0];
            ds_list_delete(il, 0);
            
            if (variable_instance_exists(_inst, "canCollide"))
            {
                if (_inst.canCollide != -1 && !_inst.canCollide(id, x, y))
                    continue;
            }
            
            _hitblock = true;
            
            with (_inst)
            {
                switch (object_index)
                {
                    case obj_destroyablecheckpoint:
                        event_perform(ev_destroy, 0);
                        gamepadvibrate(0.2, 0, 8);
                        break;
                    
                    default:
                        instance_destroy();
                        gamepadvibrate(0.2, 0, 8);
                }
            }
        }
    }
    
    ds_list_clear(il);
    return _hitblock;
}

function scr_destroybounce(_v, _obj = par_bouncysolid)
{
    static il = global.instancelist;
    
    var _hitblock = false;
    var _num = instance_place_list(x, y + _v, _obj, il, false);
    var _closest = [noone, -1];
    
    while (!ds_list_empty(il))
    {
        var _inst = il[| 0];
        ds_list_delete(il, 0);
        
        if (variable_instance_exists(_inst, "canCollide"))
        {
            if (_inst.canCollide != -1 && !_inst.canCollide(id, x, y))
                continue;
        }
        
        var _dist = point_distance(bbox_left + ((bbox_right - bbox_left) / 2), bbox_top + ((bbox_bottom - bbox_top) / 2), _inst.bbox_left + ((_inst.bbox_left - _inst.bbox_right) / 2), _inst.bbox_top + ((_inst.bbox_top - _inst.bbox_bottom) / 2));
        
        if (_dist < _closest[1] || _closest[1] == -1)
            _closest = [_inst, _dist];
    }
    
    if (_closest[0] != noone)
    {
        _hitblock = true;
        
        with (_closest[0])
        {
            switch (object_index)
            {
                default:
                    if (bounce_event != -1)
                    {
                        with (other.id)
                            forceVspUpdate = true;
                        
                        bounce_event(other.id, _v);
                        
                        if (other.vsp > 0)
                            prevGrounded = false;
                    }
            }
        }
    }
    
    ds_list_clear(il);
    return _hitblock;
}

function scr_collide_destructibles(_h, _v)
{
    if (triggerNitros)
    {
        if (object_index == obj_player)
        {
            if (player_collideable())
            {
                scr_destroy_horizontal(_h, obj_destroyablenitro);
                var _destroyed = scr_destroy_vertical(_v, obj_destroyablenitro);
                
                if (_destroyed)
                    wrathofcortex = sprite_index == spr_player_tiptoe;
            }
        }
        else
        {
            scr_destroy_horizontal(_h, obj_destroyablenitro);
            scr_destroy_vertical(_v, obj_destroyablenitro);
        }
    }
    
    if (collide_destructibles != -1)
        collide_destructibles(_h, _v);
}

function fire_ray(_x1, _y1, _x2, _y2, _check = 1, _obj_array = [obj_solid, obj_slope, obj_slopePlatform, obj_platform, obj_oneWayWall], _mask_spr = spr_PTPpixel)
{
    var _dist = point_distance(_x1, _y1, _x2, _y2);
    var _dir = point_direction(_x1, _y1, _x2, _y2);
    var _oldmask = mask_index;
    var _raystruct = 
    {
        x: 0,
        y: 0,
        clear: true
    };
    var _ogx = x;
    var _ogy = y;
    mask_index = _mask_spr;
    
    if (_dist > 0)
    {
        for (var i = 0; i < _dist; i += _check)
        {
            _raystruct.x = _x1 + lengthdir_x(i, _dir);
            _raystruct.y = _y1 + lengthdir_y(i, _dir);
            x = _raystruct.x;
            y = _raystruct.y;
            _raystruct.clear = true;
            
            if (scr_solid(x + sign(lengthdir_x(1, _dir)), y + sign(lengthdir_y(1, _dir)), _obj_array))
            {
                _raystruct.clear = false;
                break;
            }
        }
    }
    
    mask_index = _oldmask;
    x = _ogx;
    y = _ogy;
    return _raystruct;
}

function fast_ray(_x1, _y1, _x2, _y2, _obj_array = [obj_solid, obj_slope, obj_slopePlatform, obj_platform])
{
    static _il = global.instancelist;
    
    var _y = _y2;
    var _num = 0;
    var _up = _y2 < _y1;
    
    if (floor(_x1) == floor(_x2))
        _num = collision_line_list(_x1, _y1, _x2, _y2, _obj_array, false, true, _il, true);
    else
        _num = collision_rectangle_list(_x1, _y1, _x2, _y2, _obj_array, false, true, _il, true);
    
    for (var _i = 0; _i < _num; _i++)
    {
        var _instance = _il[| _i];
        var _sidecheck = false;
        
        if (_up)
            _sidecheck = (sign(_instance.image_yscale) > 0) ? (_y <= _y1) : (_y >= _y1);
        else
            _sidecheck = (sign(_instance.image_yscale) > 0) ? (_y >= _y1) : (_y <= _y1);
        
        if (_instance.canCollide != -1 && !_instance.canCollide(id, _x1, _y1))
            continue;
        
        if (object_is_parent_or_ancestor(obj_platform, _instance.object_index) && (!_sidecheck || place_meeting(x, y, _instance)))
            continue;
        else if (object_is_parent_or_ancestor(obj_slope, _instance.object_index) && !_up)
        {
            with (_instance)
            {
                var object_side = 0;
                var slope_start = 0;
                var slope_end = 0;
                
                if (image_xscale > 0)
                {
                    object_side = max(_x1, _x2);
                    slope_start = bbox_bottom;
                    slope_end = bbox_top;
                }
                else
                {
                    object_side = min(_x1, _x2);
                    slope_start = bbox_top;
                    slope_end = bbox_bottom;
                }
                
                var m = (sign(image_xscale) * (bbox_bottom - bbox_top)) / (bbox_right - bbox_left);
                _y = min(clamp(slope_start - round(m * (object_side - bbox_left)), bbox_top, bbox_bottom), _y);
            }
        }
        else if (object_is_parent_or_ancestor(obj_slopePlatform, _instance.object_index))
        {
            if (_up)
                continue;
            
            with (_instance)
            {
                var object_side = 0;
                var slope_start = 0;
                var slope_end = 0;
                
                if (image_xscale > 0)
                {
                    object_side = max(_x1, _x2);
                    slope_start = bbox_bottom;
                    slope_end = bbox_top;
                }
                else
                {
                    object_side = min(_x1, _x2);
                    slope_start = bbox_top;
                    slope_end = bbox_bottom;
                }
                
                var m = (sign(image_xscale) * (bbox_bottom - bbox_top)) / (bbox_right - bbox_left);
                var _prevy = _y;
                _y = min(clamp(slope_start - round(m * (object_side - bbox_left)), bbox_top, bbox_bottom), _y);
                
                if (_y1 > _y)
                    _y = _prevy;
            }
        }
        else if (_up)
            _y = max(_y, _instance.bbox_bottom);
        else
            _y = min(_y, _instance.bbox_top);
    }
    
    ds_list_clear(_il);
    
    if (!_up)
        return _y - 1;
    
    return _y;
}

function get_floor_angle()
{
    var _slopeCollide = scr_solid(x, y + 1, [obj_slope, obj_slopePlatform]) && !scr_solid(x, y + 1, [obj_solid, obj_platform]);
    
    with (instance_place(x, y + 1, par_collideable))
    {
        if (_slopeCollide)
        {
            if (sign(image_xscale) == -1)
                return point_direction(0, image_yscale, image_xscale, 0) + 180;
            else
                return point_direction(0, image_yscale, image_xscale, 0);
        }
        else
            return image_angle;
    }
    
    return 0;
}
