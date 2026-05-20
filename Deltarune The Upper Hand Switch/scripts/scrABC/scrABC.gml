function des(arg0 = 0)
{
    if (arg0 == 0)
        instance_destroy();
    else
        instance_destroy(arg0);
}

function res_jam(arg0)
{
    jam = 0;
    jamSeed = 0;
    
    if (arg0 != 0)
        jamSeed[0] = "x";
}

function res_kep()
{
    kep = 0;
    kep1 = 0;
    kep2 = 0;
    kep3 = 0;
    kep4 = 0;
    kep5 = 0;
}

function res_i()
{
    i = 0;
    i1 = 0;
    i2 = 0;
    i3 = 0;
    i4 = 0;
    i5 = 0;
    i6 = 0;
    i7 = 0;
    i8 = 0;
    i9 = 0;
}

function res_j()
{
    j = 0;
    j1 = 0;
    j2 = 0;
    j3 = 0;
    j4 = 0;
    j5 = 0;
    j6 = 0;
    j7 = 0;
    j8 = 0;
    j9 = 0;
}

function res_k()
{
    k = 0;
    k1 = 0;
    k2 = 0;
    k3 = 0;
    k4 = 0;
    k5 = 0;
    k6 = 0;
    k7 = 0;
    k8 = 0;
    k9 = 0;
}

function rgb(arg0, arg1, arg2)
{
    return make_color_rgb(arg0, arg1, arg2);
}

function arrayContains(arg0, arg1)
{
    var array = arg0;
    var check = arg1;
    
    if (array_length(array) == 0)
    {
        return false;
    }
    else
    {
        var i = 0;
        var j = array_length(array);
        
        while (i < j)
        {
            if (array[i] == check)
            {
                arrayCat = i;
                return true;
            }
            
            i++;
        }
    }
}

function spawnEEF(arg0, arg1, arg2, arg3, arg4)
{
    with (instance_create_depth(arg0, arg1, -15100, oEEF))
    {
        if (string(arg4) != "0")
            seed = string_split(arg4, ",");
        
        if (string(arg2) != "0")
            sprite_index = arg2;
        else
            sprite_index = sPixel;
        
        image_index = arg3;
        
        if (array_contains(seed, "ending_star"))
            image_alpha = 0;
    }
}

function screenShake(arg0, arg1)
{
    op.shakeTime = arg0;
    op.shakePower = arg1;
    op.STstore = arg0;
    op.SPstore = arg1;
}

function snd(arg0, arg1 = 0)
{
    audio_play_sound(arg0, arg1, false);
}

function d_text(arg0, arg1, arg2)
{
    draw_set_font(fFont);
    draw_text_color(arg0 - 1, arg1, arg2, c_black, c_black, c_black, c_black, 1);
    draw_text_color(arg0 + 1, arg1, arg2, c_black, c_black, c_black, c_black, 1);
    draw_text_color(arg0, arg1 - 1, arg2, c_black, c_black, c_black, c_black, 1);
    draw_text_color(arg0, arg1 + 1, arg2, c_black, c_black, c_black, c_black, 1);
    draw_text(arg0, arg1, arg2);
}
