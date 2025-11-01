var _type = ds_map_find_value(async_load, "event_type");
var _async_id = ds_map_find_value(async_load, "id");

if (_type == "leaderboard_upload")
{
    var _lb_ID = ds_map_find_value(async_load, "post_id");
    
    if (_lb_ID == upload_ID)
    {
        var _lb_name = ds_map_find_value(async_load, "lb_name");
        var _lb_done = ds_map_find_value(async_load, "success");
        var _lb_score = ds_map_find_value(async_load, "score");
        var _lb_updated = ds_map_find_value(async_load, "updated");
        print("leaderboard post ID:" + string(_lb_ID) + " to lb:" + string(_lb_name) + " with score:" + string(_lb_score) + " updated=" + string(_lb_updated));
        
        if (_lb_done)
            print("- Succeeded");
        else
            print("- Failed");
    }
}

if (_async_id == scores_request_id)
{
    print(ds_map_find_value(async_load, "status"));
    
    if (ds_map_find_value(async_load, "status") == 0)
    {
        var _entries_json = ds_map_find_value(async_load, "entries");
        var _entries = json_parse(_entries_json);
        
        for (var i = 0; i < 99; i++)
        {
            var _struct = 
            {
                name: choose("vinny", "miles", "buster", "bridget", "zig", "eddy", "wizard", "lance", "dennis", "jade", "snake", "jeckles"),
                score: irandom_range(0, 1000),
                userID: 76561198799283040
            };
            array_push(_entries.entries, _struct);
        }
        
        var _sort = function(arg0, arg1)
        {
            return arg1.score - arg0.score;
        };
        
        array_sort(_entries.entries, _sort);
        scores[leaderboard_selected] = _entries.entries;
        pfp[leaderboard_selected] = [];
        
        for (var i = 0; i < array_length(scores[leaderboard_selected]); i++)
            pfp[leaderboard_selected][i] = steam_get_user_avatar(scores[leaderboard_selected][i].userID, 0);
        
        array_foreach(scores[leaderboard_selected], function(arg0, arg1)
        {
            arg0.message = "";
            
            if (struct_exists(arg0, "data"))
            {
                _data_base64 = arg0.data;
                _buffer = buffer_base64_decode(_data_base64);
                arg0.message = buffer_read(_buffer, buffer_string);
                buffer_delete(_buffer);
            }
        });
    }
}

for (var i = 0; i < array_length(pfp[leaderboard_selected]); i++)
{
    var _this = pfp[leaderboard_selected][i];
    
    if (is_struct(_this))
        continue;
    
    if (_this > 0)
    {
        var _l_dims = steam_image_get_size(_this);
        var _buff_size = _l_dims[0] * _l_dims[1] * 4;
        var _l_cols = buffer_create(_buff_size, buffer_fixed, 1);
        var _l_ok = steam_image_get_rgba(_this, _l_cols, _buff_size);
        
        if (!_l_ok)
        {
            buffer_delete(_l_cols);
            exit;
        }
        
        var _l_surf = surface_create(_l_dims[0], _l_dims[1]);
        buffer_set_surface(_l_cols, _l_surf, 0);
        pfp[leaderboard_selected][i] = 
        {
            spr: sprite_create_from_surface(_l_surf, 0, 0, _l_dims[0], _l_dims[1], false, false, 0, 0)
        };
        surface_free(_l_surf);
        buffer_delete(_l_cols);
    }
    else
    {
        print(string("not loaded: {0}", i));
    }
}
