function scr_enemy_grabbed()
{
    hsp = 0;
    vsp = 0;
    movespeed = 0;
    image_xscale = -obj_parent_player.xscale;
    baddieStunTimer = 200;
    obj_parent_player.baddieGrabbedID = id;
    
    if (obj_parent_player.state == UnknownEnum.Value_21 || obj_parent_player.state == UnknownEnum.Value_37 || obj_parent_player.state == UnknownEnum.Value_34 || obj_parent_player.state == UnknownEnum.Value_5)
    {
        depth = 0;
        x = obj_parent_player.x;
        
        if (obj_parent_player.sprite_index != spr_player_PZ_hauling_intro)
            y = obj_parent_player.y - 40;
        else if (floor(obj_parent_player.image_index) == 0)
            y = obj_parent_player.y;
        else if (floor(obj_parent_player.image_index) == 1)
            y = obj_parent_player.y - 10;
        else if (floor(obj_parent_player.image_index) == 2)
            y = obj_parent_player.y - 20;
        else if (floor(obj_parent_player.image_index) == 3)
            y = obj_parent_player.y - 30;
        
        image_xscale = -obj_parent_player.xscale;
        
        if (obj_parent_player.sprite_index == spr_player_PZ_lungeHit)
        {
            x = obj_parent_player.x + obj_parent_player.superGrabX;
            y = obj_parent_player.y + obj_parent_player.superGrabY;
        }
    }
    
    with (obj_parent_player)
    {
        scr_getinput();
        move = key_left2 + key_right2;
        
        if (!global.freezeframe && state != UnknownEnum.Value_0 && state != UnknownEnum.Value_37 && state != UnknownEnum.Value_21 && state != UnknownEnum.Value_86 && state != UnknownEnum.Value_34 && state != UnknownEnum.Value_5 && state != UnknownEnum.Value_38 && state != UnknownEnum.Value_33 && state != UnknownEnum.Value_39 && state != UnknownEnum.Value_40 && state != UnknownEnum.Value_41)
        {
            other.x = x;
            other.y = y;
            other.state = UnknownEnum.Value_4;
            other.image_index = 0;
        }
    }
    
    hsp = 0;
    
    if (obj_parent_player.state == UnknownEnum.Value_5)
    {
        if (floor(obj_parent_player.image_index) == 0)
        {
            depth = 0;
            x = obj_parent_player.x + (obj_parent_player.xscale * 10);
            y = obj_parent_player.y;
        }
        
        if (floor(obj_parent_player.image_index) == 1)
        {
            depth = 0;
            x = obj_parent_player.x + (obj_parent_player.xscale * 5);
            y = obj_parent_player.y;
        }
        
        if (floor(obj_parent_player.image_index) == 2)
        {
            depth = 0;
            x = obj_parent_player.x;
            y = obj_parent_player.y;
        }
        
        if (floor(obj_parent_player.image_index) == 3)
        {
            depth = 0;
            x = obj_parent_player.x + (obj_parent_player.xscale * -5);
            y = obj_parent_player.y;
        }
        
        if (floor(obj_parent_player.image_index) == 4)
        {
            depth = 0;
            x = obj_parent_player.x + (obj_parent_player.xscale * -10);
            y = obj_parent_player.y;
        }
        
        if (floor(obj_parent_player.image_index) == 5)
        {
            depth = -8;
            x = obj_parent_player.x + (obj_parent_player.xscale * -5);
            y = obj_parent_player.y;
        }
        
        if (floor(obj_parent_player.image_index) == 6)
        {
            depth = -8;
            x = obj_parent_player.x;
            y = obj_parent_player.y;
        }
        
        if (floor(obj_parent_player.image_index) == 7)
        {
            depth = -8;
            x = obj_parent_player.x + (obj_parent_player.xscale * 5);
            y = obj_parent_player.y;
        }
    }
    
    if (obj_parent_player.state == UnknownEnum.Value_33)
    {
        if (obj_parent_player.character == UnknownEnum.Value_0)
        {
            x = obj_parent_player.x - (obj_parent_player.xscale * 2);
            y = obj_parent_player.y - 70;
        }
        else
        {
            depth = -7;
            x = obj_parent_player.x;
            y = obj_parent_player.y - 40;
        }
    }
    
    sprite_index = baddieSpriteGrabbed;
    image_speed = 0.35;
    
    if (obj_parent_player.state == UnknownEnum.Value_86 && state != UnknownEnum.Value_5)
    {
        var try_x = 0;
        
        while (try_x < 60)
        {
            if (!scr_solid(obj_parent_player.x + (try_x * obj_parent_player.xscale), y) && !scr_slopePlatform(obj_parent_player.x + (try_x * obj_parent_player.xscale), y))
                try_x++;
            else
                break;
        }
        
        x = obj_parent_player.x + (try_x * obj_parent_player.xscale);
        y = obj_parent_player.y;
        hsp = 0;
        vsp = 0;
    }
}
