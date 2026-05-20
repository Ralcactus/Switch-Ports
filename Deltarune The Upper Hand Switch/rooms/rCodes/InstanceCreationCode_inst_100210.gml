op.camMode = "player";
op.parameter = [0, 0, 0, 100];
op.drawFollow = false;
op.musicOW = -1;
audio_stop_all();
res_j();

j = function(arg0 = "00000000", arg1 = "MODE", arg2, arg3 = "OFF", arg4 = "ON")
{
    i1 += 40;
    i = arg3;
    
    if (arg2 != -1)
    {
        if (arg2)
            i = arg4;
    }
    
    print("(" + arg0 + ") - " + arg1, 40, i1, undefined, undefined, ["force_ENG"]);
    
    if (arg2 != -1)
        print(i, 500, i1, undefined, undefined, ["force_ENG"]);
};

funcDraw = function()
{
    res_i();
    i1 += 40;
    print("Press F9", 320, i1, undefined, 65535, ["mid", "force_ENG"]);
    i1 += 40;
    j("20202020", "Date text", op.dateText);
    j("88888888", "Show star hitboxes", op.starBoxes);
    j("99999999", "Show wow boxes", op.wowBoxes);
    j("55555555", "Select attack", -1);
};
