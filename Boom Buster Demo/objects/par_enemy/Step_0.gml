if (exit_freeze() && path_lock_timer == -1)
    exit;

if (path_lock_timer > -1)
    path_lock_timer--;

if (place_meeting(x, y + 1, obj_spike) && dies_on_spikes)
{
    event_user(3);
    exit;
}

if (vspd == 0 && place_meeting(x, y - 1, obj_player))
{
    with (obj_player)
    {
        var _enemy = instance_place(x, y + 1, par_enemy);
        
        if (vspd == 0 && _enemy && _enemy.stompable && y <= (_enemy.bbox_top + 4))
        {
            with (_enemy)
            {
                hitBy = other;
                hurt_delay = 10;
                event_user(0);
            }
            
            event_bounce_enemy();
        }
    }
}

if (mypath != -4)
{
    on_path = true;
    has_collision = false;
}

path_follow();

if (ledge_turn && on_ground() && !place_meeting(x + hspd, y + 4, [par_ground, obj_movingsemi]))
    event_wall();

physics_apply();

if (vspd > vspd_max)
    vspd = vspd_max;

if (y > (room_height + 250))
    instance_destroy();
