function scrFillArray()
{
    var i1 = 0;
    A_MoveBoxUI = 0;
    FAISD = 0;
    Actions = 0;
    WillItem = 0;
    WillItemNumb = 0;
    
    while (i1 != array_length(Party))
    {
        i1 += 1;
        A_MoveBoxUI[i1 - 1] = 32;
        FAISD[i1 - 1] = 1;
        Actions[i1 - 1] = 0;
        WillItem[i1 - 1] = 0;
        WillItemNumb[i1 - 1] = 0;
    }
    
    A_MoveBoxUI[0] = 0;
}
