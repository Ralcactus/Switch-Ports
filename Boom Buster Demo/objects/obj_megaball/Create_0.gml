physics_init();
state_idle = 0;
state_charge = 1;
state_jump = 2;
state_land = 3;
state_fireball = 4;
state_dash = 5;
state_knocked = 6;
state_hurt = 7;
attack_jump = 0;
attack_doublejump = 1;
attack_fireball = 2;
attack_dash = 3;
times_attacked = 0;
attack = attack_jump;
walkspd = 2;

event_attack_jump = function()
{
    state = state_jump;
    anim_play(spr_ball);
    grav = 0.48;
    vspd = -calculate_jump(3, grav);
    var _dist = obj_player.x - x;
    var t_peak = -vspd / grav;
    var peak_height = 0.5 * abs(vspd) * t_peak;
    var t_descent = sqrt((2 * peak_height) / grav);
    var total_time = t_peak + t_descent;
    hspd = _dist / total_time;
};

timer[0] = 90;

timer_func[0] = function()
{
    switch (state)
    {
        case state_idle:
            if (attack == attack_jump)
            {
                state = state_charge;
                hspd = 0;
                anim_play(spr_megaball_charge);
                timer[0] = 90;
            }
            else if (attack == attack_fireball)
            {
                state = state_charge;
                hspd = 0;
                timer[0] = 90;
            }
            
            break;
        
        case state_charge:
            if (attack == attack_jump)
            {
                event_attack_jump();
                attack = attack_fireball;
            }
            else if (attack == attack_fireball)
            {
                state = state_fireball;
                timer[0] = 60;
                var _fireball = instance_create_layer(x + (60 * facing), y - 112, "Instances_1", obj_megaball_fireball);
                _fireball.facing = facing;
                _fireball.hspd = 6 * facing;
                attack = attack_jump;
            }
            
            break;
        
        case state_land:
        case state_fireball:
            anim_play(spr_ball);
            state = state_idle;
            timer[0] = 120;
            break;
        
        case state_hurt:
            anim_play(spr_ball);
            state = state_idle;
            timer[0] = 120;
            break;
    }
};

state = state_idle;

event_floor = function()
{
    var _state = state;
    
    if (_state == state_jump)
    {
        times_attacked++;
        state = state_land;
        hspd = 0;
        vspd = 0;
        timer[0] = 90;
        screen_shake(4, 12);
        var _inst = instance_create_layer(irandom_range(256, 1408), -140, "Instances_1", obj_ball);
        
        if (_inst.x > (x - 350) && _inst.x < (x + 350))
        {
            _inst.x = x + 350;
            
            if (_inst.x > 1408)
                _inst.x = irandom_range(256, 480);
        }
        
        if (_inst.x > x)
            _inst.facing = 1;
        else
            _inst.facing = -1;
        
        exit;
    }
    else if (_state == state_hurt)
    {
        if (vspd > 2)
            vspd = -vspd * 0.55;
        else
            vspd = 0;
        
        exit;
    }
    
    vspd = 0;
};

event_wall = function()
{
    var _state = state;
    
    if (_state == state_jump)
    {
        hspd = -hspd;
        screen_shake(8, 3);
        exit;
    }
    
    hspd = 0;
};

image_xscale = 4.5;
image_yscale = 4.5;
anim_init();
facing = -1;
