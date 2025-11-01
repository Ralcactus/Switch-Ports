function draw_set_bounds(arg0, arg1, arg2, arg3, arg4 = false, arg5 = false)
{
    if (global.performance)
        return false;
    
    if (shader_current() != shd_masterclip && shader_current() != shd_masterclip_basic)
    {
        shader = arg5 ? shd_masterclip_basic : shd_masterclip;
        shader_set(shader);
    }
    
    var shader = shader_current();
    var clip_bounds_pos = shader_get_uniform(shader, "u_clip_bounds");
    var alphafix_pos = shader_get_uniform(shader, "u_rect_alphafix");
    shader_set_uniform_f(shader_get_uniform(shader, "u_dorectclip"), 1);
    shader_set_uniform_f(clip_bounds_pos, arg0, arg1, arg2, arg3);
    shader_set_uniform_f(alphafix_pos, arg4 ? 1 : 0);
    return true;
}
