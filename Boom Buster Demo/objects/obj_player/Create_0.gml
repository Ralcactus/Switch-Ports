recording = false;
recorded_movements = array_create(0);
recording_frame = 0;
last_recording_spr = -99999;
last_recording_ind = -99999;
last_recording_facing = -99999;
last_recording_x = -99999;
last_recording_y = -99999;
xAxis = 0;
yAxis = 0;
crouch_input = false;
auto_facing = 1;

reset_action = function()
{
    hspd = 0;
    vspd = 0;
    timer_func[timer_reset_action]();
    jumps = 0;
    grav = grav_normal;
    aframe_delay = -1;
};

physics_init();
runspd = 12;
runspd_nuclear = 14;
crouchspd = 4;
crouchspd_nuclear = 6;
flipspd = 6;
dashspd = 15;
dashspd_nuclear = 16;
slideboost = 15.5;
slideboost_nuclear = 16.5;
slidespd = 12;
slidespd_nuclear = 13;
acc = 1.2;
acc_nuclear = 1.4;
acc_slide = 0.5;
grav_normal = 1.7;
grav_backflip = 1.9;
grav_slam = 5;
grav = grav_normal;
vspd_max_normal = 32;
vspd_max_slam = 40;
vspd_max_hurt = 20;
jumps = 0;
vspd_max = vspd_max_normal;

ground_reset_actions = function()
{
    var _action = action;
    
    if (_action == action_backflip)
        action = action_free;
    
    variable_jump = false;
    jumps = 0;
    coyote_jump = 0;
    variable_jump = false;
    dashed = false;
};

jump_strength = calculate_jump(3.2, grav_normal);
spinjump_strength = calculate_jump(1.35, grav_normal);
backflip_strength = calculate_jump(5, grav_backflip);
slam_strength = calculate_jump(5.1, grav_normal);
coyote_jump = 0;
jumping = false;
jumpTimer = 0;
bounce_blocks_hold = 2;
bounce_blocks = 1;
slam_bounce = false;
state_free = 0;
state_hurt = 1;
state_powerup = 2;
state_deac = 3;
state_intro = 4;
state_cannon = 5;
state = state_free;

set_palette = function()
{
    if (global.nuclear)
    {
        if (meter_flash)
            myPal = global.palette + 1;
        else
            myPal = sprite_get_width(pal_buster) - 1;
    }
    else
    {
        myPal = global.palette + 1;
        meter_flash = false;
    }
};

set_palette();
cannon_shot = false;
ignore_cannon = -4;
my_cannon = -4;
action_free = 0;
action_crouch = 1;
action_crouch_spin = 2;
action_spin = 3;
action_dash = 4;
action_backflip = 5;
action_slide = 6;
action_slam = 7;
action = action_free;
dash_time = 15;
spin_time = 20;
slide_time = 25;
slide_jump = false;
auto_slide = true;
slide_skid = false;
dashed = false;
coyote_spin = 0;
coyote_slide = 0;
spr_prev = 0;
ind_prev = 0;
invulnerable = false;
invulnerable_flash = false;

event_ymove = function()
{
    if (vspd > 0 && place_meeting(x, y + 1, par_enemy))
    {
        var _enemy = instance_place(x, y + 1, par_enemy);
        
        if (_enemy && _enemy.stompable && y <= (_enemy.bbox_top + 4))
        {
            with (_enemy)
            {
                hitBy = other;
                hurt_delay = 10;
                event_user(0);
            }
            
            event_bounce_enemy();
            return false;
        }
    }
    
    return true;
};

event_wall = function()
{
    if (place_meeting(x + sign(hspd), y, obj_reverseblock))
    {
        var _block = instance_place(x + sign(hspd), y, obj_reverseblock);
        auto_facing = sign(_block.image_xscale);
        
        if (sign(hspd) != auto_facing)
            hspd = 14 * auto_facing;
    }
    else
    {
        hspd = 0;
    }
    
    slide_jump = false;
};

event_bounce = function()
{
    override_sprite = -4;
    timer[timer_reset_action] = -1;
    timer_func[timer_reset_action]();
    
    if (input.check[4])
        vspd = -calculate_jump(bounce_blocks_hold, grav);
    else
        vspd = -calculate_jump(bounce_blocks, grav);
    
    jumps = 1;
    dashed = 0;
    bounce_blocks = 1;
    bounce_blocks_hold = jump_strength;
};

event_bounce_enemy = function()
{
    override_sprite = -4;
    jumps = 1;
    dashed = 0;
    var _action = action;
    timer[timer_reset_action] = -1;
    timer_func[timer_reset_action]();
    
    if (input.check[4])
        vspd = -jump_strength - 1.5;
    else
        vspd = -12;
    
    if (_action == action_slam)
    {
        if (crouch_input)
        {
        }
        else
        {
            slam_bounce = true;
            vspd = -slam_strength;
            jumps = 2;
        }
    }
};

list_carry = ds_list_create();
list_spinwait = ds_list_create();
skidSnd = -4;

event_floor = function()
{
    if (state == state_hurt)
    {
        vspd = 0;
        exit;
    }
    
    if (crouch_input && (action == action_free || action == action_backflip || action == action_spin))
    {
        var _action = action;
        
        if (_action == action_spin)
        {
            action = action_crouch_spin;
        }
        else
        {
            if (hspd == 0)
            {
                anim_sprite = spr_buster_crouch;
                anim_index = 2;
            }
            else
            {
                anim_play(spr_buster_crouchwalk);
            }
            
            action = action_crouch;
        }
    }
    
    if (action == action_backflip)
        hspd = 0;
    
    if (!land_anim_delay)
    {
        if (ds_list_size(list_carry) == 0 && (action == action_free || action == action_backflip))
            override_play(spr_buster_land);
        
        if (action == action_slam)
        {
            hspd = 0;
            screen_shake(12, 12, 1);
            part_particles_create(global.part_over, x, y, global.particles.dustland, 1);
        }
        else
        {
            audio_play_sound(snd_land, 0, 0);
            part_particles_create(global.part_over, x, y, global.particles.dustland, 1);
        }
    }
    
    slam_bounce = false;
    
    if (action == action_slam)
    {
        if (crouch_input)
        {
        }
        else
        {
            vspd = -slam_strength;
            slam_bounce = true;
            jumps = 2;
        }
        
        action = action_free;
    }
    
    if (!slam_bounce)
        vspd = 0;
};

event_ceiling = function()
{
    vspd = 0;
    
    if (place_meeting(x, y - 2, par_block))
    {
        part_particles_create(global.part_over, x, bbox_top, global.particles.smack, 1);
        var _list = ds_list_create();
        instance_place_list(x, y - 2, par_block, _list, true);
        
        for (var i = 0; i < ds_list_size(_list); i++)
        {
            with (ds_list_find_value(_list, i))
                event_user(0);
        }
        
        ds_list_destroy(_list);
    }
};

can_dust = function()
{
    return xAxis != 0 && !solid_meeting(x + xAxis, y, obj_solid) && !on_wall(xAxis) && grounded && action == action_free && abs(hspd) > 0;
};

input = global.input[0];
anim_init();
facing = 1;
aframe_delay = -1;
flash_white = false;
flash_white_alpha = 0;
flash_white_percent = 0;

event_flash_white = function()
{
    flash_white = true;
    flash_white_alpha = 0;
    flash_white_percent = 0;
};

land_anim_delay = 0;

event_animend = function()
{
    switch (anim_sprite)
    {
        case spr_buster_jump:
            anim_index = 5;
            break;
        
        case spr_buster_doublejump:
            anim_index = 4;
            break;
        
        case spr_buster_slide:
        case spr_buster_slide_carry:
            anim_index = 2;
            break;
        
        case spr_buster_jump_carry:
            anim_index = 6;
            break;
        
        case spr_buster_doublejump_carry:
            anim_index = 5;
            break;
        
        case spr_buster_backflip:
        case spr_buster_cannonshoot:
            anim_index = 4;
            break;
        
        case spr_buster_spring:
            anim_index = 11;
            break;
        
        case spr_buster_powerup_rocket:
        case spr_buster_powerup_nuclear:
            global.freeze = -1;
            state = state_prev;
            anim_sprite = spr_prev;
            anim_index = ind_prev;
            transformed = false;
            
            with (obj_controls)
                out = true;
            
            with (obj_block)
            {
                if (ID == 1)
                {
                    for (var i = 0; i < image_yscale; i++)
                        part_particles_create(global.part_over, x + 32, y + 32 + (i * 64), global.particles.smoke, 1);
                    
                    instance_destroy();
                }
            }
            
            break;
        
        case spr_buster_taunt:
            if (instance_exists(obj_stagestart))
            {
                state = state_free;
                global.freeze = 0;
                anim_play(spr_buster_idle);
            }
            
            break;
    }
    
    if (override_sprite != -4)
        override_sprite = -4;
};

pit = false;
timer_reset_action = 0;
timer_rundust = 1;
timer_reset_state = 2;
timer_invulnerable_flash = 3;
timer_become_vulnerable = 4;
timer_pit = 5;
timer_meterflash = 6;
timer[timer_reset_action] = -1;

timer_func[timer_reset_action] = function()
{
    timer[timer_reset_action] = -1;
    var _action = action;
    solid_above = solid_meeting(x, y - 8, obj_solid);
    var _newaction;
    
    if (action == action_crouch || action == action_slide || action == action_crouch_spin)
        _newaction = action_crouch;
    else
        _newaction = action_free;
    
    if (_action == action_dash)
    {
        grav = grav_normal;
    }
    else if (_action == action_slide)
    {
        if (solid_above)
        {
            if (hspd == 0 || !auto_slide || slide_skid)
                action = action_crouch;
            else
                timer[timer_reset_action] = 1;
            
            _newaction = -4;
        }
        else if (!on_ground() && !crouch_input)
        {
            if (ds_list_size(list_carry) > 0)
                override_play(spr_buster_crouchout_carry);
            else
                override_play(spr_buster_crouchout);
        }
    }
    else if (_action == action_crouch_spin)
    {
        _newaction = action_crouch;
    }
    
    if (_newaction != -4)
        action = _newaction;
};

timer[timer_rundust] = -1;

timer_func[timer_rundust] = function()
{
    var _par;
    
    if (facing == 1)
        _par = global.particles.rundustR;
    else
        _par = global.particles.rundustL;
    
    part_particles_create(global.part_over, x - (10 * facing), y, _par, 1);
};

state_to = state_free;
timer[timer_reset_state] = -1;

timer_func[timer_reset_state] = function()
{
    var _state = state;
    state = state_to;
    state_to = state_free;
};

timer[timer_invulnerable_flash] = -1;

timer_func[timer_invulnerable_flash] = function()
{
    invulnerable_flash = !invulnerable_flash;
    timer[timer_invulnerable_flash] = 5;
};

timer[timer_become_vulnerable] = -1;

timer_func[timer_become_vulnerable] = function()
{
    invulnerable = false;
    timer[timer_invulnerable_flash] = -1;
};

timer[timer_pit] = -1;

timer_func[timer_pit] = function()
{
    part_particles_create(global.part_over, x, y - 70, global.particles.smoke, 1);
    instance_destroy();
    var _inst = instance_create_layer(pit_respawn_x, pit_respawn_y, layer, obj_player);
    obj_controller.relative_pos_ease = 0;
    
    with (_inst)
    {
        invulnerable = true;
        timer[timer_invulnerable_flash] = 5;
        invulnerable_flash = true;
        timer[timer_become_vulnerable] = 120;
    }
};

timer[timer_meterflash] = -1;

timer_func[timer_meterflash] = function()
{
    meter_flash = !meter_flash;
};

meter_flash = false;
powerup_index_change[0] = -4;
powerup_index_change[1] = 22;
powerup_index_change[2] = -4;
powerup_index_change[3] = -4;
powerup_index_change[4] = 23;
mySnd_nuclear = -4;
transformed = false;
