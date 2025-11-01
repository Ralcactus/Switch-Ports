var _async_id = ds_map_find_value(async_load, "id");
var _type = ds_map_find_value(async_load, "event_type");

if (_async_id == myhighscore_request_id)
{
    print(string("status: {0}", ds_map_find_value(async_load, "status")));
    
    if (ds_map_find_value(async_load, "status") == 0 && steam_initialised() && global.steam_userID != undefined && os_is_network_connected())
    {
        var _entries_json = ds_map_find_value(async_load, "entries");
        var _entries = json_parse(_entries_json);
        
        if (array_length(_entries.entries) > 0)
        {
            var _element = _entries.entries[0];
            
            if (_element.score > global.stats_highscore_endless)
            {
                global.stats_highscore_endless = _element.score;
                need_upload = true;
            }
            
            global.steam_username = _element.name;
            
            if (struct_exists(_element, "data"))
            {
                var _data_base64 = _element.data;
                var _buffer = buffer_base64_decode(_data_base64);
                
                if (global.stats_pfp_uploaded)
                    global.stats_pfp = buffer_read(_buffer, buffer_s8);
                
                buffer_delete(_buffer);
            }
            
            if (!global.stats_pfp_uploaded)
                need_upload = true;
        }
        
        event_user(1);
    }
    else
    {
        print("not loaded");
        
        if (alarm[0] == -1)
            alarm[0] = 20;
    }
}

if (_type == "leaderboard_upload")
{
    var _lb_ID = ds_map_find_value(async_load, "post_id");
    
    if (_lb_ID == upload_ID)
    {
        if (!steam_initialised())
            print("steam is not initialized");
        
        var _lb_name = ds_map_find_value(async_load, "lb_name");
        var _lb_done = ds_map_find_value(async_load, "success");
        print(string("upload done: {0}", _lb_done));
        var _lb_score = ds_map_find_value(async_load, "score");
        var _lb_updated = ds_map_find_value(async_load, "updated");
        print("leaderboard post ID:" + string(_lb_ID) + " to lb:" + string(_lb_name) + " with score:" + string(_lb_score) + " updated=" + string(_lb_updated));
        
        if (_lb_done)
        {
            event_user(3);
            
            with (obj_persistent)
                event_save_user();
        }
        else
        {
            alarm[1] = 60;
        }
    }
}
