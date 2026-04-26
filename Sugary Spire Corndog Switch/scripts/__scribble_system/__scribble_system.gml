var _font_directory = "";

if (variable_global_exists("__scribble_lcg"))
    return undefined;

__scribble_trace("Welcome to Scribble by @jujuadams! This is version 8.0.9, 2022-10-09");
__scribble_trace("Verbose mode is off, set SCRIBBLE_VERBOSE to <true> to see more information");
__scribble_system_glyph_data();

if (os_type == os_ios || os_type == os_android || os_type == os_tvos)
{
    if (_font_directory != "")
    {
        __scribble_error("GameMaker's Included Files work a bit strangely on iOS and Android.\nPlease use an empty string for the font directory and place fonts in the root of Included Files");
        exit;
    }
}
else
{
}

if (_font_directory != "")
{
    var _char = string_char_at(_font_directory, string_length(_font_directory));
    
    if (_char != "\\" && _char != "/")
        _font_directory += "\\";
    
    __scribble_trace("Using font directory \"", _font_directory, "\"");
}

if (_font_directory != "" && !directory_exists(_font_directory))
    __scribble_trace("Warning! Font directory \"" + string(_font_directory) + "\" could not be found in \"" + game_save_id + "\"!");

global.__scribble_lcg = date_current_datetime() * 100;
global.__scribble_font_directory = _font_directory;
global.__scribble_font_data = ds_map_create();
global.__scribble_effects = ds_map_create();
global.__scribble_effects_slash = ds_map_create();
global.__scribble_external_sound_map = ds_map_create();
global.__scribble_tex_index_lookup_map = ds_map_create();
global.__scribble_default_font = "scribble_fallback_font";
global.__scribble_buffer = buffer_create(1024, buffer_grow, 1);
global.__scribble_glyph_grid = ds_grid_create(1000, UnknownEnum.Value_22);
global.__scribble_control_grid = ds_grid_create(1000, UnknownEnum.Value_2);
global.__scribble_word_grid = ds_grid_create(1000, UnknownEnum.Value_6);
global.__scribble_line_grid = ds_grid_create(1000, UnknownEnum.Value_7);
global.__scribble_stretch_grid = ds_grid_create(1000, UnknownEnum.Value_3);
global.__scribble_temp_grid = ds_grid_create(1000, UnknownEnum.Value_6);
global.__scribble_temp2_grid = ds_grid_create(1000, UnknownEnum.Value_22);
global.__scribble_vbuff_pos_grid = ds_grid_create(1000, UnknownEnum.Value_4);
global.__scribble_cache_check_time = current_time + 1000;
global.__scribble_null_element = new __scribble_class_null_element();
global.__scribble_mcache_dict = {};
global.__scribble_mcache_name_array = [];
global.__scribble_mcache_name_index = 0;
global.__scribble_ecache_dict = {};
global.__scribble_ecache_array = [];
global.__scribble_ecache_list_index = 0;
global.__scribble_ecache_name_array = [];
global.__scribble_ecache_name_index = 0;
global.__scribble_gc_vbuff_index = 0;
global.__scribble_gc_vbuff_refs = [];
global.__scribble_gc_vbuff_ids = [];
global.__scribble_generator_state = {};

if (!variable_global_exists("__scribble_colours"))
    __scribble_config_colours();

if (!variable_global_exists("__scribble_typewriter_events"))
    global.__scribble_typewriter_events = ds_map_create();

ds_map_set(global.__scribble_typewriter_events, "pause", undefined);
ds_map_set(global.__scribble_typewriter_events, "delay", undefined);
ds_map_set(global.__scribble_typewriter_events, "speed", undefined);
ds_map_set(global.__scribble_typewriter_events, "/speed", undefined);
var _map = ds_map_create();
ds_map_set(_map, "", 0);
ds_map_set(_map, "/", 0);
ds_map_set(_map, "/font", 1);
ds_map_set(_map, "/f", 1);
ds_map_set(_map, "/colour", 2);
ds_map_set(_map, "/color", 2);
ds_map_set(_map, "/c", 2);
ds_map_set(_map, "/alpha", 3);
ds_map_set(_map, "/a", 3);
ds_map_set(_map, "/scale", 4);
ds_map_set(_map, "/s", 4);
ds_map_set(_map, "/page", 6);
ds_map_set(_map, "scale", 7);
ds_map_set(_map, "scaleStack", 8);
ds_map_set(_map, "alpha", 10);
ds_map_set(_map, "fa_left", 11);
ds_map_set(_map, "fa_center", 12);
ds_map_set(_map, "fa_centre", 12);
ds_map_set(_map, "fa_right", 13);
ds_map_set(_map, "fa_top", 14);
ds_map_set(_map, "fa_middle", 15);
ds_map_set(_map, "fa_bottom", 16);
ds_map_set(_map, "pin_left", 17);
ds_map_set(_map, "pin_center", 18);
ds_map_set(_map, "pin_centre", 18);
ds_map_set(_map, "pin_right", 19);
ds_map_set(_map, "fa_justify", 20);
ds_map_set(_map, "nbsp", 21);
ds_map_set(_map, "&nbsp", 21);
ds_map_set(_map, "nbsp;", 21);
ds_map_set(_map, "&nbsp;", 21);
ds_map_set(_map, "cycle", 22);
ds_map_set(_map, "/cycle", 23);
ds_map_set(_map, "r", 24);
ds_map_set(_map, "/b", 24);
ds_map_set(_map, "/i", 24);
ds_map_set(_map, "/bi", 24);
ds_map_set(_map, "b", 25);
ds_map_set(_map, "i", 26);
ds_map_set(_map, "bi", 27);
ds_map_set(_map, "surface", 28);
ds_map_set(_map, "region", 29);
ds_map_set(_map, "/region", 30);
ds_map_set(_map, "zwsp", 31);
global.__scribble_command_tag_lookup_accelerator = _map;
ds_map_set(global.__scribble_effects, "wave", 1);
ds_map_set(global.__scribble_effects, "shake", 2);
ds_map_set(global.__scribble_effects, "rainbow", 3);
ds_map_set(global.__scribble_effects, "wobble", 4);
ds_map_set(global.__scribble_effects, "pulse", 5);
ds_map_set(global.__scribble_effects, "wheel", 6);
ds_map_set(global.__scribble_effects, "cycle", 7);
ds_map_set(global.__scribble_effects, "jitter", 8);
ds_map_set(global.__scribble_effects, "blink", 9);
ds_map_set(global.__scribble_effects, "slant", 10);
ds_map_set(global.__scribble_effects_slash, "/wave", 1);
ds_map_set(global.__scribble_effects_slash, "/shake", 2);
ds_map_set(global.__scribble_effects_slash, "/rainbow", 3);
ds_map_set(global.__scribble_effects_slash, "/wobble", 4);
ds_map_set(global.__scribble_effects_slash, "/pulse", 5);
ds_map_set(global.__scribble_effects_slash, "/wheel", 6);
ds_map_set(global.__scribble_effects_slash, "/cycle", 7);
ds_map_set(global.__scribble_effects_slash, "/jitter", 8);
ds_map_set(global.__scribble_effects_slash, "/blink", 9);
ds_map_set(global.__scribble_effects_slash, "/slant", 10);
ds_map_set(global.__scribble_effects, "WAVE", 1);
ds_map_set(global.__scribble_effects, "SHAKE", 2);
ds_map_set(global.__scribble_effects, "RAINBOW", 3);
ds_map_set(global.__scribble_effects, "WOBBLE", 4);
ds_map_set(global.__scribble_effects, "PULSE", 5);
ds_map_set(global.__scribble_effects, "WHEEL", 6);
ds_map_set(global.__scribble_effects, "CYCLE", 7);
ds_map_set(global.__scribble_effects, "JITTER", 8);
ds_map_set(global.__scribble_effects, "BLINK", 9);
ds_map_set(global.__scribble_effects, "SLANT", 10);
ds_map_set(global.__scribble_effects_slash, "/WAVE", 1);
ds_map_set(global.__scribble_effects_slash, "/SHAKE", 2);
ds_map_set(global.__scribble_effects_slash, "/RAINBOW", 3);
ds_map_set(global.__scribble_effects_slash, "/WOBBLE", 4);
ds_map_set(global.__scribble_effects_slash, "/PULSE", 5);
ds_map_set(global.__scribble_effects_slash, "/WHEEL", 6);
ds_map_set(global.__scribble_effects_slash, "/CYCLE", 7);
ds_map_set(global.__scribble_effects_slash, "/JITTER", 8);
ds_map_set(global.__scribble_effects_slash, "/BLINK", 9);
ds_map_set(global.__scribble_effects_slash, "/SLANT", 10);
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_colour();
vertex_format_add_texcoord();
vertex_format_add_custom(vertex_type_float2, vertex_usage_color);
global.__scribble_vertex_format = vertex_format_end();
vertex_format_begin();
vertex_format_add_position();
vertex_format_add_color();
vertex_format_add_texcoord();
global.__scribble_passthrough_vertex_format = vertex_format_end();
global.__scribble_u_fTime = shader_get_uniform(__shd_scribble, "u_fTime");
global.__scribble_u_vColourBlend = shader_get_uniform(__shd_scribble, "u_vColourBlend");
global.__scribble_u_vGradient = shader_get_uniform(__shd_scribble, "u_vGradient");
global.__scribble_u_vSkew = shader_get_uniform(__shd_scribble, "u_vSkew");
global.__scribble_u_vFlash = shader_get_uniform(__shd_scribble, "u_vFlash");
global.__scribble_u_vRegionActive = shader_get_uniform(__shd_scribble, "u_vRegionActive");
global.__scribble_u_vRegionColour = shader_get_uniform(__shd_scribble, "u_vRegionColour");
global.__scribble_u_aDataFields = shader_get_uniform(__shd_scribble, "u_aDataFields");
global.__scribble_u_aBezier = shader_get_uniform(__shd_scribble, "u_aBezier");
global.__scribble_u_fBlinkState = shader_get_uniform(__shd_scribble, "u_fBlinkState");
global.__scribble_u_iTypewriterMethod = shader_get_uniform(__shd_scribble, "u_iTypewriterMethod");
global.__scribble_u_iTypewriterCharMax = shader_get_uniform(__shd_scribble, "u_iTypewriterCharMax");
global.__scribble_u_fTypewriterWindowArray = shader_get_uniform(__shd_scribble, "u_fTypewriterWindowArray");
global.__scribble_u_fTypewriterSmoothness = shader_get_uniform(__shd_scribble, "u_fTypewriterSmoothness");
global.__scribble_u_vTypewriterStartPos = shader_get_uniform(__shd_scribble, "u_vTypewriterStartPos");
global.__scribble_u_vTypewriterStartScale = shader_get_uniform(__shd_scribble, "u_vTypewriterStartScale");
global.__scribble_u_fTypewriterStartRotation = shader_get_uniform(__shd_scribble, "u_fTypewriterStartRotation");
global.__scribble_u_fTypewriterAlphaDuration = shader_get_uniform(__shd_scribble, "u_fTypewriterAlphaDuration");
global.__scribble_msdf_u_fTime = shader_get_uniform(__shd_scribble_msdf, "u_fTime");
global.__scribble_msdf_u_vColourBlend = shader_get_uniform(__shd_scribble_msdf, "u_vColourBlend");
global.__scribble_msdf_u_vGradient = shader_get_uniform(__shd_scribble_msdf, "u_vGradient");
global.__scribble_msdf_u_vSkew = shader_get_uniform(__shd_scribble_msdf, "u_vSkew");
global.__scribble_msdf_u_vFlash = shader_get_uniform(__shd_scribble_msdf, "u_vFlash");
global.__scribble_msdf_u_vRegionActive = shader_get_uniform(__shd_scribble_msdf, "u_vRegionActive");
global.__scribble_msdf_u_vRegionColour = shader_get_uniform(__shd_scribble_msdf, "u_vRegionColour");
global.__scribble_msdf_u_aDataFields = shader_get_uniform(__shd_scribble_msdf, "u_aDataFields");
global.__scribble_msdf_u_aBezier = shader_get_uniform(__shd_scribble_msdf, "u_aBezier");
global.__scribble_msdf_u_fBlinkState = shader_get_uniform(__shd_scribble_msdf, "u_fBlinkState");
global.__scribble_msdf_u_vTexel = shader_get_uniform(__shd_scribble_msdf, "u_vTexel");
global.__scribble_msdf_u_fMSDFRange = shader_get_uniform(__shd_scribble_msdf, "u_fMSDFRange");
global.__scribble_msdf_u_iTypewriterMethod = shader_get_uniform(__shd_scribble_msdf, "u_iTypewriterMethod");
global.__scribble_msdf_u_iTypewriterCharMax = shader_get_uniform(__shd_scribble_msdf, "u_iTypewriterCharMax");
global.__scribble_msdf_u_fTypewriterWindowArray = shader_get_uniform(__shd_scribble_msdf, "u_fTypewriterWindowArray");
global.__scribble_msdf_u_fTypewriterSmoothness = shader_get_uniform(__shd_scribble_msdf, "u_fTypewriterSmoothness");
global.__scribble_msdf_u_vTypewriterStartPos = shader_get_uniform(__shd_scribble_msdf, "u_vTypewriterStartPos");
global.__scribble_msdf_u_vTypewriterStartScale = shader_get_uniform(__shd_scribble_msdf, "u_vTypewriterStartScale");
global.__scribble_msdf_u_fTypewriterStartRotation = shader_get_uniform(__shd_scribble_msdf, "u_fTypewriterStartRotation");
global.__scribble_msdf_u_fTypewriterAlphaDuration = shader_get_uniform(__shd_scribble_msdf, "u_fTypewriterAlphaDuration");
global.__scribble_msdf_u_vShadowColour = shader_get_uniform(__shd_scribble_msdf, "u_vShadowColour");
global.__scribble_msdf_u_vShadowOffsetAndSoftness = shader_get_uniform(__shd_scribble_msdf, "u_vShadowOffsetAndSoftness");
global.__scribble_msdf_u_vBorderColour = shader_get_uniform(__shd_scribble_msdf, "u_vBorderColour");
global.__scribble_msdf_u_fBorderThickness = shader_get_uniform(__shd_scribble_msdf, "u_fBorderThickness");
global.__scribble_msdf_u_vOutputSize = shader_get_uniform(__shd_scribble_msdf, "u_vOutputSize");
global.__scribble_msdf_u_fMSDFThicknessOffset = shader_get_uniform(__shd_scribble_msdf, "u_fMSDFThicknessOffset");
global.__scribble_msdf_u_fSecondDraw = shader_get_uniform(__shd_scribble_msdf, "u_fSecondDraw");
scribble_msdf_thickness_offset(0);
global.__scribble_os_is_paused = false;
global.__scribble_anim_shader_desync = false;
global.__scribble_anim_shader_desync_to_default = false;
global.__scribble_anim_shader_default = false;
global.__scribble_anim_shader_msdf_desync = false;
global.__scribble_anim_shader_msdf_desync_to_default = false;
global.__scribble_anim_shader_msdf_default = false;
global.__scribble_standard_shader_uniforms_dirty = true;
global.__scribble_msdf_shader_uniforms_dirty = true;
global.__scribble_anim_properties = array_create(UnknownEnum.Value_21);
scribble_anim_reset();
global.__scribble_bezier_using = false;
global.__scribble_bezier_msdf_using = false;
global.__scribble_bezier_null_array = array_create(6, 0);
__scribble_font_add_all_from_project();

function __scribble_trace()
{
    var _string = "Scribble: ";
    var _i = 0;
    
    repeat (argument_count)
    {
        if (is_real(argument[_i]))
            _string += string_format(argument[_i], 0, 4);
        else
            _string += string(argument[_i]);
        
        _i++;
    }
    
    show_debug_message(_string);
}

function __scribble_loud()
{
    var _string = "Scribble:\n";
    var _i = 0;
    
    repeat (argument_count)
    {
        if (is_real(argument[_i]))
            _string += string_format(argument[_i], 0, 4);
        else
            _string += string(argument[_i]);
        
        _i++;
    }
    
    show_debug_message(_string);
    show_message(_string);
}

function __scribble_error()
{
    var _string = "";
    var _i = 0;
    
    repeat (argument_count)
    {
        _string += string(argument[_i]);
        _i++;
    }
    
    show_debug_message("Scribble 8.0.9: " + string_replace_all(_string, "\n", "\n\t\t  "));
    show_error("Scribble:\n" + _string + "\n ", true);
}

function __scribble_get_font_data(arg0)
{
    var _data = ds_map_find_value(global.__scribble_font_data, arg0);
    
    if (_data == undefined)
        __scribble_error("Font \"", arg0, "\" not recognised");
    
    return _data;
}

function __scribble_process_colour(arg0)
{
    if (is_string(arg0))
    {
        if (!variable_struct_exists(global.__scribble_colours, arg0))
            __scribble_error("Colour \"", arg0, "\" not recognised. Please add it to __scribble_config_colours()");
        
        return variable_struct_get(global.__scribble_colours, arg0) & 16777215;
    }
    else
    {
        return arg0;
    }
}

function __scribble_random()
{
    global.__scribble_lcg = (48271 * global.__scribble_lcg) % 2147483647;
    return global.__scribble_lcg / 2147483648;
}

function __scribble_array_find_index(arg0, arg1)
{
    var _i = 0;
    
    repeat (array_length(arg0))
    {
        if (arg0[_i] == arg1)
            return _i;
        
        _i++;
    }
    
    return -1;
}

function __scribble_asset_is_krutidev(arg0, arg1)
{
    var _tags_array = asset_get_tags(arg0, arg1);
    var _i = 0;
    
    repeat (array_length(_tags_array))
    {
        var _tag = _tags_array[_i];
        
        if (_tag == "scribble krutidev" || _tag == "Scribble krutidev" || _tag == "Scribble Krutidev")
            return true;
        
        _i++;
    }
    
    return false;
}

function __scribble_buffer_read_unicode(arg0)
{
    var _value = buffer_read(arg0, buffer_u8);
    
    if ((_value & 224) == 192)
    {
        _value = (_value & 31) << 6;
        _value += (buffer_read(arg0, buffer_u8) & 63);
    }
    else if ((_value & 240) == 224)
    {
        _value = (_value & 15) << 12;
        _value += ((buffer_read(arg0, buffer_u8) & 63) << 6);
        _value += (buffer_read(arg0, buffer_u8) & 63);
    }
    else if ((_value & 248) == 240)
    {
        _value = (_value & 7) << 18;
        _value += ((buffer_read(arg0, buffer_u8) & 63) << 12);
        _value += ((buffer_read(arg0, buffer_u8) & 63) << 6);
        _value += (buffer_read(arg0, buffer_u8) & 63);
    }
    
    return _value;
}

function __scribble_buffer_peek_unicode(arg0, arg1)
{
    var _value = buffer_peek(arg0, arg1, buffer_u8);
    
    if ((_value & 224) == 192)
    {
        _value = (_value & 31) << 6;
        _value += (buffer_peek(arg0, arg1 + 1, buffer_u8) & 63);
    }
    else if ((_value & 240) == 224)
    {
        _value = (_value & 15) << 12;
        _value += ((buffer_peek(arg0, arg1 + 1, buffer_u8) & 63) << 6);
        _value += (buffer_peek(arg0, arg1 + 2, buffer_u8) & 63);
    }
    else if ((_value & 248) == 240)
    {
        _value = (_value & 7) << 18;
        _value += ((buffer_peek(arg0, arg1 + 1, buffer_u8) & 63) << 12);
        _value += ((buffer_peek(arg0, arg1 + 2, buffer_u8) & 63) << 6);
        _value += (buffer_peek(arg0, arg1 + 3, buffer_u8) & 63);
    }
    
    return _value;
}

function __scribble_buffer_write_unicode(arg0, arg1)
{
    if (arg1 <= 127)
    {
        buffer_write(arg0, buffer_u8, arg1);
    }
    else if (arg1 <= 2047)
    {
        buffer_write(arg0, buffer_u8, 192 | (arg1 & 31));
        buffer_write(arg0, buffer_u8, 128 | ((arg1 >> 5) & 63));
    }
    else if (arg1 <= 65535)
    {
        buffer_write(arg0, buffer_u8, 192 | (arg1 & 15));
        buffer_write(arg0, buffer_u8, 128 | ((arg1 >> 4) & 63));
        buffer_write(arg0, buffer_u8, 128 | ((arg1 >> 10) & 63));
    }
    else if (arg1 <= 65536)
    {
        buffer_write(arg0, buffer_u8, 192 | (arg1 & 7));
        buffer_write(arg0, buffer_u8, 128 | ((arg1 >> 3) & 63));
        buffer_write(arg0, buffer_u8, 128 | ((arg1 >> 9) & 63));
        buffer_write(arg0, buffer_u8, 128 | ((arg1 >> 15) & 63));
    }
}

function __scribble_image_speed_get(arg0)
{
    return (sprite_get_speed_type(arg0) == 1) ? sprite_get_speed(arg0) : (sprite_get_speed(arg0) / game_get_speed(gamespeed_fps));
}

function __scribble_matrix_inverse(arg0)
{
    var _inv = array_create(16, undefined);
    _inv[0] = (((arg0[5] * arg0[10] * arg0[15]) - (arg0[5] * arg0[11] * arg0[14]) - (arg0[9] * arg0[6] * arg0[15])) + (arg0[9] * arg0[7] * arg0[14]) + (arg0[13] * arg0[6] * arg0[11])) - (arg0[13] * arg0[7] * arg0[10]);
    _inv[4] = (((-arg0[4] * arg0[10] * arg0[15]) + (arg0[4] * arg0[11] * arg0[14]) + (arg0[8] * arg0[6] * arg0[15])) - (arg0[8] * arg0[7] * arg0[14]) - (arg0[12] * arg0[6] * arg0[11])) + (arg0[12] * arg0[7] * arg0[10]);
    _inv[8] = (((arg0[4] * arg0[9] * arg0[15]) - (arg0[4] * arg0[11] * arg0[13]) - (arg0[8] * arg0[5] * arg0[15])) + (arg0[8] * arg0[7] * arg0[13]) + (arg0[12] * arg0[5] * arg0[11])) - (arg0[12] * arg0[7] * arg0[9]);
    _inv[12] = (((-arg0[4] * arg0[9] * arg0[14]) + (arg0[4] * arg0[10] * arg0[13]) + (arg0[8] * arg0[5] * arg0[14])) - (arg0[8] * arg0[6] * arg0[13]) - (arg0[12] * arg0[5] * arg0[10])) + (arg0[12] * arg0[6] * arg0[9]);
    _inv[1] = (((-arg0[1] * arg0[10] * arg0[15]) + (arg0[1] * arg0[11] * arg0[14]) + (arg0[9] * arg0[2] * arg0[15])) - (arg0[9] * arg0[3] * arg0[14]) - (arg0[13] * arg0[2] * arg0[11])) + (arg0[13] * arg0[3] * arg0[10]);
    _inv[5] = (((arg0[0] * arg0[10] * arg0[15]) - (arg0[0] * arg0[11] * arg0[14]) - (arg0[8] * arg0[2] * arg0[15])) + (arg0[8] * arg0[3] * arg0[14]) + (arg0[12] * arg0[2] * arg0[11])) - (arg0[12] * arg0[3] * arg0[10]);
    _inv[9] = (((-arg0[0] * arg0[9] * arg0[15]) + (arg0[0] * arg0[11] * arg0[13]) + (arg0[8] * arg0[1] * arg0[15])) - (arg0[8] * arg0[3] * arg0[13]) - (arg0[12] * arg0[1] * arg0[11])) + (arg0[12] * arg0[3] * arg0[9]);
    _inv[13] = (((arg0[0] * arg0[9] * arg0[14]) - (arg0[0] * arg0[10] * arg0[13]) - (arg0[8] * arg0[1] * arg0[14])) + (arg0[8] * arg0[2] * arg0[13]) + (arg0[12] * arg0[1] * arg0[10])) - (arg0[12] * arg0[2] * arg0[9]);
    _inv[2] = (((arg0[1] * arg0[6] * arg0[15]) - (arg0[1] * arg0[7] * arg0[14]) - (arg0[5] * arg0[2] * arg0[15])) + (arg0[5] * arg0[3] * arg0[14]) + (arg0[13] * arg0[2] * arg0[7])) - (arg0[13] * arg0[3] * arg0[6]);
    _inv[6] = (((-arg0[0] * arg0[6] * arg0[15]) + (arg0[0] * arg0[7] * arg0[14]) + (arg0[4] * arg0[2] * arg0[15])) - (arg0[4] * arg0[3] * arg0[14]) - (arg0[12] * arg0[2] * arg0[7])) + (arg0[12] * arg0[3] * arg0[6]);
    _inv[10] = (((arg0[0] * arg0[5] * arg0[15]) - (arg0[0] * arg0[7] * arg0[13]) - (arg0[4] * arg0[1] * arg0[15])) + (arg0[4] * arg0[3] * arg0[13]) + (arg0[12] * arg0[1] * arg0[7])) - (arg0[12] * arg0[3] * arg0[5]);
    _inv[14] = (((-arg0[0] * arg0[5] * arg0[14]) + (arg0[0] * arg0[6] * arg0[13]) + (arg0[4] * arg0[1] * arg0[14])) - (arg0[4] * arg0[2] * arg0[13]) - (arg0[12] * arg0[1] * arg0[6])) + (arg0[12] * arg0[2] * arg0[5]);
    _inv[3] = (((-arg0[1] * arg0[6] * arg0[11]) + (arg0[1] * arg0[7] * arg0[10]) + (arg0[5] * arg0[2] * arg0[11])) - (arg0[5] * arg0[3] * arg0[10]) - (arg0[9] * arg0[2] * arg0[7])) + (arg0[9] * arg0[3] * arg0[6]);
    _inv[7] = (((arg0[0] * arg0[6] * arg0[11]) - (arg0[0] * arg0[7] * arg0[10]) - (arg0[4] * arg0[2] * arg0[11])) + (arg0[4] * arg0[3] * arg0[10]) + (arg0[8] * arg0[2] * arg0[7])) - (arg0[8] * arg0[3] * arg0[6]);
    _inv[11] = (((-arg0[0] * arg0[5] * arg0[11]) + (arg0[0] * arg0[7] * arg0[9]) + (arg0[4] * arg0[1] * arg0[11])) - (arg0[4] * arg0[3] * arg0[9]) - (arg0[8] * arg0[1] * arg0[7])) + (arg0[8] * arg0[3] * arg0[5]);
    _inv[15] = (((arg0[0] * arg0[5] * arg0[10]) - (arg0[0] * arg0[6] * arg0[9]) - (arg0[4] * arg0[1] * arg0[10])) + (arg0[4] * arg0[2] * arg0[9]) + (arg0[8] * arg0[1] * arg0[6])) - (arg0[8] * arg0[2] * arg0[5]);
    var _det = (arg0[0] * _inv[0]) + (arg0[1] * _inv[4]) + (arg0[2] * _inv[8]) + (arg0[3] * _inv[12]);
    
    if (_det == 0)
    {
        __scribble_trace("Warning! Determinant of the matrix is zero");
        return arg0;
    }
    
    _det = 1 / _det;
    _inv[0] *= _det;
    _inv[1] *= _det;
    _inv[2] *= _det;
    _inv[3] *= _det;
    _inv[4] *= _det;
    _inv[5] *= _det;
    _inv[6] *= _det;
    _inv[7] *= _det;
    _inv[8] *= _det;
    _inv[9] *= _det;
    _inv[10] *= _det;
    _inv[11] *= _det;
    _inv[12] *= _det;
    _inv[13] *= _det;
    _inv[14] *= _det;
    _inv[15] *= _det;
    return _inv;
}
