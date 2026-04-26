if (!instance_exists(obj_pizzano_dance))
    exit;

switch (state)
{
    case UnknownEnum.Value_1:
        y = approach(y, ystart, 6);
        
        if (cooldown > 0)
        {
            cooldown--;
        }
        else if (point_distance(x, 0, obj_parent_player.x, 0) <= threshold_x && point_distance(0, y, 0, obj_parent_player.y) <= threshold_y && y == ystart)
        {
            state = UnknownEnum.Value_32;
            attack_buffer = 5;
        }
        
        break;
    
    case UnknownEnum.Value_69:
        hsp = 0;
        vsp = 10;
        
        if (grounded && vsp > 0)
            state = UnknownEnum.Value_1;
        
        break;
    
    case UnknownEnum.Value_32:
        if (attack_buffer > 0)
        {
            attack_buffer--;
        }
        else
        {
            with (obj_pizzano_dance)
            {
                if (state != UnknownEnum.Value_32)
                {
                    trapX = other.x;
                    trap_y = other.y;
                    event_perform(ev_alarm, 0);
                    other.state = UnknownEnum.Value_1;
                    other.cooldown = other.cooldown_max;
                }
            }
        }
        
        break;
}
