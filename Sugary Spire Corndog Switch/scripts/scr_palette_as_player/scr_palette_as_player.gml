function scr_palette_as_player(arg0 = sprite_index, arg1 = image_index)
{
    if (!sprite_exists(arg0))
        exit;
    
    if (sprite_exists(global.player_pal_texture) && !is_undefined(global.player_pal_texture))
    {
        pattern_setup(global.player_pal_texture, [2, 3], arg0, arg1);
    }
    else
    {
        var u_enabled = shader_get_uniform(shd_pal_swapper, "pattern_enabled");
        shader_set_uniform_i(u_enabled, false);
    }
    
    if (surface_exists(global.player_pal_surface))
        pal_swap_set(global.player_pal_surface, 1, true);
}

function new_palette(arg0, arg1, arg2 = arg1, arg3 = 8628991, arg4 = 14496, arg5 = 13773959, arg6 = 9988216, arg7 = -4)
{
    if (sprite_exists(arg1) && arg1 == arg2 && arg7 == -4)
    {
        arg7 = arg1;
        arg1 = [make_color_rgb(0, 0, 0), 0];
        arg2 = [make_color_rgb(0, 0, 0), 0.5];
    }
    
    var q = [0, 16777215, arg1, arg2, arg3, arg4, arg5, arg6];
    var _str = 
    {
        name: arg0,
        unlocked: true,
        pattern: arg7,
        colors: q
    };
    array_push(myPalettes, _str);
}

function pattern_setup(arg0, arg1 = [1, 2], arg2 = sprite_index, arg3 = image_index)
{
    var shader = shd_pal_swapper;
    var s_pat = shader_get_sampler_index(shader, "s_Pattern");
    var tex = sprite_get_texture(arg0, 0);
    var tex2 = sprite_get_texture(arg2, arg3);
    shader_set(shader);
    texture_set_stage(s_pat, tex);
    var u_spr = shader_get_uniform(shader, "u_SprRect");
    var u_pat = shader_get_uniform(shader, "u_PatRect");
    var u_texel = shader_get_uniform(shader, "u_TexelScl");
    var u_offset = shader_get_uniform(shader, "u_SprOffset");
    var u_enabled = shader_get_uniform(shader, "pattern_enabled");
    var u_array = shader_get_uniform(shader, "color_array");
    shader_set_uniform_i(u_enabled, true);
    var uvs = sprite_get_uvs(arg2, arg3);
    shader_set_uniform_f(u_spr, uvs[0], uvs[1], uvs[2], uvs[3]);
    shader_set_uniform_f(u_offset, uvs[4] - sprite_get_xoffset(arg2), uvs[5] - sprite_get_yoffset(arg2));
    uvs = sprite_get_uvs(arg0, 0);
    shader_set_uniform_f(u_pat, uvs[0], uvs[1], uvs[2], uvs[3]);
    shader_set_uniform_f(u_texel, texture_get_texel_width(tex), texture_get_texel_height(tex), texture_get_texel_width(tex2), texture_get_texel_height(tex2));
    shader_set_uniform_f_array(u_array, arg1);
}
