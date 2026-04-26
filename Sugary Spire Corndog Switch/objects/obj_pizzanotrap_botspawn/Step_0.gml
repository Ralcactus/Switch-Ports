if (!instance_exists(obj_pizzano_dance))
{
    visible = false;
    exit;
}

if (!importantEnemy && enemyID != -4 && !instance_exists(enemyID) && ds_list_find_index(global.BaddieRoom, id) == -1)
    ds_list_add(global.BaddieRoom, id);

var not_in_list = ds_list_find_index(global.BaddieRoom, id) == -1;

switch (state)
{
    case UnknownEnum.Value_1:
        if (importantEnemy || not_in_list)
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
                    trap_y = other.y;
                    event_perform(ev_alarm, 0);
                    other.state = UnknownEnum.Value_1;
                    other.cooldown = other.maxCooldown;
                    botthrown = true;
                    botsactive = true;
                }
            }
        }
        
        break;
}
