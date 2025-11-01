anim_logic();

if (controller.win)
{
    var _dir = dir;
    
    if (input_check_pressed("right") && _dir == -1)
    {
        dir = 1;
        anim_play(spr_Bu_dodge_LtoR);
    }
    
    if (input_check_pressed("left") && _dir == 1)
    {
        dir = -1;
        anim_play(spr_Bu_dodge_RtoL);
    }
}

image_xscale = dir;
