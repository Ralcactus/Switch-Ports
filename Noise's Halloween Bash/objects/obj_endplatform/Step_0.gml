if (game_paused())
    exit;

flagind = (flagind + 0.35) % sprite_get_number(spr_endplatflag);

if (global.pumpkintotal < 5)
{
    if (leftkicktriggered)
        leftshoeind += 0.35;
    
    if (leftshoeind > sprite_get_number(spr_endplatshoe))
    {
        leftshoeind = 0;
        leftkicked = false;
        leftkicktriggered = false;
    }
    
    if (floor(leftshoeind) >= 3 && floor(leftshoeind) < 6 && leftkicktriggered)
    {
        if (!leftkicked)
        {
            var _prevmask = mask_index;
            mask_index = spr_endplatshoemaskL;
            
            if (place_meeting(x, y, obj_player) && player_collideable())
            {
                obj_player.image_xscale = 1;
                obj_player.dir = 1;
                scr_hurtplayer(0, playerdeath.normal, true, 1.5);
            }
            
            mask_index = _prevmask;
            
            if (!instance_exists(obj_tiptext))
            {
                var _insults = string_get("tips/pumpkin/comebackinsults");
                var _text = "tips/pumpkin/comebackplural";
                
                if (global.pumpkintotal == 4)
                    _text = "tips/pumpkin/comebacksingular";
                
                scr_tiptext(string_get(_text, 5 - global.pumpkintotal, _insults[irandom(array_length(_insults) - 1)]));
            }
            
            leftkicked = false;
        }
    }
    
    if (!leftkicktriggered && obj_player.state != states.hurt)
    {
        var _prevmask = mask_index;
        mask_index = spr_endplatshoemaskL;
        
        if (place_meeting(x, y, obj_player) && player_collideable())
            leftkicktriggered = true;
        
        mask_index = _prevmask;
    }
    
    if (rightkicktriggered)
        rightshoeind += 0.35;
    
    if (rightshoeind > sprite_get_number(spr_endplatshoe))
    {
        rightshoeind = 0;
        rightkicked = false;
        rightkicktriggered = false;
    }
    
    if (floor(rightshoeind) >= 3 && floor(rightshoeind) < 6 && rightkicktriggered)
    {
        if (!rightkicked)
        {
            var _prevmask = mask_index;
            mask_index = spr_endplatshoemaskR;
            
            if (place_meeting(x, y, obj_player) && player_collideable())
            {
                obj_player.image_xscale = -1;
                obj_player.dir = -1;
                scr_hurtplayer(0, playerdeath.normal, true, 1.5);
            }
            
            mask_index = _prevmask;
            
            if (!instance_exists(obj_tiptext))
            {
                var _insults = string_get("tips/pumpkin/comebackinsults");
                var _text = "tips/pumpkin/comebackplural";
                
                if (global.pumpkintotal == 4)
                    _text = "tips/pumpkin/comebacksingular";
                
                scr_tiptext(string_get(_text, 5 - global.pumpkintotal, _insults[irandom(array_length(_insults) - 1)]));
            }
            
            rightkicked = false;
        }
    }
    
    if (!rightkicktriggered && obj_player.state != states.hurt)
    {
        var _prevmask = mask_index;
        mask_index = spr_endplatshoemaskR;
        
        if (place_meeting(x, y, obj_player) && player_collideable())
            rightkicktriggered = true;
        
        mask_index = _prevmask;
    }
}
else
{
    if (instance_exists(block))
        instance_destroy(block);
    
    if (place_meeting(x, y - 1, obj_player) && !playeron)
    {
        playeron = true;
        obj_player.hit_vertical = -1;
        obj_player.hit_horizontal = -1;
        obj_player.step_vertical = -1;
        obj_player.step_horizontal = -1;
        obj_player.collide_destructibles = -1;
        obj_player.state = states.endplatform;
        obj_player.vsp = 0;
        instance_create_depth(0, 0, 0, obj_leaveprompt);
        instance_create_depth(obj_player.x, obj_player.y, obj_player.z, obj_endplatplayer);
    }
    
    if (!place_meeting(x, y - 1, obj_player))
        playeron = false;
}
