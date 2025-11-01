function draw_set_mask(arg0, arg1, arg2, arg3 = 0, arg4 = false, arg5 = false)
{
    if (global.performance)
        return false;
    
    if (shader_current() != shd_masterclip && shader_current() != shd_masterclip_basic)
    {
        shader = arg5 ? shd_masterclip_basic : shd_masterclip;
        shader_set(shader);
    }
    
    var shader = shader_current();
    var u_clip_sprite_texture = shader_get_sampler_index(shader, "u_clip_sprite_texture");
    var u_clip_sprite_uvs = shader_get_uniform(shader, "u_clip_sprite_uvs");
    var u_clip_sprite_size = shader_get_uniform(shader, "u_clip_sprite_size");
    var u_clip_sprite_texelsize = shader_get_uniform(shader, "u_clip_sprite_texelsize");
    var u_clip_sprite_worldposition = shader_get_uniform(shader, "u_clip_sprite_worldposition");
    var u_clip_sprite_trimmed = shader_get_uniform(shader, "u_clip_sprite_trimmed");
    var u_alphafix = shader_get_uniform(shader, "u_mask_alphafix");
    var clip_sprite_texture = sprite_get_texture(arg2, arg3);
    var clip_uvs = sprite_get_uvs(arg2, arg3);
    shader_set_uniform_f(shader_get_uniform(shader, "u_domaskclip"), 1);
    texture_set_stage(u_clip_sprite_texture, clip_sprite_texture);
    shader_set_uniform_f(u_clip_sprite_uvs, clip_uvs[0], clip_uvs[1], clip_uvs[2], clip_uvs[3]);
    shader_set_uniform_f(u_clip_sprite_size, sprite_get_width(arg2), sprite_get_height(arg2));
    shader_set_uniform_f(u_clip_sprite_texelsize, texture_get_texel_width(clip_sprite_texture), texture_get_texel_height(clip_sprite_texture));
    shader_set_uniform_f(u_clip_sprite_trimmed, clip_uvs[4], clip_uvs[5], clip_uvs[6], clip_uvs[7]);
    shader_set_uniform_f(u_clip_sprite_worldposition, arg0, arg1);
    shader_set_uniform_f(u_alphafix, arg4 ? 1 : 0);
    return true;
}
