testvariablenothing = false;
event_inherited();
draw_me = true;
score_x = 128;
score_y = 896;
hp_x = 1184;
hp_y = 992;
hp_x = 1216;
var _side = choose(1, -1);
buster_spr = spr_bosstrans_knives_1_buster;
buster_ind = 0;
buster_facing = _side;
snake_spr = spr_bosstrans_knives_1_snake;
snake_ind = 0;
snake_side = _side;
snake_yoff = 450;
snake_in = false;
mult = 0.6;
timer[0] = time_bpm_to_seconds(140) * 60 * 2 * mult;

timer_func[0] = function()
{
    snake_side = -snake_side;
    snake_in = true;
    timer[1] = time_bpm_to_seconds(140) * 60 * 4 * mult;
};

timer[1] = -1;

timer_func[1] = function()
{
    buster_spr = spr_bosstrans_knives_1_buster_turn;
    buster_ind = 0;
    buster_facing = -buster_facing;
    timer[2] = time_bpm_to_seconds(140) * 60 * 0.1;
    timer[0] = time_bpm_to_seconds(140) * 60 * 3 * mult;
};

timer[2] = -1;

timer_func[2] = function()
{
    snake_in = false;
};

event_animend_buster = function()
{
    var _loop = true;
    var _spr = buster_spr;
    
    if (_spr == spr_bosstrans_knives_1_buster_turn)
    {
        buster_spr = spr_bosstrans_knives_1_buster;
        buster_ind = 17;
        _loop = false;
    }
    
    if (_loop)
        buster_ind -= buster_ind;
};

event_animend_snake = function()
{
    var _loop = true;
    
    if (_loop)
        snake_ind -= snake_ind;
};

zoom = 1;
shake = 0;
body_front_x = 0;
body_back_x = 0;
surf_body_back = -4;
surf_body_front = -4;
