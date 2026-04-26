function defaultSecretState(arg0 = undefined)
{
    var player = obj_parent_player;
    
    if (!is_undefined(arg0))
        player = arg0;
    
    return player.state;
}

function portal_activate(arg0, arg1)
{
    with (arg0)
    {
        var activate = !secretActivated;
        
        if (is_undefined(arg1))
            activate = arg1;
        
        secretActivated = activate;
    }
}

function cutscene_secretPortal_start()
{
    var portal = cutscene_get_actor("SECRETPORTAL");
    var finished = false;
    global.ComboFreeze = 30;
    
    with (obj_parent_player)
    {
        isInSecretPortal = true;
        state = UnknownEnum.Value_110;
        hsp = 0;
        vsp = 0;
        sprite_index = spr_hurt;
        image_speed = 0.35;
        
        if (instance_exists(portal))
        {
            targetDoor = portal.targetDoor;
            targetRoom = portal.targetRoom;
            secretPortal = true;
            x = lerp(x, portal.x, 0.5);
            y = lerp(y, portal.y, 0.5);
            
            if (portal.sprite_index == spr_secretPortal_tele)
            {
                scale = 1 - (min(portal.image_index, 9) / 9);
                
                if (floor(portal.image_index) >= (portal.image_number - 1))
                {
                    finished = true;
                    scale = 0;
                }
            }
        }
    }
    
    if (finished)
        cutscene_event_end();
}

function cutscene_secretPortal_middle()
{
    var portal = cutscene_get_actor("SECRETPORTAL");
    var finished = true;
    global.ComboFreeze = 30;
    
    with (obj_parent_player)
    {
        isInSecretPortal = true;
        state = UnknownEnum.Value_110;
        hsp = 0;
        vsp = 0;
    }
    
    if (finished)
    {
        instance_destroy(portal);
        
        if (!instance_exists(obj_fadeoutTransition))
        {
            if (!global.RoomIsSecret)
                global.RoomIsSecret = true;
            
            event_play_oneshot("event:/SFX/general/door");
            instance_create(0, 0, obj_fadeoutTransition);
        }
        
        cutscene_event_end();
    }
}

function cutscene_secretPortal_preend()
{
    static portal = -4;
    
    var finished = false;
    var temp_state = storedState;
    global.ComboFreeze = 30;
    
    with (obj_parent_player)
    {
        isInSecretPortal = true;
        state = UnknownEnum.Value_110;
        hsp = 0;
        vsp = 0;
        
        switch (temp_state)
        {
            case UnknownEnum.Value_65:
            case UnknownEnum.Value_64:
            case UnknownEnum.Value_63:
                sprite_index = spr_mach2;
                break;
            
            case UnknownEnum.Value_87:
            case UnknownEnum.Value_96:
            case UnknownEnum.Value_97:
                sprite_index = spr_cottonidle;
                break;
            
            default:
                sprite_index = spr_bodyslamfall;
                break;
        }
        
        image_speed = 0.35;
        
        if (!instance_exists(obj_fadeoutTransition))
        {
            scale = approach(scale, 1, 0.05);
            
            if (!instance_exists(portal))
            {
                portal = instance_create(x, y + 14, obj_secretPortalexit);
            }
            else if (scale >= 1)
            {
                scale = 1;
                finished = true;
            }
        }
    }
    
    if (finished)
        cutscene_event_end();
}

function cutscene_secretPortal_end()
{
    static wait_timer = 0;
    
    var temp_state = storedState;
    var finished = false;
    global.ComboFreeze = 30;
    wait_timer++;
    
    with (obj_parent_player)
    {
        isInSecretPortal = true;
        state = UnknownEnum.Value_110;
        hsp = 0;
        vsp = 0;
        
        if (wait_timer > 10)
        {
            flash = true;
            verticalMovespeed = 0;
            movespeed = 0;
            
            switch (temp_state)
            {
                case UnknownEnum.Value_65:
                    if (movespeed < 12)
                        movespeed = 12;
                    
                    break;
                
                case UnknownEnum.Value_64:
                    if (movespeed < 10)
                        movespeed = 10;
                    
                    break;
                
                case UnknownEnum.Value_69:
                    image_index = 0;
                    sprite_index = spr_bodyslamstart;
                    vsp = -6;
                    state = UnknownEnum.Value_51;
                    break;
            }
            
            state = temp_state;
            wait_timer = 0;
            finished = true;
        }
    }
    
    if (finished)
        cutscene_event_end();
}
