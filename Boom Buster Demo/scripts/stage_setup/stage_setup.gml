function stage_setup()
{
    global.list_elements = ds_list_create();
    list_timestamps = ds_list_create();
    bgm = bgm_city;
    global.map_path_data = ds_map_create();
    var _method = 1;
    
    if (_method == 0)
    {
        var _rm = room_get_name(room);
        var _scr = asset_get_index(string("stageload_{0}", _rm));
        
        if (script_exists(_scr))
            script_execute(_scr);
        else
            show_debug_message(string("'stageload_{0}' doesn't exist", _rm));
    }
    else if (_method == 1)
    {
        var _world;
        
        if (global.world == 0)
            _world = "tutorial";
        else if (global.world == 1)
            _world = "w1 city";
        else if (global.world == 2)
            _world = "w2 rio";
        
        var _data = load_json(string("stages/{0}/s{1}a{2}.json", _world, global.stage, global.act));
        
        if (!audio_is_playing(asset_get_index(_data.bgm)))
        {
            bgm = asset_get_index(_data.bgm);
            
            if (_data.bgm == "bgm_city")
            {
                global.bgmLoopStart = 35.811;
                global.bgmLoopEnd = 248.886;
                global.bgmBPM = 135;
            }
            else if (_data.bgm == "bgm_city_b")
            {
                global.bgmBPM = 108;
                global.bgmLoopStart = 2.22;
                global.bgmLoopEnd = 135.55;
            }
            else if (_data.bgm == "bgm_boss")
            {
                global.bgmLoopStart = 14.769;
                global.bgmLoopEnd = 132.88;
            }
            else if (_data.bgm == "bgm_grotto")
            {
                global.bgmLoopStart = 0;
                global.bgmLoopEnd = 184.806;
            }
        }
        
        if (struct_exists(_data, "name"))
            global.act_name = _data.name;
        else
            global.act_name = "NO LEVEL NAME";
        
        if (struct_exists(_data, "bossfight"))
            bossfight = true;
        
        var fileName = file_find_first(string("stages/{0}/*.json", _world), 0);
        var i = 0;
        global.acts = 0;
        
        while (fileName != "")
        {
            if (string_char_at(fileName, 2) == string(global.stage))
                global.acts++;
            
            i++;
            fileName = file_find_next();
        }
        
        file_find_close();
        
        if (struct_exists(_data, "paths"))
        {
            var _paths_array = _data.paths;
            
            for (i = 0; i < array_length(_paths_array); i++)
            {
                var _name = _paths_array[i].name;
                var _thing = {};
                
                if (struct_exists(_paths_array[i], "pause"))
                    _thing.pause = _paths_array[i].pause;
                
                if (struct_exists(_paths_array[i], "ease"))
                    _thing.ease = _paths_array[i].ease;
                
                if (struct_exists(_paths_array[i], "spd"))
                    _thing.spd = _paths_array[i].spd;
                
                ds_map_add(global.map_path_data, _name, _thing);
            }
        }
        var _elements_array = _data.elements;
        
        for (i = 0; i < array_length(_elements_array); i++)
            ds_list_add(global.list_elements, _elements_array[i]);
        
        _data = undefined;
    }
    
    boms_total = 0;
    
    for (var i = 0; i < ds_list_size(global.list_elements); i++)
    {
        var _element = ds_list_find_value(global.list_elements, i);
        
        if (_element == "none")
        {
            ds_list_clear(global.list_elements);
            break;
        }
        
        ds_list_add(list_timestamps, _element.timestamp);
        
        if (_element.row == 0)
            boms_total++;
    }
    
    ds_list_sort(list_timestamps, false);
    last_timestamp = ds_list_find_value(list_timestamps, 0);
    
    if (boms_total == 0)
    {
        bridget_state = bridget_state_brb;
        bridget_sprite = spr_tv_brb_bridget;
    }
}
