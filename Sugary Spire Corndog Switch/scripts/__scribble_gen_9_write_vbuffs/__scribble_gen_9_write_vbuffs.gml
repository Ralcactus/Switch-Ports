function __scribble_gen_9_write_vbuffs()
{
    var _glyph_grid = global.__scribble_glyph_grid;
    var _control_grid = global.__scribble_control_grid;
    var _vbuff_pos_grid = global.__scribble_vbuff_pos_grid;
    var _element = global.__scribble_generator_state.__element;
    var _glyph_count = global.__scribble_generator_state.__glyph_count;
    ds_grid_set_grid_region(_vbuff_pos_grid, _glyph_grid, 0, UnknownEnum.Value_2, _glyph_count - 1, UnknownEnum.Value_3, 0, UnknownEnum.Value_0);
    ds_grid_set_grid_region(_vbuff_pos_grid, _glyph_grid, 0, UnknownEnum.Value_2, _glyph_count - 1, UnknownEnum.Value_3, 0, UnknownEnum.Value_2);
    ds_grid_add_grid_region(_vbuff_pos_grid, _glyph_grid, 0, UnknownEnum.Value_4, _glyph_count - 1, UnknownEnum.Value_4, 0, UnknownEnum.Value_2);
    ds_grid_add_grid_region(_vbuff_pos_grid, _glyph_grid, 0, UnknownEnum.Value_5, _glyph_count - 1, UnknownEnum.Value_5, 0, UnknownEnum.Value_3);
    var _bezier_do, _bezier_prev_cy, _bezier_lengths, _bezier_param_increment;
    
    if (is_array(global.__scribble_generator_state.__bezier_lengths_array))
    {
        _bezier_do = true;
        _bezier_lengths = global.__scribble_generator_state.__bezier_lengths_array;
        var _bezier_search_index = 0;
        var _bezier_search_d0 = 0;
        var _bezier_search_d1 = _bezier_lengths[1];
        _bezier_prev_cy = -infinity;
        _bezier_param_increment = 0.05263157894736842;
    }
    else
    {
        _bezier_do = false;
    }
    
    _vbuff_pos_grid = global.__scribble_vbuff_pos_grid;
    var _glyph_scale = 1;
    var _glyph_colour = 4294967295;
    var _glyph_cycle = 0;
    var _glyph_effect_flags = 0;
    var _glyph_sprite_data = 0;
    var _write_colour = 4294967295;
    var _control_index = 0;
    var _region_name = undefined;
    var _region_start = undefined;
    var _region_bbox_start = undefined;
    var _region_bbox_array = undefined;
    var _p = 0;
    var _i, _page_events_dict;
    
    repeat (__pages)
    {
        var _page_data = __pages_array[_p];
        _page_events_dict = _page_data.__events;
        var _vbuff = undefined;
        var _last_glyph_texture = undefined;
        _i = _page_data.__glyph_start;
        
        repeat (_page_data.__glyph_count)
        {
            var _packed_indexes = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_18);
            _control_delta = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_17) - _control_index;
            
            repeat (_control_delta)
            {
                switch (ds_grid_get(_control_grid, _control_index, UnknownEnum.Value_0))
                {
                    case UnknownEnum.Value_2:
                        _glyph_colour = ds_grid_get(_control_grid, _control_index, UnknownEnum.Value_1);
                        _write_colour = (!(os_type == os_windows || os_type == os_xboxone || os_type == os_gdk || os_type == os_uwp || os_type == os_win8native || os_type == os_winphone) || false) ? scribble_rgb_to_bgr(_glyph_colour) : _glyph_colour;
                        break;
                    
                    case UnknownEnum.Value_3:
                        _glyph_effect_flags = ds_grid_get(_control_grid, _control_index, UnknownEnum.Value_1);
                        break;
                    
                    case UnknownEnum.Value_4:
                        _glyph_cycle = ds_grid_get(_control_grid, _control_index, UnknownEnum.Value_1);
                        
                        if (_glyph_cycle == undefined)
                            _write_colour = (!(os_type == os_windows || os_type == os_xboxone || os_type == os_gdk || os_type == os_uwp || os_type == os_win8native || os_type == os_winphone) || false) ? scribble_rgb_to_bgr(_glyph_colour) : _glyph_colour;
                        else
                            _write_colour = (!(os_type == os_windows || os_type == os_xboxone || os_type == os_gdk || os_type == os_uwp || os_type == os_win8native || os_type == os_winphone) || false) ? scribble_rgb_to_bgr(_glyph_cycle) : _glyph_cycle;
                        
                        break;
                    
                    case UnknownEnum.Value_0:
                        var _animation_index = _packed_indexes div 1000;
                        var _event_array = variable_struct_get(_page_events_dict, _animation_index);
                        
                        if (!is_array(_event_array))
                        {
                            _event_array = [];
                            variable_struct_set(_page_events_dict, _animation_index, _event_array);
                        }
                        
                        var _event = ds_grid_get(_control_grid, _control_index, UnknownEnum.Value_1);
                        _event.position = _animation_index;
                        array_push(_event_array, _event);
                        break;
                    
                    case UnknownEnum.Value_5:
                        if (_region_name != undefined)
                        {
                            var _region_end = _i - 1;
                            
                            if (_region_start <= _region_end)
                            {
                                array_push(_region_bbox_array, 
                                {
                                    __x1: ds_grid_get_min(_vbuff_pos_grid, _region_bbox_start, UnknownEnum.Value_0, _region_end, UnknownEnum.Value_0),
                                    __y1: ds_grid_get_min(_vbuff_pos_grid, _region_bbox_start, UnknownEnum.Value_1, _region_end, UnknownEnum.Value_1),
                                    __x2: ds_grid_get_max(_vbuff_pos_grid, _region_bbox_start, UnknownEnum.Value_2, _region_end, UnknownEnum.Value_2),
                                    __y2: ds_grid_get_max(_vbuff_pos_grid, _region_bbox_start, UnknownEnum.Value_3, _region_end, UnknownEnum.Value_3)
                                });
                                array_push(_page_data.__region_array, 
                                {
                                    __name: _region_name,
                                    __bbox_array: _region_bbox_array,
                                    __start_glyph: _region_start - _page_data.__glyph_start,
                                    __end_glyph: _region_end - _page_data.__glyph_start
                                });
                            }
                        }
                        
                        _region_name = ds_grid_get(_control_grid, _control_index, UnknownEnum.Value_1);
                        _region_start = _i;
                        _region_bbox_start = _i;
                        _region_bbox_array = [];
                        break;
                    
                    case UnknownEnum.Value_6:
                        break;
                }
                
                _control_index++;
            }
            
            var _glyph_ord = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_0);
            
            if (_glyph_ord == -1)
            {
                var _glyph_x = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_2);
                var _glyph_y = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_3);
                var _glyph_width = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_4);
                var _glyph_height = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_5);
                _packed_indexes = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_18);
                var _sprite_index = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_19);
                var _image_index = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_20);
                var _image_speed = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_21);
                var _glyph_xscale = sprite_get_width(_sprite_index) / _glyph_width;
                var _glyph_yscale = sprite_get_height(_sprite_index) / _glyph_height;
                var _old_glyph_effect_flags = _glyph_effect_flags;
                
                if (_image_speed > 0)
                    _glyph_effect_flags |= 1;
                
                var _sprite_number = sprite_get_number(_sprite_index);
                
                if (_sprite_number >= 64)
                {
                    __scribble_trace("In-line sprites cannot have more than 64 frames (", sprite_get_name(_sprite_index), ")");
                    _sprite_number = 64;
                }
                
                if (_image_speed >= 4)
                {
                    __scribble_trace("Image speed cannot be more than 4.0 (" + string(_image_speed) + ")");
                    _image_speed = 4;
                }
                
                if (_image_speed < 0)
                {
                    __scribble_trace("Image speed cannot be less than 0.0 (" + string(_image_speed) + ")");
                    _image_speed = 0;
                }
                
                _glyph_sprite_data = (4096 * floor(1024 * _image_speed)) + (64 * _sprite_number) + _image_index;
                var _j = _image_index;
                
                repeat ((_image_speed > 0) ? _sprite_number : 1)
                {
                    var _glyph_texture = sprite_get_texture(_sprite_index, _j);
                    var _uvs = sprite_get_uvs(_sprite_index, _j);
                    var _quad_u0 = _uvs[0];
                    var _quad_v0 = _uvs[1];
                    var _quad_u1 = _uvs[2];
                    var _quad_v1 = _uvs[3];
                    var _quad_l = floor(_glyph_x + (_uvs[4] / _glyph_xscale));
                    var _quad_t = floor(_glyph_y + (_uvs[5] / _glyph_yscale));
                    var _quad_r = _quad_l + (_uvs[6] * _glyph_width);
                    var _quad_b = _quad_t + (_uvs[7] * _glyph_height);
                    var _half_w = 0.5 * (_quad_r - _quad_l);
                    var _half_h = 0.5 * (_quad_b - _quad_t);
                    
                    if (_glyph_texture != _last_glyph_texture)
                    {
                        _last_glyph_texture = _glyph_texture;
                        _vbuff = _page_data.__get_vertex_buffer(_glyph_texture, ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_15), ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_16), self);
                    }
                    
                    if (_bezier_do)
                    {
                        var _quad_cx = _quad_l + _half_w;
                        var _quad_cy = _quad_t + _half_h;
                        var _bezier_search_d1, _bezier_search_d0, _bezier_search_index;
                        
                        if (_quad_cy > _bezier_prev_cy)
                        {
                            _bezier_search_index = 0;
                            _bezier_search_d0 = 0;
                            _bezier_search_d1 = _bezier_lengths[1];
                        }
                        
                        _bezier_prev_cy = _quad_cy;
                        var _bezier_param;
                        
                        while (true)
                        {
                            if (_quad_cx <= _bezier_search_d1)
                            {
                                _bezier_param = _bezier_param_increment * (((_quad_cx - _bezier_search_d0) / (_bezier_search_d1 - _bezier_search_d0)) + _bezier_search_index);
                                break;
                            }
                            
                            _bezier_search_index++;
                            
                            if (_bezier_search_index >= 19)
                            {
                                _bezier_param = 1;
                                break;
                            }
                            
                            _bezier_search_d0 = _bezier_search_d1;
                            _bezier_search_d1 = _bezier_lengths[_bezier_search_index + 1];
                        }
                        
                        _quad_l = _bezier_param;
                        _quad_r = _bezier_param;
                        _quad_t = _quad_cy;
                        _quad_b = _quad_cy;
                    }
                    
                    vertex_position_3d(_vbuff, _quad_l, _quad_t, _packed_indexes);
                    vertex_normal(_vbuff, _half_w, _glyph_sprite_data, _glyph_effect_flags);
                    vertex_argb(_vbuff, _write_colour);
                    vertex_texcoord(_vbuff, _quad_u0, _quad_v0);
                    vertex_float2(_vbuff, _glyph_scale, _half_h);
                    vertex_position_3d(_vbuff, _quad_r, _quad_b, _packed_indexes);
                    vertex_normal(_vbuff, -_half_w, _glyph_sprite_data, _glyph_effect_flags);
                    vertex_argb(_vbuff, _write_colour);
                    vertex_texcoord(_vbuff, _quad_u1, _quad_v1);
                    vertex_float2(_vbuff, _glyph_scale, -_half_h);
                    vertex_position_3d(_vbuff, _quad_l, _quad_b, _packed_indexes);
                    vertex_normal(_vbuff, _half_w, _glyph_sprite_data, _glyph_effect_flags);
                    vertex_argb(_vbuff, _write_colour);
                    vertex_texcoord(_vbuff, _quad_u0, _quad_v1);
                    vertex_float2(_vbuff, _glyph_scale, -_half_h);
                    vertex_position_3d(_vbuff, _quad_r, _quad_b, _packed_indexes);
                    vertex_normal(_vbuff, -_half_w, _glyph_sprite_data, _glyph_effect_flags);
                    vertex_argb(_vbuff, _write_colour);
                    vertex_texcoord(_vbuff, _quad_u1, _quad_v1);
                    vertex_float2(_vbuff, _glyph_scale, -_half_h);
                    vertex_position_3d(_vbuff, _quad_l, _quad_t, _packed_indexes);
                    vertex_normal(_vbuff, _half_w, _glyph_sprite_data, _glyph_effect_flags);
                    vertex_argb(_vbuff, _write_colour);
                    vertex_texcoord(_vbuff, _quad_u0, _quad_v0);
                    vertex_float2(_vbuff, _glyph_scale, _half_h);
                    vertex_position_3d(_vbuff, _quad_r, _quad_t, _packed_indexes);
                    vertex_normal(_vbuff, -_half_w, _glyph_sprite_data, _glyph_effect_flags);
                    vertex_argb(_vbuff, _write_colour);
                    vertex_texcoord(_vbuff, _quad_u1, _quad_v0);
                    vertex_float2(_vbuff, _glyph_scale, _half_h);
                    _j++;
                    _glyph_sprite_data++;
                }
                
                _glyph_effect_flags = _old_glyph_effect_flags;
                _glyph_sprite_data = 0;
            }
            else if (_glyph_ord == -2)
            {
                var _quad_l = ds_grid_get(_vbuff_pos_grid, _i, UnknownEnum.Value_0);
                var _quad_t = ds_grid_get(_vbuff_pos_grid, _i, UnknownEnum.Value_1);
                var _quad_r = ds_grid_get(_vbuff_pos_grid, _i, UnknownEnum.Value_2);
                var _quad_b = ds_grid_get(_vbuff_pos_grid, _i, UnknownEnum.Value_3);
                var _glyph_texture = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_10);
                var _quad_u0 = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_11);
                var _quad_v0 = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_13);
                var _quad_u1 = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_12);
                var _quad_v1 = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_14);
                var _half_w = 0.5 * ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_4);
                var _half_h = 0.5 * ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_5);
                _glyph_scale = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_9);
                
                if (_glyph_texture != _last_glyph_texture)
                {
                    _last_glyph_texture = _glyph_texture;
                    _vbuff = _page_data.__get_vertex_buffer(_glyph_texture, ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_15), ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_16), self);
                }
                
                if (_bezier_do)
                {
                    var _quad_cx = _quad_l + _half_w;
                    var _quad_cy = _quad_t + _half_h;
                    var _bezier_search_d1, _bezier_search_d0, _bezier_search_index;
                    
                    if (_quad_cy > _bezier_prev_cy)
                    {
                        _bezier_search_index = 0;
                        _bezier_search_d0 = 0;
                        _bezier_search_d1 = _bezier_lengths[1];
                    }
                    
                    _bezier_prev_cy = _quad_cy;
                    var _bezier_param;
                    
                    while (true)
                    {
                        if (_quad_cx <= _bezier_search_d1)
                        {
                            _bezier_param = _bezier_param_increment * (((_quad_cx - _bezier_search_d0) / (_bezier_search_d1 - _bezier_search_d0)) + _bezier_search_index);
                            break;
                        }
                        
                        _bezier_search_index++;
                        
                        if (_bezier_search_index >= 19)
                        {
                            _bezier_param = 1;
                            break;
                        }
                        
                        _bezier_search_d0 = _bezier_search_d1;
                        _bezier_search_d1 = _bezier_lengths[_bezier_search_index + 1];
                    }
                    
                    _quad_l = _bezier_param;
                    _quad_r = _bezier_param;
                    _quad_t = _quad_cy;
                    _quad_b = _quad_cy;
                }
                
                vertex_position_3d(_vbuff, _quad_l, _quad_t, _packed_indexes);
                vertex_normal(_vbuff, _half_w, _glyph_sprite_data, _glyph_effect_flags);
                vertex_argb(_vbuff, _write_colour);
                vertex_texcoord(_vbuff, _quad_u0, _quad_v0);
                vertex_float2(_vbuff, _glyph_scale, _half_h);
                vertex_position_3d(_vbuff, _quad_r, _quad_b, _packed_indexes);
                vertex_normal(_vbuff, -_half_w, _glyph_sprite_data, _glyph_effect_flags);
                vertex_argb(_vbuff, _write_colour);
                vertex_texcoord(_vbuff, _quad_u1, _quad_v1);
                vertex_float2(_vbuff, _glyph_scale, -_half_h);
                vertex_position_3d(_vbuff, _quad_l, _quad_b, _packed_indexes);
                vertex_normal(_vbuff, _half_w, _glyph_sprite_data, _glyph_effect_flags);
                vertex_argb(_vbuff, _write_colour);
                vertex_texcoord(_vbuff, _quad_u0, _quad_v1);
                vertex_float2(_vbuff, _glyph_scale, -_half_h);
                vertex_position_3d(_vbuff, _quad_r, _quad_b, _packed_indexes);
                vertex_normal(_vbuff, -_half_w, _glyph_sprite_data, _glyph_effect_flags);
                vertex_argb(_vbuff, _write_colour);
                vertex_texcoord(_vbuff, _quad_u1, _quad_v1);
                vertex_float2(_vbuff, _glyph_scale, -_half_h);
                vertex_position_3d(_vbuff, _quad_l, _quad_t, _packed_indexes);
                vertex_normal(_vbuff, _half_w, _glyph_sprite_data, _glyph_effect_flags);
                vertex_argb(_vbuff, _write_colour);
                vertex_texcoord(_vbuff, _quad_u0, _quad_v0);
                vertex_float2(_vbuff, _glyph_scale, _half_h);
                vertex_position_3d(_vbuff, _quad_r, _quad_t, _packed_indexes);
                vertex_normal(_vbuff, -_half_w, _glyph_sprite_data, _glyph_effect_flags);
                vertex_argb(_vbuff, _write_colour);
                vertex_texcoord(_vbuff, _quad_u1, _quad_v0);
                vertex_float2(_vbuff, _glyph_scale, _half_h);
            }
            else if (_glyph_ord == 0 || _glyph_ord == 10)
            {
                if (_region_name != undefined)
                {
                    var _region_end = (_glyph_ord == 0) ? (_i - 1) : _i;
                    
                    if (_region_start <= _region_end)
                    {
                        array_push(_region_bbox_array, 
                        {
                            __x1: ds_grid_get_min(_vbuff_pos_grid, _region_bbox_start, UnknownEnum.Value_0, _region_end, UnknownEnum.Value_0),
                            __y1: ds_grid_get_min(_vbuff_pos_grid, _region_bbox_start, UnknownEnum.Value_1, _region_end, UnknownEnum.Value_1),
                            __x2: ds_grid_get_max(_vbuff_pos_grid, _region_bbox_start, UnknownEnum.Value_2, _region_end, UnknownEnum.Value_2),
                            __y2: ds_grid_get_max(_vbuff_pos_grid, _region_bbox_start, UnknownEnum.Value_3, _region_end, UnknownEnum.Value_3)
                        });
                    }
                    
                    _region_bbox_start = _region_end + 1;
                }
            }
            else if (_glyph_ord > 32 && _glyph_ord != 160 && _glyph_ord != 8203)
            {
                var _quad_l = ds_grid_get(_vbuff_pos_grid, _i, UnknownEnum.Value_0);
                var _quad_t = ds_grid_get(_vbuff_pos_grid, _i, UnknownEnum.Value_1);
                var _quad_r = ds_grid_get(_vbuff_pos_grid, _i, UnknownEnum.Value_2);
                var _quad_b = ds_grid_get(_vbuff_pos_grid, _i, UnknownEnum.Value_3);
                var _glyph_texture = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_10);
                var _quad_u0 = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_11);
                var _quad_v0 = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_13);
                var _quad_u1 = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_12);
                var _quad_v1 = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_14);
                var _half_w = 0.5 * ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_4);
                var _half_h = 0.5 * ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_5);
                _glyph_scale = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_9);
                
                if (_glyph_texture != _last_glyph_texture)
                {
                    _last_glyph_texture = _glyph_texture;
                    _vbuff = _page_data.__get_vertex_buffer(_glyph_texture, ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_15), ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_16), self);
                }
                
                if (_bezier_do)
                {
                    var _quad_cx = _quad_l + _half_w;
                    var _quad_cy = _quad_t + _half_h;
                    var _bezier_search_d1, _bezier_search_d0, _bezier_search_index;
                    
                    if (_quad_cy > _bezier_prev_cy)
                    {
                        _bezier_search_index = 0;
                        _bezier_search_d0 = 0;
                        _bezier_search_d1 = _bezier_lengths[1];
                    }
                    
                    _bezier_prev_cy = _quad_cy;
                    var _bezier_param;
                    
                    while (true)
                    {
                        if (_quad_cx <= _bezier_search_d1)
                        {
                            _bezier_param = _bezier_param_increment * (((_quad_cx - _bezier_search_d0) / (_bezier_search_d1 - _bezier_search_d0)) + _bezier_search_index);
                            break;
                        }
                        
                        _bezier_search_index++;
                        
                        if (_bezier_search_index >= 19)
                        {
                            _bezier_param = 1;
                            break;
                        }
                        
                        _bezier_search_d0 = _bezier_search_d1;
                        _bezier_search_d1 = _bezier_lengths[_bezier_search_index + 1];
                    }
                    
                    _quad_l = _bezier_param;
                    _quad_r = _bezier_param;
                    _quad_t = _quad_cy;
                    _quad_b = _quad_cy;
                }
                
                vertex_position_3d(_vbuff, _quad_l, _quad_t, _packed_indexes);
                vertex_normal(_vbuff, _half_w, _glyph_sprite_data, _glyph_effect_flags);
                vertex_argb(_vbuff, _write_colour);
                vertex_texcoord(_vbuff, _quad_u0, _quad_v0);
                vertex_float2(_vbuff, _glyph_scale, _half_h);
                vertex_position_3d(_vbuff, _quad_r, _quad_b, _packed_indexes);
                vertex_normal(_vbuff, -_half_w, _glyph_sprite_data, _glyph_effect_flags);
                vertex_argb(_vbuff, _write_colour);
                vertex_texcoord(_vbuff, _quad_u1, _quad_v1);
                vertex_float2(_vbuff, _glyph_scale, -_half_h);
                vertex_position_3d(_vbuff, _quad_l, _quad_b, _packed_indexes);
                vertex_normal(_vbuff, _half_w, _glyph_sprite_data, _glyph_effect_flags);
                vertex_argb(_vbuff, _write_colour);
                vertex_texcoord(_vbuff, _quad_u0, _quad_v1);
                vertex_float2(_vbuff, _glyph_scale, -_half_h);
                vertex_position_3d(_vbuff, _quad_r, _quad_b, _packed_indexes);
                vertex_normal(_vbuff, -_half_w, _glyph_sprite_data, _glyph_effect_flags);
                vertex_argb(_vbuff, _write_colour);
                vertex_texcoord(_vbuff, _quad_u1, _quad_v1);
                vertex_float2(_vbuff, _glyph_scale, -_half_h);
                vertex_position_3d(_vbuff, _quad_l, _quad_t, _packed_indexes);
                vertex_normal(_vbuff, _half_w, _glyph_sprite_data, _glyph_effect_flags);
                vertex_argb(_vbuff, _write_colour);
                vertex_texcoord(_vbuff, _quad_u0, _quad_v0);
                vertex_float2(_vbuff, _glyph_scale, _half_h);
                vertex_position_3d(_vbuff, _quad_r, _quad_t, _packed_indexes);
                vertex_normal(_vbuff, -_half_w, _glyph_sprite_data, _glyph_effect_flags);
                vertex_argb(_vbuff, _write_colour);
                vertex_texcoord(_vbuff, _quad_u1, _quad_v0);
                vertex_float2(_vbuff, _glyph_scale, _half_h);
            }
            
            _i++;
        }
        
        if (_region_name != undefined)
        {
            var _region_end = _i - 1;
            
            if (_region_start <= _region_end)
            {
                array_push(_region_bbox_array, 
                {
                    __x1: ds_grid_get_min(_vbuff_pos_grid, _region_bbox_start, UnknownEnum.Value_0, _region_end, UnknownEnum.Value_0),
                    __y1: ds_grid_get_min(_vbuff_pos_grid, _region_bbox_start, UnknownEnum.Value_1, _region_end, UnknownEnum.Value_1),
                    __x2: ds_grid_get_max(_vbuff_pos_grid, _region_bbox_start, UnknownEnum.Value_2, _region_end, UnknownEnum.Value_2),
                    __y2: ds_grid_get_max(_vbuff_pos_grid, _region_bbox_start, UnknownEnum.Value_3, _region_end, UnknownEnum.Value_3)
                });
                array_push(_page_data.__region_array, 
                {
                    __name: _region_name,
                    __bbox_array: _region_bbox_array,
                    __start_glyph: _region_start - _page_data.__glyph_start,
                    __end_glyph: _region_end - _page_data.__glyph_start
                });
            }
            
            _region_start = _i;
            _region_bbox_start = _i;
            _region_bbox_array = [];
        }
        
        _p++;
    }
    
    var _control_delta = ds_grid_get(_glyph_grid, _i - 1, UnknownEnum.Value_17) - _control_index;
    
    repeat (_control_delta)
    {
        if (ds_grid_get(_control_grid, _control_index, UnknownEnum.Value_0) == UnknownEnum.Value_0)
        {
            var _animation_index = _i;
            var _event_array = variable_struct_get(_page_events_dict, _animation_index);
            
            if (!is_array(_event_array))
            {
                _event_array = [];
                variable_struct_set(_page_events_dict, _animation_index, _event_array);
            }
            
            var _event = ds_grid_get(_control_grid, _control_index, UnknownEnum.Value_1);
            _event.position = _animation_index;
            array_push(_event_array, _event);
        }
        
        _control_index++;
    }
    
    if (!__uses_standard_font && !__uses_msdf_font)
        __uses_standard_font = true;
    
    __finalize_vertex_buffers(_element.__freeze);
}
