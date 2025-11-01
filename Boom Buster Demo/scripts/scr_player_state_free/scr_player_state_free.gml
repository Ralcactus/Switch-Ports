function scr_player_state_free()
{
    if (exit_freeze())
        exit;
    
    var _crouchspd, _acc, _dashspd, _slidespd, _runspd, _slideboost;
    
    if (global.nuclear)
    {
        _runspd = runspd_nuclear;
        _crouchspd = crouchspd_nuclear;
        _acc = acc_nuclear;
        _slidespd = slidespd_nuclear;
        _slideboost = slideboost_nuclear;
        _dashspd = dashspd_nuclear;
    }
    else
    {
        _runspd = runspd;
        _crouchspd = crouchspd;
        _acc = acc;
        _slidespd = slidespd;
        _slideboost = slideboost;
        _dashspd = dashspd;
    }
    
    var _jumped = false;
    
    if (land_anim_delay)
        land_anim_delay--;
    
    if (action != action_free || on_ground())
        cannon_shot = false;
    
    var _crouchout, _dash, _slide, _crouch, _idle, _crouchwalk, _walk, _djump, _jump;
    
    if (ds_list_size(list_carry) == 0)
    {
        var _ledge;
        
		//if (collision_line(x, y + 1, x, y + 192, [par_ground, obj_movingsemi], true, true) == -4)
        if (collision_line(x, y + 1, x, y + 192, par_ground, true, true) == -4) || (collision_line(x, y + 1, x, y + 192, obj_movingsemi, true, true) == -4)
            _ledge = true;
        else
            _ledge = false;
        
        if (_ledge)
            _idle = spr_buster_ledge;
        else
            _idle = spr_buster_idle;
        
        _walk = spr_buster_walk;
        _jump = spr_buster_jump;
        _djump = spr_buster_doublejump;
        _dash = spr_buster_dash;
        _slide = spr_buster_slide;
        var _fall = spr_buster_fall;
        _crouch = spr_buster_crouch;
        _crouchout = spr_buster_crouchout;
        _crouchwalk = spr_buster_crouchwalk;
        
        if (cannon_shot)
            _jump = spr_buster_cannonshoot;
    }
    else
    {
        _idle = spr_buster_idle_carry;
        _walk = spr_buster_walk_carry;
        _jump = spr_buster_jump_carry;
        _djump = spr_buster_doublejump_carry;
        _dash = spr_buster_dash_carry;
        _slide = spr_buster_slide_carry;
        var _fall = spr_buster_fall;
        _crouch = spr_buster_crouch_carry;
        _crouchout = spr_buster_crouchout_carry;
        _crouchwalk = spr_buster_crouchwalk_carry;
        
        if (cannon_shot)
            _jump = spr_buster_cannonshoot;
    }
    
    timer_logic(timer_reset_action);
    timer_logic(timer_rundust);
    timer_logic(timer_invulnerable_flash);
    timer_logic(timer_become_vulnerable);
    
    if (aframe_delay > -1)
        aframe_delay--;
    
    if (aframe_delay == -1)
    {
        if (global.nuclear)
            aframe_delay = 2;
        else if (action == action_spin)
            aframe_delay = 1;
        else if (action == action_dash)
            aframe_delay = 3;
    }
    
    if (action != action_spin && action != action_dash && !global.nuclear)
        aframe_delay = -1;
    
    if (((hspd != 0 || vspd != 0) || global.nuclear) && aframe_delay == 0)
    {
        var _fx = instance_create_layer(x, y, "Particles_Behind", obj_player_aframe);
        _fx.image_alpha = 0.6;
        _fx.image_alpha_to = 0;
        _fx.destroy = 1;
        _fx.anim_sprite = anim_sprite;
        _fx.anim_index = anim_index;
        _fx.image_xscale = facing;
        _fx.pal_sprite = pal_buster;
        _fx.pal_ind = other.myPal;
        _fx.anim_speed = 0;
        
        if (global.nuclear)
            _fx.bm = 1;
        
        var _life;
        
        if (action == action_dash)
            _life = 16;
        else
            _life = 10;
        
        _fx.image_alpha_spd = (_fx.image_alpha - _fx.image_alpha_to) / _life;
    }
    
    var _xAxisBefore = xAxis;
    grounded = on_ground();
    xAxis = input.check[1] - input.check[0];
    
    if (grounded)
        ground_reset_actions();
    
    solid_above = solid_meeting(x, y - 8, obj_solid);
    
    if ((action == action_crouch || action == action_crouch_spin) && !on_ground() && !solid_above)
    {
        var _action = action;
        
        if (_action == action_crouch_spin)
            action = action_spin;
        else
            action = action_free;
    }
    
    if (!grounded)
        coyote_jump++;
    
    if (_xAxisBefore == 0 && xAxis != 0 && can_dust())
        timer_func[timer_rundust]();
    
    if (xAxis != 0 && grounded && action != action_backflip && action != action_spin && action != action_crouch_spin && action != action_dash && action != action_slide && anim_sprite != spr_buster_throw)
        facing = sign(xAxis);
    
    if (action == action_slam)
    {
        hspd = 0;
    }
    else if (action == action_crouch || action == action_crouch_spin)
    {
        hspd = approach(hspd, xAxis * _crouchspd, _acc);
    }
    else if (action == action_dash)
    {
        hspd = facing * _dashspd;
    }
    else if (action == action_backflip)
    {
        hspd = -facing * flipspd;
    }
    else if (action == action_slide)
    {
        hspd = approach(hspd, facing * _slidespd, acc_slide);
    }
    else if (slide_jump)
    {
    }
    else
    {
        hspd = approach(hspd, xAxis * _runspd, _acc);
    }
    
    if ((xAxis != 0 && xAxis != facing) || grounded)
        slide_jump = false;
    
    if (ds_list_size(list_carry) == 0 && grounded && action == action_free && abs(hspd) > 0 && xAxis != 0 && xAxis != sign(hspd) && anim_sprite != spr_buster_skid && anim_sprite != spr_buster_slideskid)
    {
        if (audio_is_playing(skidSnd))
            audio_stop_sound(skidSnd);
        
        skidSnd = audio_play_sound(snd_skid, 0, 0);
        override_play(spr_buster_skid);
    }
    
    if ((action == action_free || action == action_spin) && crouch_input && grounded)
    {
        var _action = action;
        
        if (_action == action_spin)
        {
            action = action_crouch_spin;
        }
        else
        {
            action = action_crouch;
            
            if (ds_list_size(list_carry) > 0)
                override_play(spr_buster_crouchin_carry);
            else
                override_play(spr_buster_crouchin);
        }
    }
    
    if ((action == action_crouch || action == action_crouch_spin) && !crouch_input)
    {
        var _nope = false;
        mask_index = spr_mask_player;
        
        if (solid_meeting(x, y, obj_solid))
            _nope = true;
        
        mask_index = spr_mask_playercrouch;
        
        if (!_nope)
        {
            var _action = action;
            
            if (_action == action_crouch)
            {
                override_play(_crouchout);
                action = action_free;
            }
            else
            {
                action = action_spin;
            }
        }
    }
    
    if (coyote_jump > 6 && jumps == 0)
        jumps = 1;
    
    if (!solid_above && jumps < 2 && input.pressed[4] && !((action == action_crouch || action == action_slide) && solid_above))
    {
        _jumped = true;
        override_sprite = -4;
        anim_index = 0;
        part_particles_create(global.part_over, x, y, global.particles.jumpdust, 1);
        audio_play_sound(snd_jump, 0, 0);
        jumps++;
        jumping = true;
        
        if (action == action_slide || action == action_dash)
        {
            hspd = clamp(hspd, -_runspd, _runspd);
            action = action_free;
            timer[timer_reset_action] = -1;
            
            if (jumps == 1)
                vspd = -jump_strength;
            else
                vspd = -spinjump_strength;
            
            slide_jump = true;
        }
        else if (action == action_crouch)
        {
            action = action_backflip;
            vspd = -backflip_strength;
            jumps = 2;
        }
        else if (jumps == 1)
        {
            vspd = -jump_strength;
        }
        else
        {
            vspd = -spinjump_strength;
        }
    }
    
    if (vspd >= 0)
        jumping = false;
    
    if (jumping)
        jumpTimer++;
    else
        jumpTimer = 0;
    
    if (ds_list_size(list_carry) > 0 && ds_list_find_value(list_carry, 0).throwable && (action == action_free && input.pressed[5] && !place_meeting(x, y, obj_solid)))
    {
        audio_play_sound(snd_throw, 0, 0);
        override_play(spr_buster_throw);
        anim_index = 0;
        
        with (ds_list_find_value(list_carry, 0))
        {
            thrown = true;
            throw_facing = facing;
        }
        
        input_clear(input, 5);
    }
    
    var _dropping = input.pressed[2] && !place_meeting(x, y, obj_solid);
    _dropping = false;
    
    if (((action == action_free || action == action_crouch || action == action_dash || action == action_slide) && input.pressed[5]) || _dropping)
    {
        var _drop = false;
        
        if (_dropping)
        {
            if (ds_list_size(list_carry) > 0)
                _drop = true;
        }
        else
        {
            timer_func[timer_reset_action]();
            ds_list_clear(list_spinwait);
            var _action = action;
            
            if (_action == action_crouch || _action == action_slide)
                action = action_crouch_spin;
            else
                action = action_spin;
            
            audio_play_sound(snd_spin, 0, 0);
            override_sprite = -4;
            coyote_spin = 6;
            timer[timer_reset_action] = spin_time;
        }
        
        if (ds_list_size(list_carry) > 0)
        {
            if (!_drop)
                audio_play_sound(snd_throw, 0, 0);
            
            var _landObj = false;
            var _inst;
            
            if (place_meeting(x, y + 1, obj_movingsemi))
            {
                _inst = instance_place(x, y + 1, obj_movingsemi);
                _landObj = true;
            }
            
            for (var i = 0; i < ds_list_size(list_carry); i++)
            {
                with (ds_list_find_value(list_carry, i))
                {
                    ignore = other.id;
                    ignore_timer = 25;
                    
                    if (_drop)
                    {
                        dropped = true;
                        
                        if (_landObj)
                            landYobj = _inst;
                        else
                            landY = other.y;
                    }
                    else
                    {
                        landY = room_height + 999;
                        tossed = true;
                    }
                    
                    event_user(0);
                }
            }
            
            ds_list_clear(list_carry);
        }
    }
    
    if (action != action_spin && action != action_crouch_spin)
        coyote_spin--;
    
    if (action != action_slide)
        coyote_slide--;
    
    if (!grounded && (action == action_free || action == action_spin || action == action_backflip || action == action_slam || action == action_slide) && input.pressed[6] && !dashed)
    {
        audio_stop_play(snd_dash, 0, 0);
        timer[timer_reset_action] = -1;
        
        if (xAxis != 0)
            facing = xAxis;
        
        dashed = true;
        slide_jump = false;
        grav = 0;
        vspd = 0;
        var _action = action;
        
        if (!on_wall(facing))
        {
            var _par;
            
            if (facing == 1)
                _par = global.particles.dashsmokeR;
            else
                _par = global.particles.dashsmokeL;
            
            part_particles_create(global.part_over, x - (10 * facing), y - 40, _par, 1);
        }
        
        override_sprite = -4;
        action = action_dash;
        timer[timer_reset_action] = dash_time;
    }
    
    if (grounded && !_jumped && input.pressed[6] && action != action_slide)
    {
        override_sprite = -4;
        
        if (xAxis != 0)
            facing = xAxis;
        
        hspd = facing * _slideboost;
        timer_func[timer_reset_action]();
        ds_list_clear(list_spinwait);
        anim_index = 0;
        action = action_slide;
        coyote_slide = 6;
        timer[timer_reset_action] = slide_time;
        audio_stop_play(snd_dash, 0, 0);
    }
    
    var _xAxis = input.pressed[1] - input.pressed[0];
    
    if (action == action_slide && _xAxis != 0 && _xAxis != facing)
    {
        slide_skid = true;
        timer_func[timer_reset_action]();
    }
    
    if (action != action_slide)
        slide_skid = false;
    
    if (can_dust())
    {
        if (timer[timer_rundust] == -1)
            timer[timer_rundust] = 8;
    }
    else
    {
        timer[timer_rundust] = -1;
    }
    
    if (action == action_slam)
        grav = grav_slam;
    else if (action == action_backflip)
        grav = grav_backflip;
    else if (action == action_dash)
        grav = 0;
    else
        grav = grav_normal;
    
    if (action != action_free)
        slam_bounce = false;
    
    if (action == action_crouch || action == action_slide || action == action_crouch_spin)
        mask_index = spr_mask_playercrouch;
    else
        mask_index = spr_mask_player;
    
    var _hspd;
    
    if (global.stage_type == 1)
    {
        _hspd = hspd;
        hspd = _hspd * 0.85;
    }
    
    physics_apply();
    
    if (global.stage_type == 1)
        hspd = _hspd;
    
    if (place_meeting(x, y, obj_cannon))
    {
        var _cannon = instance_place(x, y, obj_cannon);
        
        if (_cannon && ignore_cannon != _cannon)
        {
            ignore_cannon = _cannon;
            cannon_shot = false;
            obj_controller.relative_pos_ease = 0;
            my_cannon = _cannon;
            x = my_cannon.x + 8;
            y = my_cannon.y;
            state = state_cannon;
            reset_action();
            coyote_spin = 0;
            coyote_slide = 0;
            
            with (_cannon)
                event_user(0);
        }
    }
    
    if (action == action_slam)
        vspd_max = vspd_max_slam;
    else
        vspd_max = vspd_max_normal;
    
    vspd = min(vspd, vspd_max);
    var _indbefore = anim_index;
    anim_logic();
    
    if ((anim_sprite == spr_buster_walk || anim_sprite == spr_buster_walk_carry) && _indbefore < 4 && anim_index >= 4)
    {
        var _type;
        
        if (place_meeting(x, y + 1, obj_pipe) || place_meeting(x, y + 1, obj_metalsolid))
            _type = "metal";
        else
            _type = "concrete";
        
        audio_play_sound(asset_get_index(string("snd_footstep_{0}{1}", _type, irandom_range(0, 4))), 0, 0);
    }
    
    if (override_sprite != -4)
        exit;
    
    if (action == action_backflip)
    {
        anim_play(spr_buster_backflip);
        exit;
    }
    else if (action == action_spin)
    {
        anim_play(spr_buster_spin);
        exit;
    }
    else if (action == action_crouch_spin)
    {
        anim_play(spr_buster_crouchspin);
        exit;
    }
    else if (action == action_dash)
    {
        anim_play(_dash);
        exit;
    }
    else if (action == action_slide)
    {
        anim_sprite = _slide;
        exit;
    }
    
    if (on_ground())
    {
        if ((xAxis == 0 && hspd == 0) || (action != action_crouch && on_wall(xAxis)))
        {
            if (action == action_crouch)
                anim_play(_crouch);
            else
                anim_play(_idle);
        }
        else if (action == action_crouch)
        {
            anim_play(_crouchwalk);
        }
        else
        {
            anim_play(_walk);
        }
    }
    else if (slam_bounce)
    {
        anim_play(spr_buster_spring);
    }
    else if (jumps > 1)
    {
        anim_play(_djump);
    }
    else
    {
        anim_play(_jump);
    }
    
    anim_speed = 1;
    
    if ((anim_sprite == spr_buster_walk || anim_sprite == spr_buster_walk_carry) && global.nuclear)
        anim_speed = 1.2;
}
