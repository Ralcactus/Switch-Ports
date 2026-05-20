function pup(arg0 = -1, arg1 = 0, arg2 = 0, arg3 = -1000, arg4 = sPup_Test, arg5 = 0, arg6 = [])
{
    with (instance_create_depth(arg1, arg2, arg3, oPuppet))
    {
        numb = arg0;
        image_speed = 0;
        sprite_index = arg4;
        image_index = arg5;
    }
    
    pup_add_atribute(arg0, arg6);
}

function pup_an(arg0 = -1, arg1 = -1, arg2 = -1, arg3 = -1, arg4 = -1, arg5 = -1, arg6 = [], arg7 = [])
{
    with (oPuppet)
    {
        if (numb == arg0)
        {
            if (arg1 != -1)
                speed_ = arg1;
            
            if (arg2 != -1)
            {
                targetX = arg2;
                targetTrue = true;
            }
            
            if (arg3 != -1)
            {
                targetY = arg3;
                targetTrue = true;
            }
            
            if (arg4 != -1)
            {
                path = arg4;
                pathStart = true;
            }
            
            if (arg5 != -1)
                func = arg5;
        }
    }
    
    if (array_length(arg6) > 0)
        pup_add_atribute(arg0, arg6);
    
    if (array_length(arg7) > 0)
        pup_del_atribute(arg0, arg7);
}

function pup_exists(arg0 = -1)
{
    var val = -1;
    
    with (oPuppet)
    {
        if (numb == arg0)
            val = self;
    }
    
    return val;
}

function pup_add_atribute(arg0 = -1, arg1 = [])
{
    with (oPuppet)
    {
        if (numb == arg0)
        {
            var i = 0;
            
            repeat (array_length(arg1))
            {
                array_push(atribute, arg1[i]);
                i++;
            }
        }
    }
}

function pup_del_atribute(arg0 = -1, arg1 = [])
{
    with (oPuppet)
    {
        if (numb == arg0)
        {
            var i = 0;
            
            repeat (array_length(atribute))
            {
                if (array_contains(arg1, atribute[i]))
                    atribute[i] = -1;
                
                i++;
            }
        }
    }
}

function pup_des(arg0 = -1)
{
    with (oPuppet)
    {
        if (numb == arg0)
            instance_destroy();
    }
}
