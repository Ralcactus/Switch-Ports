op.parameter = [0, 0, 0, 0];
op.camMode = "player";
audio_stop_sound(mus_Memories_Of_HQ);
instance_destroy(oFollow);
oPlayer.x = -999;
oPlayer.y = -999;
oPlayer.move = false;
res_i();
i1 = 0;
i4 = 0;
res_j();

funcStep = function()
{
    i++;
    
    if (i == 30)
        mg(sG2, 320, 420, undefined, undefined, ["ddlast"]);
    
    if (i == 60)
        oSoul.move = true;
    
    if (i == 120)
        ma(["star2"], undefined, undefined, 320, 340, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, [[480, 160], [90, 160], [320, 40]]);
    
    if (i1 == 1 && i2 < 1)
    {
        i2 = 1;
        mg(sG1, 520, 360, undefined, undefined, ["dddown"]);
        mg(sG5, 550, 300, undefined, undefined, ["dddown"]);
        mg(sG4, 480, 240, undefined, undefined, ["dddown"]);
    }
    
    if (i1 == 2 && i2 < 2)
    {
        i2 = 2;
        mg(sG5, 135, 360, undefined, undefined, ["dddown"]);
        mg(sG5, 45, 300, undefined, undefined, ["dddown"]);
        mg(sG5, 90, 240, undefined, undefined, ["dddown"]);
    }
    
    if (i1 == 3)
        i2++;
    
    if (i2 == 10)
    {
        with (oGround)
        {
            if (array_contains(seed, "dddown"))
                move = [0, 2];
        }
    }
    
    if (i1 == 3 && i2 == 130)
    {
        mg(sG3, 320, 300, undefined, undefined, ["ddlast"]);
        mg(sG5, 320, 180, undefined, undefined, ["ddlast"]);
    }
    
    if (i1 == 4)
    {
        i4++;
        
        with (oGround)
        {
            if (array_contains(seed, "dddown") || array_contains(seed, "ddlast"))
                move = [0, 8];
        }
    }
    
    if (i1 == 4 && i4 == 90)
        room_goto(rSockIndependence);
};

funcDraw = function()
{
    if (i1 == 3 && i2 > 190)
    {
        j1 = g_t("s_1");
        
        if (op.gamepad == 0)
            print(j1[0] + "[" + keysText2(op.keys[2][1]) + "]" + j1[1], 320, 120, undefined, 4210752, ["mid", "xys_1"]);
        
        if (op.gamepad != 0)
            print(j1[0] + op.gp1 + j1[1], 320, 120, undefined, 4210752, ["mid", "xys_1"]);
    }
};
