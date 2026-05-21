function scr_palette_as_player(_my_sprite = sprite_index, _my_index = image_index)
{
    with (obj_player)
    {
        var my_color_array = my_palettes[paletteselect][2];
        var using_pattern = sprite_exists(my_color_array[2]);
    }
    
    if (surface_exists(obj_player.my_pal_surface) && !using_pattern)
        pal_swap_set(obj_player.my_pal_surface, 1, true);
    
    if (using_pattern && sprite_exists(_my_sprite))
    {
        var s_pat = shader_get_sampler_index(shd_pattern, "s_Pattern");
        var tex = sprite_get_texture(my_color_array[2], 0);
        var tex2 = sprite_get_texture(_my_sprite, _my_index);
        shader_set(shd_pattern);
        texture_set_stage(s_pat, tex);
		
        var mask_color = #FFFF40;
        var u_mask = shader_get_uniform(shd_pattern, "u_MaskColour");
        var u_spr = shader_get_uniform(shd_pattern, "u_SprRect");
        var u_pat = shader_get_uniform(shd_pattern, "u_PatRect");
        var u_texel = shader_get_uniform(shd_pattern, "u_TexelScl");
        var u_offset = shader_get_uniform(shd_pattern, "u_SprOffset");
		
        shader_set_uniform_f(u_mask, color_get_red(mask_color), color_get_green(mask_color), color_get_blue(mask_color));
        var uvs = sprite_get_uvs(_my_sprite, _my_index);
        shader_set_uniform_f(u_spr, uvs[0], uvs[1], uvs[2], uvs[3]);
        shader_set_uniform_f(u_offset, uvs[4] - sprite_get_xoffset(_my_sprite), uvs[5] - sprite_get_yoffset(_my_sprite));
        uvs = sprite_get_uvs(my_color_array[2], 0);
        shader_set_uniform_f(u_pat, uvs[0], uvs[1], uvs[2], uvs[3]);
        shader_set_uniform_f(u_texel, texture_get_texel_width(tex), texture_get_texel_height(tex), texture_get_texel_width(tex2), texture_get_texel_height(tex2));
    }
}

function new_palette(_name, _clothes, _clothes_shade, _skin = #ffaa83, _skin_shade = #a03800, _scooter = #872cd2, _scooter_thruster = #786898)
{
    var is_a_pattern = sprite_exists(_clothes);
    var q = 
	[
		0, 
		c_white, 
		_clothes, 
		_clothes_shade, 
		_skin, 
		_skin_shade, 
		_scooter, 
		_scooter_thruster
	];
    array_push(my_palettes, [_name, 1, q]);
}
