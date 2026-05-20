res_i();
i1 = false;
i2 = 0;
i3 = 0;

if (file_exists("save1"))
    i2 = 1;

if (i2 == 0)
{
    funcStep = function()
    {
        if (i3 == 0)
        {
            if (KeyZ || KeyX || KeyC)
            {
                i3 = 1;
                TapZ = false;
                TapX = false;
                TapC = false;
            }
        }
        
        if (i3 == 1)
        {
            if (TapZ)
            {
                i3 = 2;
                i = 0;
            }
        }
        
        if (i3 == 2)
        {
            i++;
            
            if (i == 60)
                room_goto(rMainMenu);
        }
    };
    
    funcDraw = function()
    {
        if (i3 == 0)
        {
            res_j();
            j1 = g_t("start_text");
            j2 = 201;
            j3 = 180;
            text = "";
            
            if (!i1)
            {
                print(j1[0], 320, j2 - 150, undefined, undefined, ["mid"]);
                text = j1[1] + j1[2];
                
                if (op.gamepad != 0)
                    text = op.gp6 + j1[2];
                
                print(text, j3, j2 - 90, undefined, 8421504);
                text = j1[3] + j1[4];
                
                if (op.gamepad != 0)
                    text = op.gp1 + j1[4];
                
                print(text, j3, j2 - 60, undefined, 8421504);
                text = j1[5] + j1[6];
                
                if (op.gamepad != 0)
                    text = op.gp3 + j1[6];
                
                print(text, j3, j2 - 30, undefined, 8421504);
                text = j1[7] + j1[8];
                
                if (op.gamepad != 0)
                    text = op.gp5 + j1[8];
                
                print(text, j3, j2, undefined, 8421504);
                text = j1[9] + j1[10];
                print(text, j3, j2 + 60, undefined, 8421504);
                text = j1[11] + j1[12];
                print(text, j3, j2 + 90, undefined, 8421504);
                print(j1[13], 320, j2 + 150, undefined, undefined, ["mid"]);
                ext(sControler, 0, 320, j2 + 220);
            }
        }
        
        if (i3 == 1)
        {
            res_j();
            text = g_t("start_text2");
            
            if (TapUP)
            {
                snd(snd_menumove);
                op.language--;
                
                if (op.language == 0)
                    op.language = array_length(text) - 1;
            }
            
            if (TapDOWN)
            {
                snd(snd_menumove);
                op.language++;
                
                if (op.language == array_length(text))
                    op.language = 1;
            }
            
            text = g_t("start_text2");
            print(text[0], 320, 51, undefined, undefined, ["mid"]);
            j = 0;
            
            repeat (array_length(text) - 1)
            {
                print(text[j + 1], 320, (229 - ((array_length(text) - 2) * 15)) + (j * 30), undefined, 8421504, ["mid"]);
                j++;
            }
            
            ext(sSymb, 7, 306 - print_length(text[op.language], sFont1, 1), (239 - ((array_length(text) - 2) * 15)) + ((op.language - 1) * 30), undefined, undefined, undefined, 255);
        }
    };
}
else
{
    funcStep = function()
    {
        i++;
        
        if (i == 10)
            room_goto(rMainMenu);
    };
}
