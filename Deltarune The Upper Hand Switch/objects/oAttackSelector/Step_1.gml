use_keys();

if (TapUP)
{
    cur--;
    
    if (cur == -1)
        cur = array_length(text) - 1;
}

if (TapDOWN)
{
    cur++;
    
    if (cur == array_length(text))
        cur = 0;
}

if (TapZ)
{
    if (cur == 0)
        des();
    
    if (cur == 1)
    {
        if (oBUI.loop)
            oBUI.loop = false;
        else
            oBUI.loop = true;
    }
    
    if (cur == 2)
    {
        op.attackSel = -1;
        des();
    }
    
    if (cur == 3)
        op.attackSel = 0;
    
    if (cur == 4)
        op.attackSel = 1;
    
    if (cur == 5)
        op.attackSel = 2;
    
    if (cur == 6)
        op.attackSel = 3;
    
    if (cur == 7)
        op.attackSel = 4;
    
    if (cur == 8)
        op.attackSel = 5;
    
    if (cur == 9)
        op.attackSel = 6;
    
    if (cur == 10)
        op.attackSel = 7;
    
    if (cur == 11)
        op.attackSel = 8;
    
    if (cur == 12)
        op.attackSel = "lazer1";
    
    if (cur == 13)
        op.attackSel = "lazer2";
    
    if (cur == 14)
        op.attackSel = "lazer3";
    
    if (cur == 15)
        op.attackSel = "breather";
    
    if (cur == 16)
        op.attackSel = "final";
    
    if (cur == 17)
        op.attackSel = "thinPlatforms";
}

if (TapX)
    des();
