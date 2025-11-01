if (exit_freeze())
    exit;

physics_apply();
anim_logic();
timer_logic(0);

if (place_meeting(x, y, obj_player))
{
    var _player = instance_place(x, y, obj_player);
    
    if (state != state_hurt)
    {
        with (_player)
            event_user(0);
    }
}

if (instance_exists(obj_player) && state == state_idle)
{
    if (obj_player.x > x)
        hspd = walkspd;
    else
        hspd = -walkspd;
    
    facing = sign(hspd);
}

if (state == state_hurt)
    hspd = approach(hspd, 0, 0.2);
