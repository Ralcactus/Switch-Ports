if (!instance_exists(obj_pizzano_dance))
{
    visible = false;
    exit;
}

switch (state)
{
    case UnknownEnum.Value_1:
        visible = false;
        image_speed = 0;
        image_index = 0;
        
        if (cooldown > 0)
        {
            cooldown--;
        }
        else if (point_distance(x, 0, obj_parent_player.x, 0) <= xThreshold && point_distance(0, y, 0, obj_parent_player.y) <= yThreshold)
        {
            state = UnknownEnum.Value_32;
            attackBuffer = 20;
        }
        
        break;
    
    case UnknownEnum.Value_32:
        visible = true;
        image_speed = 0.35;
        
        if (attackBuffer > 0)
        {
            attackBuffer--;
        }
        else
        {
            with (obj_pizzano_dance)
            {
                if (state != UnknownEnum.Value_32)
                {
                    trapX = other.x;
                    trapY = other.y;
                    event_perform(ev_alarm, 0);
                    other.state = UnknownEnum.Value_1;
                    other.cooldown = other.maxCooldown;
                }
            }
        }
        
        break;
}
