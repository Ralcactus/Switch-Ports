useCollision = !(state == UnknownEnum.Value_21 || state == UnknownEnum.Value_20 || scr_solid(x, y) || state == UnknownEnum.Value_22);
trace(useCollision);
baddieCollisionBoxEnabled = state != UnknownEnum.Value_23;

if (state == UnknownEnum.Value_1)
    state = UnknownEnum.Value_21;

if (state == UnknownEnum.Value_23)
{
    var p = get_nearestPlayer();
    var _disttoplayer = point_distance(x, y, p.x, p.y);
    hsp = 0;
    vsp = 0;
    image_speed = 0.35;
    
    if (sprite_index != spr_eyescreamsandwich_popout)
    {
        if (abs(_disttoplayer) < 200)
        {
            sprite_index = spr_eyescreamsandwich_popout;
            image_index = 0;
        }
    }
    else if (animation_end())
    {
        state = UnknownEnum.Value_21;
        var dir = point_direction(x, y, p.x, p.y);
        var _spd = 5;
        hsp = lengthdir_x(_spd, dir);
        vsp = lengthdir_y(_spd, dir);
        ragereset = 100;
    }
}

if (useCollision)
    scr_scareenemy();

if (ragereset > 0)
    ragereset--;

event_inherited();

if (state != UnknownEnum.Value_7)
    depth = 0;

if (state != UnknownEnum.Value_4 && state != UnknownEnum.Value_9)
    thrown = 0;
