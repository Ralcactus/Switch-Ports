function textObj_start(arg0)
{
    cr_count = 0;
    obj_seed = 0;
    obj_seed = string_split(arg0, ",");
}

function textObj(arg0, arg1, arg2, arg3, arg4, arg5, arg6 = [], arg7 = -1)
{
    use_text[cr_count] = arg0;
    use_x[cr_count] = arg1;
    use_y[cr_count] = arg2;
    use_font[cr_count] = arg3;
    use_rgb[cr_count] = arg4;
    use_voice[cr_count] = arg5;
    use_printSeed[cr_count] = arg6;
    use_function[cr_count] = arg7;
    cr_count++;
}

function textObj1(arg0, arg1)
{
    use_bXscale[cr_count - 1] = arg0;
    use_bYscale[cr_count - 1] = arg1 + 1;
    use_x[cr_count - 1] -= arg0 * 30;
    use_y[cr_count - 1] -= (arg1 + 1) * 7.5;
}

function oneText(arg0, arg1, arg2, arg3, arg4, arg5 = -1, arg6 = [], arg7)
{
    op.face = [-1, -1, -1];
    
    if (arg5 == 0)
        arg5 = -1;
    
    array_push(arg6, "mono");
    array_push(arg6, "bc");
    
    with (instance_create_depth(0, 0, 0, oText))
    {
        textObj_start(arg7);
        textObj(arg0, arg1, arg2, arg3, arg4, arg5, arg6);
    }
}
