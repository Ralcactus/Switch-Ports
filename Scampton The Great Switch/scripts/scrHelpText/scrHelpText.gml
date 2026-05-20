function scrHelpText(arg0, arg1, arg2, arg3, arg4)
{
    if (arg4 == 0)
    {
        if (Party[PartyTurn] == arg0 && Cursor == arg1)
        {
            with (instance_create_depth(500, 382, -9999, oTextEngine))
            {
                StringAT = 999;
                BC = false;
                Mono = true;
                Spez = "BottomText";
                Text[0] = arg2;
                RGB = make_color_rgb(127.5, 127.5, 127.5);
            }
            
            with (instance_create_depth(500, 382, -9999, oTextEngine))
            {
                StringAT = 999;
                BC = false;
                Mono = true;
                Spez = "BottomText";
                Text[0] = "££" + string(arg3) + "% PP";
                RGB = make_color_rgb(0, 255, 255);
            }
        }
    }
    else if (arg4 == Items[ItemSel - 1])
    {
        with (instance_create_depth(500, 382, -9999, oTextEngine))
        {
            StringAT = 999;
            BC = false;
            Mono = true;
            Spez = "BottomText";
            Text[0] = arg2;
            RGB = make_color_rgb(127.5, 127.5, 127.5);
        }
    }
}
