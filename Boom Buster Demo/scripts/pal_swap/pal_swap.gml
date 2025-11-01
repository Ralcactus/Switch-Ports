function pal_swap(arg0, arg1, arg2, arg3 = true)
{
    if (arg3)
        shader_set(sha_palswap);
    
    var tex = sprite_get_texture(arg0, arg1);
    var UVs = sprite_get_uvs(arg0, arg1);
    texture_set_stage(global.gpal_tex, tex);
    gpu_set_texfilter_ext(global.gpal_tex, 1);
    var texel_x = texture_get_texel_width(tex);
    var texel_y = texture_get_texel_height(tex);
    var texel_hx = texel_x * 0.5;
    var texel_hy = texel_y * 0.5;
    shader_set_uniform_f(global.gtexel_size, texel_x, texel_y);
    shader_set_uniform_f(global.gpal_uvs, UVs[0] + texel_hx, UVs[1] + texel_hy, UVs[2] + texel_hx, UVs[3] + texel_hy);
    shader_set_uniform_f(global.gpal_index, arg2);
}
