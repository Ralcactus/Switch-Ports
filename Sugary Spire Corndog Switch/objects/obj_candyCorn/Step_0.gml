baddieCollisionBoxEnabled = state != UnknownEnum.Value_23 && introTriggered;

if (state != UnknownEnum.Value_4 && state != UnknownEnum.Value_9)
    thrown = 0;

if (state == UnknownEnum.Value_23)
{
    if (introTriggered)
    {
        if (sprite_index != spr_candyCornIntro || animation_end())
        {
            state = UnknownEnum.Value_2;
            sprite_index = spr_candyCornRun;
            image_index = 0;
        }
    }
    else
    {
        var target_player = instance_nearest(x, y, obj_parent_player);
        
        if (((target_player.x > (x - 400) && target_player.x < (x + 400)) && (y <= (target_player.y + 60) && y >= (target_player.y - 60))) && state == UnknownEnum.Value_23)
        {
            introTriggered = true;
            faceTowardsPlayerFunc();
            var num_bones = irandom_range(2, 3);
            
            repeat (num_bones)
            {
                with (instance_create(x + irandom_range(-20, 20), y + (sprite_height / 3), obj_debris))
                    sprite_index = spr_candyCornIntroDebris;
            }
        }
        else
        {
            image_index = 0;
        }
    }
}
else
{
    event_inherited();
}

if (state == UnknownEnum.Value_2)
{
    if (sprite_index == spr_candyCornPunch)
    {
        if (!hitboxcreate && image_index >= 6)
        {
            hitboxcreate = true;
            
            with (instance_create(x, y, obj_forkhitbox, 
            {
                ID: other.id
            }))
            {
                ID = other.id;
                image_xscale = other.image_xscale;
                image_index = other.image_index;
                depth = -1;
            }
            
            alarm[3] = 5;
            punchCooldown = 70;
        }
        
        if (animation_end())
        {
            sprite_index = spr_candyCornRun;
            image_index = 0;
            faceTowardsPlayerFunc();
            hitboxcreate = false;
        }
    }
    else
    {
        var target_player = instance_nearest(x, y, obj_parent_player);
        
        if (sign(target_player.x - x) == sign(image_xscale) && abs(target_player.x - x) < 100 && punchCooldown <= 0)
        {
            sprite_index = spr_candyCornPunch;
            image_index = 0;
        }
    }
    
    if (sprite_index == spr_candyCornPunch)
        movespeed = hitboxcreate ? 4 : 2;
    else
        movespeed = 6;
}
else
{
    movespeed = 0;
}

punchCooldown = max(punchCooldown - 1, 0);
