function scrNumber(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
{
    if (arg2 == 276)
    {
        sou(54);
        sou(88);
    }
    
    MoveX = 0;
    i = 0;
    
    if (arg4 != 0)
    {
        with (instance_create_depth(arg0, arg1 - oAlways.StackNumber, -20000, oNumber))
        {
            sprite_index = arg2;
            RGB = arg3;
            
            if (arg4 == "+")
                image_index = 10;
            
            if (arg4 == "-")
                image_index = 11;
            
            if (arg4 == "MISS")
                image_index = 13;
            
            if (arg4 == "DOWN")
                image_index = 14;
            
            if (arg4 == "MAX")
                image_index = 15;
            
            if (arg4 == "UP")
                image_index = 16;
            
            if (arg4 == "IMMUNE")
                image_index = 17;
        }
        
        MoveX += 20;
    }
    
    if (arg5 != "#")
    {
        while (i != string_length(string(arg5)))
        {
            i += 1;
            
            with (instance_create_depth(arg0 + MoveX, arg1 - oAlways.StackNumber, -9999, oNumber))
            {
                sprite_index = arg2;
                RGB = arg3;
                image_index = real(string_char_at(string(arg5), other.i));
            }
            
            MoveX += 20;
        }
    }
    
    if (arg6 != 0)
    {
        with (instance_create_depth(arg0 + MoveX, arg1 - oAlways.StackNumber, -9999, oNumber))
        {
            sprite_index = arg2;
            RGB = arg3;
            image_index = 12;
        }
    }
    
    oAlways.StackNumber += 20;
}
