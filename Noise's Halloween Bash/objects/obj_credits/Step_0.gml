if (!endshot)
{
    if (namefade <= 0)
    {
        if (anim >= slowrangea && anim <= slowrangeb)
            animspd = lerp(animspd, slowanimspd, 0.05);
        else
            animspd = lerp(animspd, baseanimspd, 0.008);
        
        animspd2 = approach(animspd2, ((anim2 >= 0.3 && !next) || (anim < 1 && animspd2 <= 0)) ? 0 : baseanimspd, 0.0005);
        
        if (next)
            next = false;
        
        anim2 = min(anim2 + animspd2, 1);
        pumpkinind = (pumpkinind + 0.35) % sprite_get_number(spr_pumpkin);
        
        if (array_length(currnamelist) > 0 || anim < 1)
        {
            var _prevanim = anim;
            anim = min(anim + animspd, 1);
            
            if (_prevanim < 1 && anim >= 1)
                event_user(0);
        }
        
        if (anim >= 1 && !instance_number(obj_creditspumpkin))
        {
            if (array_length(currnamelist) > 0)
            {
                anim = 0;
                animspd = baseanimspd;
                currname = array_shift(currnamelist);
            }
            else
                next = true;
        }
        
        if (anim2 >= 1)
        {
            if (array_length(roles) > 0)
            {
                anim = 0;
                anim2 = 0;
                animspd = baseanimspd;
                animspd2 = baseanimspd;
                currrole = array_shift(roles);
                currnamelist = array_shift(rolenames);
                currname = array_shift(currnamelist);
                next = true;
            }
            else if (!instance_number(obj_creditsnoise) && !instance_number(obj_creditspumpkin))
            {
                endshot = true;
                
                if (perfectrun)
                {
                    save_easteregg("noWay");
                    event_play_oneshot("event:/sfx/misc/creditsperfect");
                }
            }
        }
        
        if (!input_player_using_gamepad())
        {
            if (mouse_check_button_pressed(mb_left) && (cursorspr != spr_creditscursor_slap || cursorind >= 5))
            {
                cursorspr = spr_creditscursor_slap;
                cursorind = 0;
            }
            
            if (cursorspr == spr_creditscursor_slap && (floor(cursorind) == 3 || floor(cursorind) == 4))
            {
                var _effect = false;
                var _il = global.instancelist;
                ds_list_clear(_il);
                var _num = instance_place_list(global.screenmouse_x, global.screenmouse_y, [obj_creditsnoise, obj_creditspumpkin], _il, true);
                
                for (var _i = 0; _i < _num; _i++)
                {
                    var _inst = _il[| _i];
                    
                    switch (_inst.object_index)
                    {
                        case obj_creditsnoise:
                            _effect = true;
                            event_play_oneshot("event:/sfx/misc/creditsnoise");
                            instance_create_depth(_inst.x, _inst.y, depth + 20, obj_creditsdeadnoise);
                            instance_destroy(_inst);
                            break;
                        
                        case obj_creditspumpkin:
                            if (_inst.active)
                            {
                                _effect = true;
                                scr_fmod_soundeffectONESHOT("event:/sfx/misc/pumpkincollect", _inst.x, _inst.y);
                                
                                repeat (5)
                                {
                                    with (instance_create_depth(_inst.x, _inst.y, depth + 20, obj_creditsdeadnoise))
                                    {
                                        sprite_index = spr_pumpkindebris;
                                        image_index = irandom(4);
                                        image_angle = irandom(360);
                                        image_speed = 0;
                                        hsp = irandom_range(-4, 4);
                                        vsp = irandom_range(-6, -2);
                                    }
                                }
                                
                                instance_destroy(_inst);
                            }
                            
                            break;
                    }
                }
                
                ds_list_clear(_il);
                var _angle1 = -((anim * 360) + 90);
                var _posx = floor((get_game_width() / 2) + lengthdir_x(200, _angle1));
                var _posy = floor(get_game_height() + lengthdir_y(get_game_height() / 2, _angle1));
                draw_set_font(global.namefont);
                var _name = is_array(currname) ? currname[0] : currname;
                var _pumpkins = array_create(0);
                
                if (is_array(currname))
                    array_copy(_pumpkins, 0, currname, 1, array_length(currname) - 1);
                
                var _width = string_width(_name);
                var _height = string_height(_name) * (is_array(currname) ? 1.5 : 1);
                
                if (point_in_rectangle(global.screenmouse_x, global.screenmouse_y, _posx - (_width / 2), _posy, _posx + (_width / 2), _posy + _height))
                {
                    anim = 1;
                    _effect = true;
                    
                    with (instance_create_depth(_posx, _posy + (_height / 2), depth + 25, obj_creditsname))
                        name = _name;
                    
                    if (is_array(currname))
                    {
                        var _len = array_length(_pumpkins);
                        var _trows = (_len - 1) div 6;
                        
                        for (var _i = 0; _i < _len; _i++)
                        {
                            var _row = _i div 6;
                            var _rowi = _i % 6;
                            var _x = (_posx - ((min(_len - (_row * 6) - 1, 6) * 80) / 2)) + (80 * _rowi);
                            var _y = (_posy - (_height / 2)) + (40 * (_trows - _row));
                            
                            with (instance_create_depth(_x, _y, depth + 15, obj_creditspumpkin))
                            {
                                face = _pumpkins[_i];
                                hsp = irandom_range(1, -1);
                                vsp = irandom_range(-6, -8);
                                alarm[0] = 60;
                            }
                        }
                    }
                    
                    currname = "";
                }
                
                if (_effect)
                {
                    instance_create_depth(global.screenmouse_x, global.screenmouse_y, depth + 10, obj_creditsslapeffect);
                    event_play_oneshot("event:/sfx/misc/creditsslap");
                    _effect = true;
                }
            }
            
            if (device_mouse_y_to_gui(0) > 33)
            {
                global.gameframe_set_cursor = false;
                window_set_cursor(cr_none);
            }
        }
        
        if (anim2 < 1 || array_length(roles))
            spawnnoisetimer--;
        
        if (spawnnoisetimer <= 0)
        {
            spawnnoisetimer = irandom_range(100, 200);
            var _side = choose(-50, get_game_width() + 50);
            
            with (instance_create_depth(_side, get_game_height() - 32, depth + 5, obj_creditsnoise))
                hsp = -sign(_side) * random_range(1, 1.5);
        }
    }
    else if (namefadeout)
        namefade = max(namefade - 0.05, 0);
}
else
{
    endfade = min(endfade + 0.01, 1);
    
    if (endfade >= 1)
        endtiptimer = max(endtiptimer - 1, 0);
    
    if (perfectrun)
    {
        perfectfade = clamp(perfectfade + perfectstep, 0, 1);
        
        if (perfectstep > 0 && perfectfade == 1)
        {
            perfectstep = 0;
            alarm[1] = 180;
        }
    }
}

if (input_check("attack"))
{
    stop_music();
    player_reset();
    obj_player.state = states.actor;
    room_goto(Titlescreen);
}

cursorind += ((cursorspr == spr_creditscursor_slap) ? 0.5 : 0.35);

if (cursorind >= sprite_get_number(cursorspr))
{
    if (cursorspr == spr_creditscursor_slap)
    {
        cursorspr = spr_creditscursor;
        cursorind = 0;
    }
    else
        cursorind %= sprite_get_number(cursorspr);
}
