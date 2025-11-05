if (!instance_exists(obj_optionsmenu) && !instance_exists(obj_manual) && (!instance_exists(obj_extrasselect) || obj_extrasselect.fadeOut) && !in_debug_menu() && obj_player.state == states.actor)
{
    if (!started)
    {
        var _konamied = false;
        var _playergp = input_player_get_gamepad();
        
        if (konamistep < konamilen && input_any_pressed())
        {
            if (input_keyboard_check_pressed(konamicode_keyboard[konamistep]) || (_playergp != -1 && input_gamepad_check_pressed(_playergp, konamicode_controller[konamistep])))
            {
                if (++konamistep == konamilen)
                {
                    scr_fmod_soundeffectONESHOT("event:/sfx/misc/explosion", obj_player.x, obj_player.y);
                    shakecam(40, 5);
                    save_easteregg("freeTheMonkeys");
                }
                
                _konamied = true;
            }
            else
                konamistep = 0;
        }
        
        if (starexists && input_check_pressed("inv"))
        {
            lookingatstars = !lookingatstars;
            starselected = 0;
            
            while (!stars[starselected].active)
            {
                starselected++;
                
                if (starselected < 0 || starselected >= array_length(stars))
                {
                    starselected = _prevselect;
                    break;
                }
            }
        }
        
        hoveredstar = -1;
        
        if (lookingatstars)
        {
            var _prevselect = starselected;
            _dir = input_check_opposing_pressed("left", "right");
            
            do
            {
                starselected += _dir;
                
                if (starselected < 0 || starselected >= array_length(stars))
                {
                    starselected = _prevselect;
                    break;
                }
            }
            until (stars[starselected].active);
            
            if (starselected != _prevselect)
                event_play_oneshot("event:/sfx/pausemenu/move");
            
            hoveredstar = starselected;
        }
        else
        {
            var _prevselect = selected;
            selected = clamp(selected + input_check_opposing_pressed("left", "right"), 0, array_length(options) - 1);
            
            if (selected != _prevselect)
                event_play_oneshot("event:/sfx/pausemenu/move");
            
            if (!_konamied && input_check_pressed("jump"))
                options[selected][1]();
        }
        
        var _dir = input_check_opposing_pressed("down", "up");
        selectedpal += _dir;
        selectedpal = wrap(selectedpal, 0, array_length(availablepal) - 1);
        
        if (_dir != 0)
        {
            if (_dir == -1)
                event_play_oneshot("event:/sfx/misc/palswitchup");
            else
                event_play_oneshot("event:/sfx/misc/palswitchdown");
            
            palindicatoryoff = _dir * 8;
            palindicatoralpha = 5;
            obj_player.curpalette = availablepal[selectedpal];
        }
        
        var _sspr = spr_titlestar;
        var _sbbl = sprite_get_bbox_left(_sspr);
        var _sbbt = sprite_get_bbox_top(_sspr);
        var _sbbr = sprite_get_bbox_right(_sspr);
        var _sbbb = sprite_get_bbox_bottom(_sspr);
        
        for (var _i = 0; _i < array_length(stars); _i++)
        {
            if (!stars[_i].active)
                continue;
            
            var _x = 60 * _i;
            var _y = 0;
            
            if (point_in_rectangle(global.screenmouse_x, global.screenmouse_y, _x + _sbbl, _y + _sbbt, _x + _sbbr, _y + _sbbb))
                hoveredstar = _i;
        }
        
        if (hoveredstar != -1 && !stars[hoveredstar].active)
            hoveredstar = -1;
    }
}

if (started)
{
    housestretch = approach(housestretch, 2 * pi, 0.5);
    
    if (!obj_titlenoise.flung)
    {
        if (housestretch > pi)
        {
            obj_titlenoise.flung = true;
            obj_titlenoise.flungval = 0;
            obj_titlenoise.y -= 32;
            obj_titlenoise.visible = true;
            shakecam(40, 5);
            gamepadvibrate(0.7, 0, 30);
            stop_music();
            scr_fmod_soundeffect(obj_titlenoise.screamsnd, obj_titlenoise.x, obj_titlenoise.y, obj_titlenoise.depth);
            scr_fmod_soundeffectONESHOT("event:/sfx/misc/titleimpact", obj_titlenoise.x, obj_titlenoise.y, obj_titlenoise.depth * 0.75);
        }
    }
    else if (obj_titlenoise.flungval >= 1 && obj_titlenoise.splatted && obj_titlenoise.splattedy > 900)
    {
        if (!instance_exists(obj_titlefade))
            instance_create_depth(x, y, -500, obj_titlefade);
    }
}

palindicatoralpha = max(palindicatoralpha - 0.05, 0);
palindicatoryoff = approach(palindicatoryoff, 0, 0.5);
