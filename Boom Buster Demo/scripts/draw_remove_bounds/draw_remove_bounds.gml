function draw_remove_bounds()
{
    if (global.performance || (shader_current() != shd_masterclip && shader_current() != shd_masterclip_basic))
        return false;
    
    shader_set_uniform_f(shader_get_uniform(shader_current(), "u_dorectclip"), 0);
    return true;
}
