function scrMMcursor(arg0, arg1, arg2, arg3, arg4)
{
    if (arg0 == MM_Cursor)
    {
        if (KeyUP && UPtyme == 1 && arg1 != 0)
        {
            if (room == rGameOver)
                sou(89);
            else
                sou(snd_menumove);
            
            MM_Cursor = arg1;
            UPtyme = 2;
            
            with (oTextEngine)
            {
                if (Cur == oAlways.MM_Cursor)
                    BumpY += -10;
            }
        }
        
        if (KeyDOWN && DOWNtyme == 1 && arg2 != 0)
        {
            if (room == rGameOver)
                sou(89);
            else
                sou(snd_menumove);
            
            MM_Cursor = arg2;
            DOWNtyme = 2;
            
            with (oTextEngine)
            {
                if (Cur == oAlways.MM_Cursor)
                    BumpY += 10;
            }
        }
        
        if (KeyLEFT && LEFTtyme == 1 && arg3 != 0)
        {
            if (room == rGameOver)
                sou(89);
            else
                sou(snd_menumove);
            
            MM_Cursor = arg3;
            LEFTtyme = 2;
            
            with (oTextEngine)
            {
                if (Cur == oAlways.MM_Cursor)
                    BumpX += -10;
            }
        }
        
        if (KeyRIGHT && RIGHTtyme == 1 && arg4 != 0)
        {
            if (room == rGameOver)
                sou(89);
            else
                sou(snd_menumove);
            
            MM_Cursor = arg4;
            RIGHTtyme = 2;
            
            with (oTextEngine)
            {
                if (Cur == oAlways.MM_Cursor)
                    BumpX += -10;
            }
        }
    }
}
