if (onoff != -4)
    pal_swap(pal_jello, 0, onoff + 1);

draw_self();

if (onoff != -4)
    shader_reset();
