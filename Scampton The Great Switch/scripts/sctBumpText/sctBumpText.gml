function sctBumpText(arg0, arg1)
{
    with (oTextEngine)
    {
        if (Cur == arg0)
        {
            if (arg1 == 1)
                BumpY -= 10;
            
            if (arg1 == 2)
                BumpY += 10;
            
            if (arg1 == 3)
                BumpX -= 10;
            
            if (arg1 == 4)
                BumpX += 10;
        }
    }
}
