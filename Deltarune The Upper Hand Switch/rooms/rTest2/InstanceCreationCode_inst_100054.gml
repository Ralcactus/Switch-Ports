text = "Camera Fix";
drawSelf = true;
res_i();

func = function()
{
    if (op.cameX != 0 || op.cameY != 0)
    {
        oPlayer.move = false;
        fix_cam(30);
        i = 30;
    }
};

step = function()
{
    if (i > 0)
    {
        i--;
        
        if (i == 0)
            oPlayer.move = true;
    }
};
