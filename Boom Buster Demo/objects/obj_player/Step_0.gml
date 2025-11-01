if (keyboard_check_pressed(vk_f9) && global.debug)
{
    recording = !recording;
    
    if (recording)
    {
        record_xstart = x;
        record_ystart = y;
        record_facing = facing;
    }
    
    if (!recording)
    {
        var _data = ds_map_create();
        ds_map_add(_data, "recording", recorded_movements);
        ds_map_add(_data, "xstart", record_xstart);
        ds_map_add(_data, "ystart", record_ystart);
        ds_map_add(_data, "facing", record_facing);
        var _str = json_encode(_data);
        show_debug_message(_str);
        clipboard_set_text(_str);
        ds_map_destroy(_data);
        recording_frame = 0;
        recorded_movements = [0];
    }
}

if (obj_controller.win || state == state_deac)
{
    for (var i = 0; i <= 10; i++)
    {
        input.check[i] = false;
        input.pressed[i] = false;
    }
}

if (global.stage_type == 1)
{
    if (auto_facing == 1)
    {
        input.check[1] = true;
        input.check[0] = false;
    }
    else if (auto_facing == -1)
    {
        input.check[1] = false;
        input.check[0] = true;
    }
}

if (global.stage_type != 1)
{
    crouch_input = (global.crouch_down && input.check[3]) || input.check[7];
    crouch_input_pressed = (global.crouch_down && input.pressed[3]) || input.pressed[7];
}

switch (state)
{
    case state_free:
        scr_player_state_free();
        break;
    
    case state_hurt:
        scr_player_state_hurt();
        break;
    
    case state_powerup:
        if (anim_index >= powerup_index_change[newPowerup])
        {
            if (!transformed)
            {
                flash_white = true;
                flash_white_alpha = 0.5;
                flash_white_percent = 0.5;
                transformed = true;
            }
            
            if (newPowerup == 4)
            {
                global.nuclear = true;
                
                if (!audio_is_playing(mySnd_nuclear))
                    mySnd_nuclear = audio_play_sound(snd_nuclear, 0, true);
            }
            else
            {
                global.powerup = newPowerup;
            }
        }
        
        global.freeze = 999999;
        anim_logic();
        break;
    
    case state_deac:
        if (exit_freeze())
            exit;
        
        timer_logic(timer_pit);
        break;
    
    case state_intro:
        anim_logic();
        break;
    
    case state_cannon:
        if (exit_freeze())
            exit;
        
        anim_logic();
        timer_logic(timer_invulnerable_flash);
        timer_logic(timer_become_vulnerable);
        
        if (!cannon_shot)
        {
            anim_play(spr_buster_cannon);
            
            if (input.pressed[4])
            {
                if (my_cannon.target_height != -4)
                    bounce_blocks = max(abs((my_cannon.target_height - y) / 64), 4.2);
                else
                    bounce_blocks = my_cannon.bounce_height;
                
                vspd = -calculate_jump(bounce_blocks, grav_normal);
                cannon_shot = true;
                anim_play(spr_buster_cannonshoot);
                anim_index = 3;
                aframe_delay = 0;
                
                with (my_cannon)
                    event_user(1);
                
                my_cannon = -4;
            }
        }
        else
        {
            if (aframe_delay == 0)
            {
                var _fx = instance_create_layer(x, y, "Particles_Behind", obj_player_aframe);
                _fx.image_alpha = 0.7;
                _fx.image_alpha_to = 0;
                _fx.destroy = 1;
                _fx.anim_sprite = anim_sprite;
                _fx.anim_index = anim_index;
                _fx.image_xscale = facing;
                _fx.pal_sprite = pal_buster;
                _fx.pal_ind = other.myPal;
                _fx.anim_speed = 0;
                _fx.bm = 1;
                var _life = 10;
                _fx.image_alpha_spd = (_fx.image_alpha - _fx.image_alpha_to) / _life;
                aframe_delay = 2;
            }
            
            if (aframe_delay)
                aframe_delay--;
            
            physics_apply();
            
            if (vspd >= -2)
            {
                cannon_shot = true;
                ignore_cannon = -4;
                state = state_free;
                aframe_delay = -1;
            }
        }
        
        break;
}

if (flash_white)
{
    flash_white_percent = approach(flash_white_percent, 1, 0.06);
    flash_white_alpha = sin(flash_white_percent * pi);
    
    if (flash_white_percent == 1)
    {
        flash_white_percent = 0;
        flash_white_alpha = 0;
        flash_white = false;
    }
}

set_palette();

if (exit_freeze())
    exit;

timer_logic(timer_meterflash);

if (global.nuclear)
{
    if (global.combo_meter <= 5)
    {
        if (timer[timer_meterflash] == -1)
        {
            if (global.combo_meter <= 1.5)
                timer[timer_meterflash] = 4;
            else
                timer[timer_meterflash] = 7;
        }
    }
    
    if (!audio_is_playing(mySnd_nuclear))
        mySnd_nuclear = audio_play_sound(snd_nuclear, 0, true);
    
    var _seconds = 12;
    global.combo_meter = approach(global.combo_meter, 0, global.combo_metermax / (_seconds * 60));
    
    if (global.combo_meter == 0)
    {
        global.nuclear = false;
        audio_play_sound(snd_losepowerup, 0, 0);
    }
}
else if (audio_is_playing(mySnd_nuclear))
{
    audio_stop_sound(mySnd_nuclear);
    audio_play_sound(snd_nuclear_end, 0, 0);
}

if (global.nuclear && place_meeting(x, y, par_enemy))
{
    var _inst = instance_place(x, y, par_enemy);
    
    with (_inst)
    {
        if (!invincible)
        {
            hitBy = other.id;
            event_user(1);
        }
    }
}

if (global.debug && keyboard_check_pressed(ord("0")))
    event_user(0);

if (place_meeting(x, y, par_hurt))
    event_user(0);

if (keyboard_check_pressed(ord("N")) && global.debug)
    global.combo_meter = global.combo_metermax;

if (state == state_free || state == state_cannon)
{
    if (global.combo_meter == global.combo_metermax)
    {
        if (input.pressed[8])
        {
            var _inst = instance_create_layer(x, y, layer, obj_uranium);
            _inst.visible = false;
        }
    }
    
    var _list = ds_list_create();
    instance_place_list(x, y, par_carry, _list, true);
    
    if (ds_list_size(_list) > 0)
    {
        var _og;
        
        if (ds_list_size(list_carry) > 0)
            _og = ds_list_find_value(list_carry, 0);
        else
            _og = -4;
        
        for (var i = 0; i < ds_list_size(_list); i++)
        {
            var _inst = ds_list_find_value(_list, i);
            var _same;
            
            if (_og != -4)
            {
                if (_inst.col == _og.col)
                    _same = true;
                else
                    _same = false;
            }
            else
            {
                _same = true;
            }
            
            if (_inst.carried == -4 && _inst.ignore != id && !_inst.tossed && !_inst.thrown && _inst.landed && _same)
            {
                _inst.carried = id;
                _inst.mypath = -4;
                
                if (_inst.wings)
                {
                    with (_inst)
                        event_wings_away();
                }
                
                _inst.on_path = false;
                ds_list_add(list_carry, _inst);
                _inst.carry_yoff = 16;
                _inst.wings_sin = 0;
                
                if (room == rm_tutorial_s1a4)
                {
                    with (obj_controls)
                    {
                        if (ID == 0)
                            out = false;
                    }
                }
                
                if (_og == -4)
                    _og = ds_list_find_value(list_carry, 0);
                
                var _snd = audio_play_sound(snd_nab, 0, 0);
                audio_sound_pitch(_snd, 1 + (0.1 * ds_list_size(list_carry)));
            }
        }
    }
    
    ds_list_destroy(_list);
}
