if (!global.hitstunEnabled)
{
    global.freezeframe = false;
    exit;
}

global.hitstunalarm = round(freezeval);

if (!freezetype)
    global.hitstunalarm = 5;

if (!global.freezeframe)
{
    with (obj_parent_player)
    {
        if (state != UnknownEnum.Value_0)
        {
            frozenState = state;
            frozenSpriteIndex = sprite_index;
            frozenImageIndex = image_index;
            frozenImageSpeed = image_speed;
            frozenMoveSpeed = movespeed;
            frozenGrav = grav;
            frozenSmash = freeFallSmash;
            frozenHsp = hsp;
            frozenVsp = vsp;
            frozenJumpBuffer = inputBufferJump;
            
            for (var i = 0; i < 10; i++)
                frozenAlarm[i] = alarm_get(i);
            
            state = UnknownEnum.Value_0;
        }
    }
    
    with (obj_parent_baddie)
    {
        if (state != UnknownEnum.Value_9)
        {
            frozenState = state;
            frozenSpriteIndex = sprite_index;
            frozenImageIndex = image_index;
            frozenImageSpeed = image_speed;
            frozenMoveSpeed = movespeed;
            frozenGrav = grav;
            frozenHsp = hsp;
            frozenVsp = vsp;
            state = UnknownEnum.Value_9;
        }
    }
    
    with (obj_parent_boss)
    {
        frozenState = state;
        frozenSpriteIndex = sprite_index;
        frozenImageIndex = image_index;
        frozenImageSpeed = image_speed;
        frozenMoveSpeed = movespeed;
        frozenGrav = grav;
        frozenHsp = hsp;
        frozenVsp = vsp;
        state = UnknownEnum.Value_4;
    }
    
    with (obj_parent_aftereffect)
    {
        for (var i = 0; i < 2; i++)
            frozenAlarm[i] = alarm_get(i);
        
        frozen = true;
        
        for (var i = 0; i < 2; i++)
        {
            if (alarm_get(i) > -1)
                alarm_set(i, -1);
        }
    }
    
    for (var i = 0; i < 3; i++)
    {
        frozenAlarm[i] = alarm_get(i);
        
        if (alarm_get(i) > -1)
            alarm_set(i, -1);
    }
    
    frozen = true;
    
    with (obj_tv)
    {
        frozenAlarm = alarm[1];
        alarm[1] = -1;
        frozen = true;
    }
    
    global.freezeframe = true;
}

p1Vibration(30, 25);
