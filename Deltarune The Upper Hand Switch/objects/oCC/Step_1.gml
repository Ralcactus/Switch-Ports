ty++;
ti += pi;
use_keys();

if (seed == "gameOver")
{
    if (ty == 1)
        i3 = 1;
    
    if (ty == 30)
        snd(snd_star);
    
    if (ty > 30)
    {
        if (i1 == 0)
        {
            if (TapUP || TapDOWN)
            {
                if (i == 0)
                    i = 1;
                else
                    i = 0;
            }
            
            if (TapZ)
            {
                i1 = 1;
                
                if (i == 0)
                    room_goto(op.deadRoom);
            }
        }
        
        if (i1 == 1)
            i2 += 0.1;
        
        if (i2 == 1.1)
        {
            if (i == 1)
            {
                if (op.customMode)
                    room_goto(rCustomMode);
                else
                    room_goto(rMainMenu);
            }
        }
    }
}

if (funcStep != -1)
    funcStep();
