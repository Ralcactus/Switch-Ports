fade = approach(fade, fadein ? 0 : 1.2, 0.01);

if ((!fadein && fade >= 1.2) || input_check_pressed("jump"))
{
    if (currsplash == (array_length(splasharr) - 1))
    {
        input_clear_momentary(true);
        instance_create_depth(x, y, depth, obj_purefatintro);
        instance_destroy();
    }
    
    if (currsplash < (array_length(splasharr) - 1))
    {
        if (input_check_pressed("jump"))
            fade = 1;
        
        fadein = true;
        currsplash++;
        alarm[0] = 200;
    }
}
