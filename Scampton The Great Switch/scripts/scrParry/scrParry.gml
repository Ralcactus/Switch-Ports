function ParryPlode()
{
    with (instance_create_depth(ShowX, ShowY, -20000, oEEF))
        Seed = "ParrySmoke";
    
    if (sprite_index == sCard && image_index == 5)
        sou(55);
    else
        sou(87);
    
    if (oMakeUI.ExtraParry != 0)
    {
        TickPower += oMakeUI.ExtraParry;
        oMakeUI.ExtraParry = 0;
    }
    
    var i1 = 3;
    var i2 = 0;
    var i3 = 0;
    
    repeat (i1)
    {
        if (i2 != (i1 - 1))
            i3 += round(TickPower / i1);
        
        with (instance_create_depth(x + (sin(i2) * 2), y + (cos(i2) * 2), -9999, oParryWalk))
        {
            if (i2 == (i1 - 1))
                _TP += (other.TickPower - i3);
            else
                _TP = round(other.TickPower / i1);
        }
        
        i2 += 1;
    }
}
