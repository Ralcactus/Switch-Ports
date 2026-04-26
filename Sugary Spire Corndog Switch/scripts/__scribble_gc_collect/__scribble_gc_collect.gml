function __scribble_gc_collect()
{
    if ((current_time - global.__scribble_cache_check_time) < ((0.95 * game_get_speed(gamespeed_microseconds)) / 1000))
        exit;
    
    global.__scribble_cache_check_time = current_time;
    
    if (os_is_paused() != global.__scribble_os_is_paused)
    {
        global.__scribble_os_is_paused = os_is_paused();
        global.__scribble_anim_shader_desync = true;
        global.__scribble_anim_shader_msdf_desync = true;
        global.__scribble_standard_shader_uniforms_dirty = true;
        global.__scribble_msdf_shader_uniforms_dirty = true;
    }
    
    var _array = global.__scribble_ecache_array;
    var _size = array_length(_array);
    var _index = min(global.__scribble_ecache_list_index, _size);
    
    repeat (max(3, ceil(sqrt(_size))))
    {
        _index--;
        
        if (_index < 0)
        {
            _index += array_length(_array);
            
            if (_index < 0)
            {
                _index = 0;
                break;
            }
        }
        
        var _element = _array[_index];
        
        if ((_element.__last_drawn + 120) < current_time)
        {
            array_delete(_array, _index, 1);
            variable_struct_remove(global.__scribble_ecache_dict, _element.__cache_name);
        }
    }
    
    global.__scribble_ecache_list_index = _index;
    _index = global.__scribble_ecache_name_index;
    _array = global.__scribble_ecache_name_array;
    var _dict = global.__scribble_ecache_dict;
    
    repeat (max(3, ceil(sqrt(array_length(_array)))))
    {
        _index--;
        
        if (_index < 0)
        {
            _index += array_length(_array);
            
            if (_index < 0)
            {
                _index = 0;
                break;
            }
        }
        
        var _name = _array[_index];
        var _weak = variable_struct_get(_dict, _name);
        
        if (_weak == undefined || !weak_ref_alive(_weak))
        {
            variable_struct_remove(_dict, _name);
            array_delete(_array, _index, 1);
        }
    }
    
    global.__scribble_ecache_name_index = _index;
    _index = global.__scribble_mcache_name_index;
    _array = global.__scribble_mcache_name_array;
    _dict = global.__scribble_mcache_dict;
    
    repeat (max(3, ceil(sqrt(array_length(_array)))))
    {
        _index--;
        
        if (_index < 0)
        {
            _index += array_length(_array);
            
            if (_index < 0)
            {
                _index = 0;
                break;
            }
        }
        
        var _name = _array[_index];
        var _weak = variable_struct_get(_dict, _name);
        
        if (_weak == undefined || !weak_ref_alive(_weak))
        {
            variable_struct_remove(_dict, _name);
            array_delete(_array, _index, 1);
        }
    }
    
    global.__scribble_mcache_name_index = _index;
    _index = global.__scribble_gc_vbuff_index;
    var _ref_array = global.__scribble_gc_vbuff_refs;
    var _id_array = global.__scribble_gc_vbuff_ids;
    
    repeat (max(3, ceil(sqrt(array_length(_ref_array)))))
    {
        _index--;
        
        if (_index < 0)
        {
            _index += array_length(_ref_array);
            
            if (_index < 0)
            {
                _index = 0;
                break;
            }
        }
        
        var _weak = _ref_array[_index];
        
        if (!weak_ref_alive(_weak))
        {
            vertex_delete_buffer(_id_array[_index]);
            array_delete(_ref_array, _index, 1);
            array_delete(_id_array, _index, 1);
        }
    }
    
    global.__scribble_gc_vbuff_index = _index;
}

function __scribble_gc_add_vbuff(arg0, arg1)
{
    array_push(global.__scribble_gc_vbuff_refs, weak_ref_create(arg0));
    array_push(global.__scribble_gc_vbuff_ids, arg1);
}

function __scribble_gc_remove_vbuff(arg0)
{
    var _index = __scribble_array_find_index(global.__scribble_gc_vbuff_ids, arg0);
    
    if (_index >= 0)
    {
        array_delete(global.__scribble_gc_vbuff_refs, _index, 1);
        array_delete(global.__scribble_gc_vbuff_ids, _index, 1);
    }
}
