if (y < 64)
    y = 64;

if (x < 130)
    x = 130;

if (x > (room_width - 130))
    x = room_width - 130;

if (exit_freeze())
    exit;

sparkle_alpha -= 0.0075;

if (!set)
{
    if (frac(amount))
        amount = string_add_zeros(amount, 0, 2);
    
    str = string("${0}", amount);
    
    for (var i = 0; i < string_length(str); i++)
    {
        text[i] = string_char_at(str, i + 1);
        textW[i] = string_width(text[i]);
        scale[i] = 0.5;
        percent[i] = 0;
        wait[i] = i * 3;
        yoff[i] = 10;
        alpha[i] = 1;
        alphaTotal[i] = 1;
        ready[i] = false;
    }
    
    set = true;
}

for (var i = 0; i < array_length(text); i++)
{
    wait[i]--;
    
    if (wait[i] <= 0)
        ready[i] = true;
}

vspd = lerp(vspd, 0, 0.03);
y += vspd;
timer_logic(0);
timer_logic(1);

for (var i = 0; i < string_length(str); i++)
{
    if (ready[i])
    {
        percent[i] = approach(percent[i], 1, 0.015);
        scale[i] = use_curve(acurv_score, percent[i], undefined, 0.5, 1);
        yoff[i] = use_curve(acurv_score, percent[i], undefined, 40, 0);
        
        if (alpha[i] > 0)
            alpha[i] -= 0.08;
        
        if (alpha[i] <= 0)
            alpha[i] += 1;
        
        alphaTotal[i] -= 0.01;
    }
}

if (fadeOut)
{
    image_alpha -= 0.065;
    
    if (image_alpha <= 0)
        instance_destroy();
}
