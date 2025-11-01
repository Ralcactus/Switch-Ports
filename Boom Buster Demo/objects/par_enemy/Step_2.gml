if (exit_freeze())
    exit;

anim_logic();

if (hspd != 0 && facing != sign(hspd) && !facing_lock)
{
    facing = sign(hspd);
    
    if (sprite_turn != -4)
        anim_play(sprite_turn);
}

inside_hurt = false;

if (mask_hurt != -4)
{
    image_xscale = facing;
    mask_index = mask_hurt;
    
    with (obj_player)
    {
        if (place_meeting(x, y, other))
        {
            event_user(0);
            other.inside_hurt = true;
        }
    }
    
    mask_index = mask_normal;
    image_xscale = 1;
}

if (place_meeting(x, y, obj_explosion_radius))
{
    hitBy = instance_place(x, y, obj_explosion_radius);
    event_user(1);
}

var _player = instance_place(x, y, obj_player);

if (_player)
{
    var _slide = false;
    
    if (_player.coyote_slide)
    {
        if ((_player.facing == 1 && _player.x > x) || (_player.facing == -1 && _player.x < x))
        {
        }
        else
        {
            _slide = true;
        }
    }
    
    if (spinnable && (_slide || _player.coyote_spin) && !inside_hurt)
    {
        if (ds_list_find_index(_player.list_spinwait, id) == -1)
        {
            ds_list_add(_player.list_spinwait, id);
            hitBy = _player;
            event_user(1);
        }
    }
    else if (!hurt_delay)
    {
        with (_player)
            event_user(0);
    }
    
    hurt_delay = 10;
    hurt_player = _player;
}

if (hurt_delay)
{
    hurt_delay--;
    
    if (place_meeting(x, y, hurt_player))
        hurt_delay = 10;
}

var _projectile = instance_place(x, y, par_projectile);

if (_projectile)
{
    hitBy = _projectile;
    event_user(1);
    
    with (_projectile)
        event_user(0);
}
