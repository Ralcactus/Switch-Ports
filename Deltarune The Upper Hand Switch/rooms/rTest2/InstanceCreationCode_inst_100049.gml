text = "Lerp test";
drawSelf = true;
res_i();

func = function()
{
    i = 1;
    oPlayer.move = false;
};

draw = function()
{
    if (i == 1)
    {
        i1++;
        
        if (i1 == 5)
        {
            oPlayer.doLerp = true;
            oPlayer.x = 60;
            oPlayer.y = 60;
            oPlayer.sprite = sKris_Up;
            oPlayer.pastXYS[18][0] = 580;
            oPlayer.pastXYS[36][0] = 60;
            oPlayer.pastXYS[18][1] = 60;
            oPlayer.pastXYS[36][1] = 420;
            oPlayer.pastXYS[18][2] = sKris_Up;
            oPlayer.pastXYS[36][2] = sKris_Up;
            oPlayer.pastXYS[18][3] = 0;
            oPlayer.pastXYS[36][3] = 0;
        }
        
        if (i1 == 10)
        {
            oPlayer.move = true;
            res_i();
        }
    }
};
