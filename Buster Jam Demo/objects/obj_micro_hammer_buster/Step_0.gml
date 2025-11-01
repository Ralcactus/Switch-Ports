var _xAxis = input_check_pressed("right") - input_check_pressed("left");
var _yAxis = input_check_pressed("down") - input_check_pressed("up");

if (!moving && _xAxis != 0 && _xAxis != side)
{
    side_to = _xAxis;
    moving = true;
}

if (!moving && _yAxis != 0 && _yAxis != ground_layer)
{
    ground_layer_to = _yAxis;
    moving = true;
}

if (side_to != -4)
{
    var _xto;
    
    if (side_to == -1)
        _xto = 592;
    else
        _xto = 1087;
    
    x = approach(x, _xto, movespd_x);
    facing = -side_to;
    
    if (x == _xto)
    {
        if (ground_layer == -1)
            facing = side;
        else
            facing = -side;
        
        side = side_to;
        moving = false;
        side_to = -4;
    }
}

if (ground_layer_to != -4)
{
    var _yto;
    
    if (ground_layer_to == -1)
        _yto = 288;
    else
        _yto = 576;
    
    y = approach(y, _yto, movespd_y);
    
    if (y == _yto)
    {
        if (ground_layer == -1)
            facing = side;
        else
            facing = -side;
        
        ground_layer = ground_layer_to;
        moving = false;
        ground_layer_to = -4;
    }
}

if (swing_frames)
    swing_frames -= global.delta_game_factor;

if (!moving && input_check_pressed("jump"))
{
    moving = true;
    smash = true;
    swing = true;
    swing_frames = 3;
    timer[0] = swing_time;
}

anim_index = swing;
timer_logic(0);
