function cutscene_rosetteMines_prestart()
{
    var finished = false;
    
    with (obj_parent_player)
    {
        state = UnknownEnum.Value_110;
        image_speed = 0.35;
        
        if (grounded)
        {
            if (sprite_index == spr_fall)
            {
                hsp = 0;
                image_index = 0;
                sprite_index = spr_land;
            }
            
            if (sprite_index != spr_land || animation_end())
            {
                hsp = 0;
                finished = true;
            }
        }
        else
        {
            hsp = approach(hsp, 0, 5);
            sprite_index = spr_fall;
        }
    }
    
    if (finished)
        cutscene_event_end();
}

function cutscene_rosetteMines_start()
{
    var finished = false;
    var target_x = obj_rosette.x - 64;
    
    with (obj_parent_player)
    {
        image_speed = 0.35;
        
        if (sign(target_x - x) != 0)
            xscale = -sign(x - target_x);
        
        if (movespeed < 7)
            movespeed += 0.5;
        else
            movespeed = min(movespeed, 7);
        
        hsp = lengthdir_x(movespeed, point_direction(x, 0, target_x, 0));
        
        if (hsp != 0)
        {
            if (movespeed < 3 && move != 0)
                image_speed = 0.35;
            else if (movespeed > 3 && movespeed < 6)
                image_speed = 0.45;
            else
                image_speed = 0.6;
            
            sprite_index = spr_move;
        }
        
        if (point_distance(x, 0, target_x, 0) <= 7 && grounded)
        {
            movespeed = 0;
            hsp = 0;
            vsp = 0;
            image_speed = 0.35;
            x = target_x;
            
            if (sign(obj_rosette.x - x) != 0)
                xscale = -sign(x - obj_rosette.x);
            
            finished = true;
        }
    }
    
    if (finished)
    {
        obj_rosette.sprite_index = spr_rosettegivetreat;
        obj_rosette.image_index = 0;
        cutscene_event_end();
    }
}

function cutscene_rosetteMines_middle()
{
    var finished = false;
    
    with (obj_parent_player)
    {
        image_speed = 0.35;
        sprite_index = spr_idle;
    }
    
    with (obj_rosette)
    {
        sprite_index = spr_rosettegivetreat;
        
        if (animation_end())
            finished = true;
    }
    
    if (finished)
    {
        obj_parent_player.sprite_index = spr_player_PZ_donutGet;
        obj_parent_player.image_index = 7;
        obj_rosette.sprite_index = spr_rosettegavetreat;
        cutscene_event_end();
    }
}

function cutscene_rosetteMines_grab()
{
    var finished = false;
    
    with (obj_parent_player)
    {
        image_speed = 0.35;
        sprite_index = spr_player_PZ_donutGet;
        
        if (floor(image_index) >= 19)
            global.ComboTime = 60;
        
        if (animation_end())
            finished = true;
    }
    
    if (finished)
        cutscene_event_end();
}

function cutscene_rosetteMines_end()
{
    var button_string = get_control_string(global.key_shoot);
    global.treat = true;
    scr_controlprompt("[spr_buttonfont]" + button_string + "[spr_promptfont] Throw Donut");
    
    with (obj_parent_player)
        state = UnknownEnum.Value_1;
    
    cutscene_event_end();
}
