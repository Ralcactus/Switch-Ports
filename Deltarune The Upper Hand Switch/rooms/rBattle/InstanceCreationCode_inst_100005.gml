if (op.customMode)
{
    res_i();
    
    while (i != array_length(op.party))
    {
        if (op.party[i] == 0)
        {
            array_delete(op.party, i, 1);
            i--;
        }
        
        i++;
    }
    
    res_i();
    op.item = [];
    
    repeat (array_length(op.custom_item))
    {
        if (op.custom_item[i] != 0)
            array_push(op.item, op.allItems[op.custom_item[i]]);
        
        i++;
    }
    
    fixStats_pDamage = "";
    fixStats_pTakeDamage = "";
    fixStats_pHealUp = "";
    op.MAXhp = [];
    res_i();
    
    repeat (array_length(op.party))
    {
        if (op.party[i] == "kris")
        {
            i1 = false;
            fixStats_pDamage += "257";
            fixStats_pTakeDamage += "67";
            fixStats_pHealUp += "29";
            array_push(op.MAXhp, 210);
        }
        
        if (op.party[i] == "susie")
        {
            i1 = false;
            fixStats_pDamage += "314";
            fixStats_pTakeDamage += "71";
            fixStats_pHealUp += "30";
            array_push(op.MAXhp, 260);
        }
        
        if (op.party[i] == "ralsei")
        {
            i1 = false;
            fixStats_pDamage += "174";
            fixStats_pTakeDamage += "64";
            fixStats_pHealUp += "28";
            array_push(op.MAXhp, 190);
        }
        
        i++;
        
        if (i != array_length(op.party))
        {
            fixStats_pDamage += ",";
            fixStats_pTakeDamage += ",";
            fixStats_pHealUp += ",";
        }
    }
    
    while (array_length(op.MAXhp) < 3)
        array_push(op.MAXhp, 0);
}
else
{
    fixStats_pDamage = "257,314,174";
    fixStats_pTakeDamage = "67,71,64";
    fixStats_pHealUp = "29,30,28";
    op.MAXhp = [210, 260, 190];
}

startBattle("test_1", "120,120,180,188,110,236", "470,180,540,300,540,300", fixStats_pDamage, fixStats_pTakeDamage, fixStats_pHealUp);
