function ext(arg0, arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 2, arg5 = 2, arg6 = 0, arg7 = 16777215, arg8 = 1, arg9 = 0)
{
    if (arg9 != 0)
    {
        shader_set(shaRGB);
        shader_set_uniform_f(shader_get_uniform(shaRGB, "col_r"), arg9);
        shader_set_uniform_f(shader_get_uniform(shaRGB, "col_g"), arg9);
        shader_set_uniform_f(shader_get_uniform(shaRGB, "col_b"), arg9);
        shader_set_uniform_f(shader_get_uniform(shaRGB, "col_a"), 0);
    }
    
    draw_sprite_ext(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
    
    if (arg9 != 0)
        shader_reset();
}

function ext_ol(arg0, arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 2, arg5 = 2, arg6 = 0, arg7 = 16777215, arg8 = 1, arg9 = 0)
{
    ext(arg0, arg1, arg2 - (1 * arg4), arg3, arg4, arg5, arg6, 0, arg8, arg9);
    ext(arg0, arg1, arg2 + (1 * arg4), arg3, arg4, arg5, arg6, 0, arg8, arg9);
    ext(arg0, arg1, arg2, arg3 + (1 * arg5), arg4, arg5, arg6, 0, arg8, arg9);
    ext(arg0, arg1, arg2, arg3 - (1 * arg5), arg4, arg5, arg6, 0, arg8, arg9);
    ext(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
}
