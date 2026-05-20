pick = clamp(numb * offset, 0, array_length(oPlayer.pastXYS) - 1);
image_speed = 0;

if (!oPlayer.freeMove && !oPlayer.doLerp && !oPlayer.dontSetSprites)
{
    x = oPlayer.pastXYS[pick][0];
    y = oPlayer.pastXYS[pick][1];
    sprite_index = oPlayer.pastXYS[pick][2];
    image_ = oPlayer.pastXYS[pick][3];
    
    if (!(oPlayer.pastXYS[pick][0] == oPlayer.pastXYS[pick - 1][0] && oPlayer.pastXYS[pick][1] == oPlayer.pastXYS[pick - 1][1]))
        image_ = oPlayer.image_index;
}

if (moveTime[0] > 0)
{
    if (moveTime[0] == moveTime[1])
    {
        sprite_index = moveTime[6];
        sprite = moveTime[6];
    }
    
    walkSpeed = moveTime[7];
    moveTime[0]--;
    x += ((moveTime[2] - moveTime[4]) / moveTime[1]);
    y += ((moveTime[3] - moveTime[5]) / moveTime[1]);
    image_ += (moveTime[7] / 25);
    
    if (moveTime[0] == 0)
    {
        image_ = 0;
        
        if (moveTime[8] != -1)
            moveTime[8]();
    }
}

depth = -y;

if (!oPlayer.move && !waiting)
    waiting = true;

if (oPlayer.move && waiting)
{
    waiting = false;
    
    if (oPlayer.doLerp)
    {
        oPlayer.pastXYS[pick][0] = x;
        oPlayer.pastXYS[pick][1] = y;
        
        if (numb == 1)
        {
            tragetXY = [oPlayer.x, oPlayer.y];
        }
        else
        {
            with (oFollow)
            {
                if ((numb + 1) == other.numb)
                    other.tragetXY = [x, y];
            }
        }
        
        res_i();
        i1 = sKris_Down;
        i2 = -1;
        i3 = offset;
        
        if (numb == 2)
            i3 = offset - 1;
        
        i4 = 1;
        
        repeat (i3)
        {
            if (x > tragetXY[0])
            {
                if (abs(x - tragetXY[0]) > abs(y - tragetXY[1]))
                    i1 = sKris_Left;
                else if ((y - tragetXY[1]) < 0)
                    i1 = sKris_Down;
                else
                    i1 = sKris_Up;
            }
            else if (abs(x - tragetXY[0]) > abs(y - tragetXY[1]))
            {
                i1 = sKris_Right;
            }
            else if ((y - tragetXY[1]) < 0)
            {
                i1 = sKris_Down;
            }
            else
            {
                i1 = sKris_Up;
            }
            
            if (tragetXY[0] == x && tragetXY[1] == y)
                i1 = oPlayer.sprite;
            
            i++;
            
            if (!(i % 5))
                i4++;
            
            oPlayer.pastXYS[pick - i][0] = x + (((tragetXY[0] - x) / offset) * i);
            oPlayer.pastXYS[pick - i][1] = y + (((tragetXY[1] - y) / offset) * i);
            oPlayer.pastXYS[pick - i][2] = i1;
            oPlayer.pastXYS[pick - i][3] = i4;
        }
    }
}
