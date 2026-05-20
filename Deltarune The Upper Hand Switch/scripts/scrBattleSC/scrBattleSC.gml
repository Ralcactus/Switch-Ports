function healPep(arg0, arg1)
{
    var pastHP = op.hp[arg0];
    snd(snd_heal);
    
    repeat (irandom_range(5, 7))
        spawnEEF(oBUI.pPos[arg0 * 2] + irandom_range(-10, 10), oBUI.pPos[1 + (arg0 * 2)] + irandom_range(-10, 10), sEEF_star1, irandom_range(0, 2), "healStar,draw,randomScale,color_green");
    
    with (oPep)
    {
        if (numb == arg0)
            popWhite = 1.1;
    }
    
    op.hp[arg0] += arg1;
    
    if (op.hp[arg0] > op.MAXhp[arg0])
        op.hp[arg0] = op.MAXhp[arg0];
    
    if (op.hp[arg0] == op.MAXhp[arg0])
        popText("2", oBUI.pPos[arg0 * 2], oBUI.pPos[1 + (arg0 * 2)] - (oBUI.upP[arg0] * 20), sPopWords, rgb(0, 255, 0));
    else if (pastHP < 1 && op.hp[arg0] > 0)
        popText("3", oBUI.pPos[arg0 * 2], oBUI.pPos[1 + (arg0 * 2)] - (oBUI.upP[arg0] * 20), sPopWords, rgb(0, 255, 0));
    else
        popText(string(arg1), oBUI.pPos[arg0 * 2], oBUI.pPos[1 + (arg0 * 2)] - (oBUI.upP[arg0] * 20), sPopWhite, rgb(0, 255, 0));
    
    oBUI.upP[arg0]++;
    
    if (op.hp[arg0] == 0)
        op.hp[arg0] = 1;
    
    if (pastHP < 1 && op.hp[arg0] > 0)
        pepAn(arg0, 2, "idle");
}

function damageEne(arg0, arg1, arg2, arg3 = -1)
{
    get_stats(op.party[arg1]);
    
    if (arg2 > 0)
    {
        if (arg3 == -1)
            snd(snd_damage);
        else if (arg3 != 0)
            snd(arg3);
        
        popText(string(arg2), oBUI.ePos[arg0 * 2], oBUI.ePos[1 + (arg0 * 2)] - (oBUI.upE[arg0] * 20), sPopWhite, jam[3]);
    }
    else
    {
        popText("0", oBUI.ePos[arg0 * 2], oBUI.ePos[1 + (arg0 * 2)] - (oBUI.upE[arg0] * 20), sPopWords, jam[3]);
    }
    
    with (oEnemie)
    {
        if (numb == arg0)
        {
            if (arg2 > 0)
                an = "hurt";
            
            inf_hp -= arg2;
        }
    }
    
    oBUI.upE[arg0]++;
}

function spareEne(arg0, arg1)
{
    snd(snd_mercyadd);
    
    with (oEnemie)
    {
        if (numb == arg0)
            inf_spareP += arg1;
    }
    
    popText("+" + string(arg1) + "%", oBUI.ePos[arg0 * 2], oBUI.ePos[1 + (arg0 * 2)] - (oBUI.upE[arg0] * 20), sPopYellow, 16777215);
    oBUI.upE[arg0]++;
}
