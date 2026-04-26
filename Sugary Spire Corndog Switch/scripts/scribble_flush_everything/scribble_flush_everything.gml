function scribble_flush_everything()
{
    var _i = 0;
    
    repeat (array_length(global.__scribble_ecache_array))
    {
        global.__scribble_ecache_array[_i].__flushed = true;
        _i++;
    }
    
    _i = 0;
    
    repeat (array_length(global.__scribble_gc_vbuff_ids))
    {
        vertex_delete_buffer(global.__scribble_gc_vbuff_ids[_i]);
        _i++;
    }
    
    global.__scribble_ecache_dict = {};
    array_resize(global.__scribble_ecache_name_array, 0);
    global.__scribble_ecache_name_index = 0;
    array_resize(global.__scribble_ecache_array, 0);
    global.__scribble_ecache_list_index = 0;
    global.__scribble_mcache_dict = {};
    array_resize(global.__scribble_mcache_name_array, 0);
    global.__scribble_mcache_name_index = 0;
    global.__scribble_gc_vbuff_index = 0;
    global.__scribble_gc_vbuff_refs = [];
    global.__scribble_gc_vbuff_ids = [];
}
