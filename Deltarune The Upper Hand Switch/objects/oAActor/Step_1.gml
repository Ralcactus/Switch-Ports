if (!done)
{
    while (go)
    {
        if (pep == array_length(op.party))
        {
            priority++;
            pep = 0;
        }
        
        if (priority >= 5)
        {
            boxes = array_length(oBUI.tot_enemies);
            done = true;
            go = false;
            oManagerE.go = true;
            oEnemie.an = "idle";
            instance_create_depth(0, 0, -7777, oShadow);
            res_i();
            
            repeat (array_length(op.party))
            {
                if (oBUI.actions[i][3] != 5 && op.hp[i] > 0)
                    pepAn(i, 2, "idle");
                
                i++;
            }
        }
        
        if (go)
        {
            if (priority == oBUI.actions[pep][3])
            {
                if (op.hp[pep] > 0 && oBUI.autoAnimatePep)
                {
                    if (priority == 0)
                        pepAn(pep, 4, "stop");
                    
                    if (priority == 1)
                        pepAn(pep, 5, "stop");
                    
                    if (priority == 2 || priority == 3)
                        pepAn(pep, 8, "stop");
                }
                
                oBUI.autoAnimatePep = true;
                go = false;
                
                with (instance_create_depth(0, 0, -15000, oAction))
                {
                    inf_act = oBUI.actions[other.pep][0];
                    inf_from = oBUI.actions[other.pep][1];
                    inf_too = oBUI.actions[other.pep][2];
                    inf_priority = oBUI.actions[other.pep][3];
                    inf_item = oBUI.actions[other.pep][4];
                    inf_itemSpot = oBUI.actions[other.pep][5];
                }
            }
            
            pep++;
        }
    }
}

if (done && boxes == 0)
{
    if (oEnemie.armSprites[0] != sHand_IdleMini)
    {
        squashHand(0, 3, 0.04, [sHand_IdleMini, sHand_IdleMiniM], function()
        {
            oEnemie.image_xscale = 2;
            oEnemie.image_yscale = 2;
        });
    }
    
    if (oEnemie.armSprites[2] != sHand_Idle2)
        squashHand(1, 3, 0.04, [sHand_Idle2, sHand_IdleM2]);
    
    des(0);
    res_i();
    res_j();
    
    repeat (array_length(oBUI.tot_enemies))
    {
        with (instance_create_depth(0, 0, 0, oPattern))
            pattern = oBUI.e_pattern[other.i];
        
        j1 += oBUI.e_x[i];
        j2 += oBUI.e_y[i];
        j3 += oBUI.e_xScl[i];
        j4 += oBUI.e_yScl[i];
        i++;
        i1++;
    }
    
    j1 /= i1;
    j2 /= i1;
    j3 /= i1;
    j4 /= i1;
    oBUI.patternTime = 0;
    
    with (instance_create_depth(j1, j2, -8888, oBox))
    {
        xScl = other.j3;
        yScl = other.j4;
    }
    
    instance_create_depth(oBUI.pPos[0], oBUI.pPos[1] - 30, -15000, oSoul);
    spawnEEF(oBUI.pPos[0], oBUI.pPos[1] - 30, sSymb, 4, "heartOut");
}
