event_inherited();
sprite_stomp = spr_hissy_stomped;
sprite_spun = spr_hissy_spun;
dies_on_spikes = false;
walkspd = 0;
state_idle = 0;
state_prep = 1;
state_spring = 2;
state_land = 3;
state = state_idle;
timer[0] = 25;

timer_func[0] = function()
{
    var _state = state;
    
    switch (_state)
    {
        case state_idle:
            state = state_prep;
            anim_play(spr_hissy_prep);
            timer[0] = 35;
            break;
        
        case state_prep:
            anim_play(spr_hissy_spring);
            hspd = 3 * facing;
            vspd = -calculate_jump(4, grav);
            state = state_spring;
            break;
    }
};

event_ceiling = function()
{
};

event_wall = function()
{
};

event_floor = function()
{
    vspd = 0;
    var _state = state;
    
    if (_state == state_spring)
    {
        hspd = 0;
        state = state_land;
        timer[0] = 45;
        anim_play(spr_hissy_land);
    }
};

event_animend = function()
{
    switch (anim_sprite)
    {
        case spr_hissy_prep:
            anim_index = 6;
            break;
        
        case spr_hissy_spring:
            anim_index = 2;
            break;
        
        case spr_hissy_land:
            anim_play(spr_hissy_idle);
            state = state_idle;
            break;
    }
};
