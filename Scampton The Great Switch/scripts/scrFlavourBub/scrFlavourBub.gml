function scrFlavourBub(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
    with (instance_create_depth(arg1, arg2, -20000, oTextEngine))
    {
        image_xscale = 1;
        image_yscale = 1;
        Font = sFont_Sma;
        RGB = make_color_rgb(0, 0, 0);
        BC = false;
        Seed = "TBub";
        Spez = "BoxAfter";
        Man = true;
        
        if (arg7 != 0)
            Voice = arg7;
        
        scrFBres();
        
        while (i != string_length(arg0))
        {
            i += 1;
            CL = string_char_at(arg0, i);
            
            if (i == string_length(arg0))
                Make += CL;
            
            if (CL == "#" || i == string_length(arg0))
            {
                Text[j] = Make;
                j += 1;
                Make = "";
            }
            else
            {
                Make += CL;
            }
        }
        
        scrFBres();
        
        while (i != string_length(arg3))
        {
            i += 1;
            CL = string_char_at(arg3, i);
            
            if (i == string_length(arg3))
                Make += CL;
            
            if (CL == "#" || i == string_length(arg3))
            {
                Bubble_Xscale[j] = real(Make);
                j += 1;
                Make = "";
            }
            else
            {
                Make += CL;
            }
        }
        
        scrFBres();
        
        while (i != string_length(arg4))
        {
            i += 1;
            CL = string_char_at(arg4, i);
            
            if (i == string_length(arg4))
                Make += CL;
            
            if (CL == "#" || i == string_length(arg4))
            {
                Bubble_Yscale[j] = real(Make);
                j += 1;
                Make = "";
            }
            else
            {
                Make += CL;
            }
        }
        
        scrFBres();
        
        while (i != string_length(arg5))
        {
            i += 1;
            CL = string_char_at(arg5, i);
            
            if (i == string_length(arg5))
                Make += CL;
            
            if (CL == "#" || i == string_length(arg5))
            {
                Bubble_Arrow[j] = real(Make);
                j += 1;
                Make = "";
            }
            else
            {
                Make += CL;
            }
        }
        
        scrFBres();
        
        while (i != string_length(arg6))
        {
            i += 1;
            CL = string_char_at(arg6, i);
            
            if (i == string_length(arg6))
                Make += CL;
            
            if (CL == "#" || i == string_length(arg6))
            {
                AnMan[j] = real(Make);
                j += 1;
                Make = "";
            }
            else
            {
                Make += CL;
            }
        }
    }
}
