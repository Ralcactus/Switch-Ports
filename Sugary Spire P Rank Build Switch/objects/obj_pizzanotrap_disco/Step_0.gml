if (!instance_exists(obj_pizzano_dance))
    exit;

switch (state)
{
    case states.normal:
        y = approach(y, ystart, 6);
        
        if (cooldown > 0)
            cooldown--;
        else if (point_distance(x, 0, obj_player.x, 0) <= threshold_x && point_distance(0, y, 0, obj_player.y) <= threshold_y && y == ystart)
        {
            state = states.Throw;
            attack_buffer = 5;
        }
        
        break;
    
    case states.freefall:
        hsp = 0;
        vsp = 10;
        scr_collide();
        
        if (grounded && vsp > 0)
            state = states.normal;
        
        break;
    
    case states.Throw:
        if (attack_buffer > 0)
            attack_buffer--;
        else
        {
            with (obj_pizzano_dance)
            {
                if (state != states.Throw)
                {
                    trap_x = other.x;
                    trap_y = other.y;
                    event_perform(ev_alarm, 0);
                    other.state = states.normal;
                    other.cooldown = other.cooldown_max;
                }
            }
        }
        
        break;
}
