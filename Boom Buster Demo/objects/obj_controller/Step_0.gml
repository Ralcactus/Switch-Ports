flash_overlay = approach(flash_overlay, 0, 0.08);
hp_spr = asset_get_index(string("spr_ui_hp{0}", global.hp));

if (global.debug)
{
    if (keyboard_check_pressed(ord("T")))
        follow_target = !follow_target;
    
    if (keyboard_check_pressed(ord("M")))
        audio_sound_set_track_position(global.bgmPlay, audio_sound_get_loop_end(global.bgmPlay) - 2);
    
    if (keyboard_check_pressed(ord("1")))
        score_add(35);
    
    if (keyboard_check_pressed(vk_f2))
        cam_stretch = !cam_stretch;
}

if (fps_caption_timer)
    fps_caption_timer--;

if (fps_caption_timer == 0)
    fps_caption_timer = 20;

if (global.freeze)
{
    global.freeze--;
    
    if (global.freeze == 0)
        global.freeze_func();
}

if (!(exit_freeze() && !global.hurt))
{
    combo_meter_lerp = lerp(combo_meter_lerp, global.combo_meter, 0.22);
    global.combo_meter = clamp(global.combo_meter, 0, global.combo_metermax);
    pattern_x -= 0.25;
    pattern_y += 0.16666666666666666;
    
    if (pattern_x == sprite_get_width(spr_charpattern) || pattern_x == -sprite_get_width(spr_charpattern))
        pattern_x -= pattern_x;
    
    if (pattern_y == sprite_get_height(spr_charpattern))
        pattern_y -= pattern_y;
}

if (!exit_freeze())
{
    var _yoff;
    
    if (!endless)
        _yoff = -130;
    else
        _yoff = 0;
    
    if (global.hurt)
        hp_ind += (sprite_get_speed(hp_spr) / 60);
    
    if (hp_ind >= sprite_get_number(hp_spr))
        hp_ind -= hp_ind;
    
    if (timer[timer_dollars_flash])
        part_particles_create(global.part_gui, 1314 + irandom_range(0, 292), 834 + _yoff + irandom_range(0, 63), global.particles.sparkleGreen, 1);
    
    if (boms_leftUI != boms_left)
    {
        boms_leftUI = boms_left;
        anim_bombfuse = 24;
        boms_leftOffset = 12;
        spark_posTo = 1 - (boms_left / boms_total);
        
        if (spark_posTo == 1)
            spark_pos = 1;
        
        if (spark_pos == 1)
            part_particles_create(global.part_gui, 1427, 374, global.particles.smoke, 1);
        
        if (boms_leftUI == 0)
        {
            if (room != rm_tutorial_s1a5)
                event_user(0);
        }
    }
    
    if (keyboard_check_pressed(ord("F")) && global.debug)
        event_user(0);
    
    spark_pos = lerp(spark_pos, spark_posTo, 0.5);
    
    if (anim_bombfuse)
    {
        bombfuse_ind += (sprite_get_speed(spr_ui_bombSpark) / 60);
        
        if (bombfuse_ind >= sprite_get_number(spr_ui_bombSpark))
            bombfuse_ind -= bombfuse_ind;
        
        anim_bombfuse--;
    }
    
    if (boms_leftOffset)
        boms_leftOffset--;
}

if (!exit_freeze() && !instance_exists(obj_stagestart_boss))
{
    if (ds_list_find_index(list_timestamps, bridget_timer) != -1)
    {
        for (var i = 0; i < ds_list_size(global.list_elements); i++)
        {
            if (ds_list_find_value(global.list_elements, i).timestamp != bridget_timer)
                continue;
            
            var _element = ds_list_find_value(global.list_elements, i);
            
            switch (_element.row)
            {
                case 0:
                case 1:
                    bridget_element = _element;
                    bridget_state = bridget_state_pull;
                    
                    if (_element.row == 0)
                        bridget_item = _element.ind;
                    else
                        bridget_item = 3;
                    
                    bridget_sprite = bridget_get("pull");
                    bridget_sub = 0;
                    
                    if (variable_struct_exists(_element, "spd"))
                        bridget_itemspd = _element.spd;
                    else
                        bridget_itemspd = 1;
                    
                    break;
                
                case 2:
                    var _x, _y, _path, _path_pos;
                    
                    if (struct_exists(_element, "mypath"))
                    {
                        _path = asset_get_index(_element.mypath);
                        _path_pos = _element.path_pos;
                        _x = path_get_x(_path, _path_pos);
                        _y = path_get_y(_path, _path_pos);
                    }
                    else
                    {
                        _path = -4;
                        _path_pos = 0;
                        _x = _element.x;
                        _y = _element.y;
                    }
                    
                    var _obj = asset_get_index(asset_obj[2][_element.ind]);
                    var _spawn = instance_create_layer(_x, _y, "Instances", _obj);
                    _spawn.mypath = _path;
                    _spawn.path_pos = _path_pos;
                    
                    if (_obj != obj_food)
                        part_particles_create(global.part_over, _x, _y, global.particles.smoke, 1);
                    
                    break;
                
                case 3:
                    var _x, _y, _path, _path_pos;
                    
                    if (struct_exists(_element, "mypath"))
                    {
                        _path = asset_get_index(_element.mypath);
                        _path_pos = _element.path_pos;
                        _x = path_get_x(_path, _path_pos);
                        _y = path_get_y(_path, _path_pos);
                    }
                    else
                    {
                        _path = -4;
                        _path_pos = 0;
                        _x = _element.x;
                        _y = _element.y;
                    }
                    
                    var _spawn = instance_create_layer(_x, _y, "Instances", obj_grodiespawn);
                    _spawn.enemy = asset_obj[3][_element.ind];
                    _spawn.facing = _element.facing;
                    _spawn.mypath = _path;
                    _spawn.path_pos = _path_pos;
                    break;
                
                case 4:
                    if (_element.ind == 0)
                    {
                        channel_change(_element.channel);
                        break;
                    }
                    else if (_element.ind == 2)
                    {
                        wizard_sprite = asset_get_index(_element.spr_change);
                        wizard_sub = 0;
                    }
                    
                    break;
                
                case 5:
                    if (asset_obj[5][_element.ind] == "obj_lightning")
                    {
                        instance_create_layer(_element.x, _element.y, "Instances", obj_lightning);
                    }
                    else if (asset_obj[5][_element.ind] == "obj_lightsout")
                    {
                        var _spawn = instance_create_depth(_element.x, _element.y, layer_get_depth(layer_get_id("GUI")) - 1, obj_lightsout);
                        _spawn.timer[0] = _element.length * 60;
                    }
                    else if (asset_obj[5][_element.ind] == "obj_fireball")
                    {
                        var _spawn = instance_create_layer(_element.x - (384 * sign(_element.hspd)), _element.y, "Instances", obj_fireball);
                        _spawn.hspd = _element.hspd;
                        audio_stop_play(snd_flame, 0, 0);
                    }
                    
                    break;
                
                case 6:
                    if (asset_obj[6][_element.ind] == "play sound")
                        audio_play_sound(asset_get_index(_element.snd), 0, 0);
                    
                    break;
            }
        }
    }
    
    if (bridget_timer > last_timestamp && bridget_state == bridget_state_dig && !bridget_set_finishtimer)
    {
        timer[timer_bridget_finish] = 30;
        bridget_set_finishtimer = true;
    }
    
    bridget_timer++;
}

if (!exit_freeze())
{
    timer_logic(timer_dollars_flash);
    timer_logic(timer_bridget);
    timer_logic(timer_bridget_finish);
    
    if (!instance_exists(obj_fx_combo_bar))
        timer_logic(timer_win);
    
    timer_logic(timer_channel);
    timer_logic(timer_hey);
    timer_logic(timer_foodbar_flash);
}

if (!exit_freeze() && !instance_exists(obj_paused) && !instance_exists(obj_stagestart) && !win)
{
    if (global.input[0].pressed[9])
        instance_create_depth(0, 0, layer_get_depth(layer_get_id("Transition")), obj_paused);
}
