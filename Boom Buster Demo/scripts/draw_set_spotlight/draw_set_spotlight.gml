function draw_set_spotlight(arg0, arg1, arg2, arg3 = false, arg4 = false)
{
    if (global.performance)
        return false;
    
    if (shader_current() != shd_masterclip && shader_current() != shd_masterclip_basic)
    {
        shader = arg4 ? shd_masterclip_basic : shd_masterclip;
        shader_set(shader);
    }
    
    var shader = shader_current();
    var origin_pos = shader_get_uniform(shader, "u_origin");
    var radius_pos = shader_get_uniform(shader, "u_radius");
    var alphafix_pos = shader_get_uniform(shader, "u_circle_alphafix");
    shader_set_uniform_f(shader_get_uniform(shader, "u_docircleclip"), 1);
    shader_set_uniform_f(origin_pos, arg0, arg1);
    shader_set_uniform_f(radius_pos, arg2);
    shader_set_uniform_f(alphafix_pos, arg3 ? 1 : 0);
    return true;
}
