anim_logic();
var _reachedX = x == xdest;
var _reachedY = y == ydest;
xAxis = input_check("right") - input_check("left");
yAxis = input_check("down") - input_check("up");

if (controller.win)
{
    xAxis = 0;
    yAxis = 0;
}

if (!instance_exists(obj_Bu_coin) && !controller.win)
{
    scr_micro_win();
    flash_alpha = 1.2;
}

if (x == xdest && y == ydest)
{
    if (xAxis != 0)
    {
        var _side;
        
        if (xAxis == 1)
            _side = bbox_right;
        else
            _side = bbox_left;
        
        if (collision_point(_side + xAxis, y, obj_Bu_coin_path, true, true))
        {
            xdest = x + (xAxis * 444);
            
            if (first_step)
            {
                audio_play_sound(controller.audio, snd_Bu_coin_step, 0, 0);
                first_step = false;
            }
        }
    }
    
    if (yAxis != 0 && x == xdest)
    {
        var _side;
        
        if (yAxis == 1)
            _side = bbox_bottom;
        else
            _side = bbox_top;
        
        if (collision_point(x, _side + yAxis, obj_Bu_coin_path, true, true))
        {
            ydest = y + (yAxis * 444);
            
            if (first_step)
            {
                audio_play_sound(controller.audio, snd_Bu_coin_step, 0, 0);
                first_step = false;
            }
        }
    }
}

anim_index = 0;

if (vspd == 0)
{
    if (hspd > 0)
        anim_index = 3;
    else if (hspd < 0)
        anim_index = 2;
}
else if (hspd == 0)
{
    if (vspd < 0)
        anim_index = 1;
}

if (controller.win)
    anim_index = 4;

if (hspd != 0 || vspd != 0)
    time_angle += (0.15 * global.delta_game_factor);
else
    time_angle = 0;

angle = 9 * sin(pi * time_angle);
yoff = (10 * sin(pi * time_angle)) - 10;
x = approach(x, xdest, 21);
y = approach(y, ydest, 21);

if ((x == xdest && !_reachedX) || (y == ydest && !_reachedY))
    audio_play_sound_on(controller.audio, snd_Bu_coin_step, 0, 0);

xscale = 1 + (0.05 * sin(pi * time));
yscale = 1 - (0.05 * sin(pi * time));
time += (0.06 * global.delta_game_factor);
flash_alpha = approach(flash_alpha, 0, 0.065);
