#macro rps_type_standard 0
#macro rps_type_billboard 1
#macro rps_type_premultiplied 2

///@func pal_swap_init_system(shader, [billboardshader], [premultipliedshader])
function pal_swap_init_system(_shader, _billboardshader, _premultipliedshader)
{
	//Initiates the palette system.  Call once at the beginning of your game somewhere.
    //shader assets
    var _swapper = 
    {
        shader: noone,
        billboardshader: noone,
        premultipliedshader: noone,
        texel_size: [0],
        uvs: [0],
        index: [0],
        texture: [0]
    };
	
    _swapper.shader = _shader;
    _swapper.texel_size[0] = shader_get_uniform(_shader, "u_pixelSize");
    _swapper.uvs[0] = shader_get_uniform(_shader, "u_Uvs");
    _swapper.index[0] = shader_get_uniform(_shader, "u_paletteId");
    _swapper.texture[0] = shader_get_sampler_index(_shader, "u_palTexture");
	
    _swapper.billboardshader = _billboardshader;
    _swapper.texel_size[1] = shader_get_uniform(_billboardshader, "u_pixelSize");
    _swapper.uvs[1] = shader_get_uniform(_billboardshader, "u_Uvs");
    _swapper.index[1] = shader_get_uniform(_billboardshader, "u_paletteId");
    _swapper.texture[1] = shader_get_sampler_index(_billboardshader, "u_palTexture");
	
    _swapper.premultipliedshader = _premultipliedshader;
    _swapper.texel_size[2] = shader_get_uniform(_premultipliedshader, "u_pixelSize");
    _swapper.uvs[2] = shader_get_uniform(_premultipliedshader, "u_Uvs");
    _swapper.index[2] = shader_get_uniform(_premultipliedshader, "u_paletteId");
    _swapper.texture[2] = shader_get_sampler_index(_premultipliedshader, "u_palTexture");
	
    global.retro_pal_swapper = _swapper;
}

///@func pal_swap_set(palette_sprite_index, palette_index, palette is surface);
function pal_swap_set(_pal_sprite, _pal_index, _is_surface)
{
    var _swapper = global.retro_pal_swapper;
    
    if (_pal_index == 0) exit;
    
    var _mode = rps_type_standard;
    
    if (shader_current() == shd_billboard)
        _mode = rps_type_billboard;
    if (surface_get_target() == obj_drawcontroller.guisurf)
        _mode = rps_type_premultiplied;
    
    if (!_is_surface)
    {
		//Using a sprite based palette
        if (_mode == rps_type_billboard)
            shader_set(_swapper.billboardshader);
        else if (_mode == rps_type_premultiplied)
            shader_set(_swapper.premultipliedshader);
        else
            shader_set(_swapper.shader);
        
        var _tex = sprite_get_texture(_pal_sprite, 0);
        var _UVs = sprite_get_uvs(_pal_sprite, 0);
        texture_set_stage(_swapper.texture[_mode], _tex);
        var _texel_x = texture_get_texel_width(_tex);
        var _texel_y = texture_get_texel_height(_tex);
        var _texel_hx = _texel_x * 0.5;
        var _texel_hy = _texel_y * 0.5;
        shader_set_uniform_f(_swapper.texel_size[_mode], _texel_x, _texel_y);
        shader_set_uniform_f(_swapper.uvs[_mode], _UVs[0] + _texel_hx, _UVs[1] + _texel_hy, _UVs[2], _UVs[3]);
        shader_set_uniform_f(_swapper.index[_mode], _pal_index);
    }
    else
    {
		//Using a surface based palette
        if (_mode == rps_type_billboard)
            shader_set(_swapper.billboardshader);
        else if (_mode == rps_type_premultiplied)
            shader_set(_swapper.premultipledshader);
        else
            shader_set(_swapper.shader);
        
        var _tex = surface_get_texture(_pal_sprite);
        texture_set_stage(_swapper.texture[_mode], _tex);
        var _texel_x = texture_get_texel_width(_tex);
        var _texel_y = texture_get_texel_height(_tex);
        var _texel_hx = _texel_x * 0.5;
        var _texel_hy = _texel_y * 0.5;
        shader_set_uniform_f(_swapper.texel_size[_mode], _texel_x, _texel_y);
        shader_set_uniform_f(_swapper.uvs[_mode], _texel_hx, _texel_hy, 1 + _texel_hx, 1 + _texel_hy);
        shader_set_uniform_f(_swapper.index[_mode], _pal_index);
    }
}

/// @func pal_swap_reset();
function pal_swap_reset()
{
	//Resets the shader
    if (surface_get_target() == obj_drawcontroller.guisurf)
        shader_set(shd_premultiply);
    else if (shader_current() != -1)
        shader_reset();
}
