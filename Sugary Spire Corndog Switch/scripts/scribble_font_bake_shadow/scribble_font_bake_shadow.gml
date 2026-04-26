function scribble_font_bake_shadow(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
    if (is_string(arg4))
    {
        var _found = variable_struct_get(global.__scribble_colours, arg4);
        
        if (arg4 == undefined)
        {
            __scribble_error("Colour \"", arg4, "\" not recognised");
            exit;
        }
        
        arg4 = _found & 16777215;
    }
    
    shader_set(__shd_scribble_bake_shadow);
    shader_set_uniform_f(shader_get_uniform(shader_current(), "u_vShadowDelta"), arg2, arg3);
    shader_set_uniform_f(shader_get_uniform(shader_current(), "u_vShadowColor"), color_get_red(arg4) / 255, color_get_green(arg4) / 255, color_get_blue(arg4) / 255, arg5);
    shader_reset();
    scribble_font_bake_shader(arg0, arg1, __shd_scribble_bake_shadow, 2, max(0, -arg2), max(0, -arg2), max(0, arg2), max(0, arg3), arg6, arg7);
}
