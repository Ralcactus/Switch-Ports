testvariablenothing = false;
var _type = ds_map_find_value(async_load, "event_type");
var _async_id = ds_map_find_value(async_load, "id");

if (_async_id == scores_request_id)
{
    if (ds_map_find_value(async_load, "status") == 0)
    {
        loaded = true;
        loading_count = 0;
        loading = false;
        scroll_jump[leaderboard_selected] = true;
        var _entries_json = ds_map_find_value(async_load, "entries");
        var _entries = json_parse(_entries_json);
        var _cap = 100;
        
        if (array_length(_entries.entries) > _cap)
        {
            var _new = [];
            
            for (var i = 0; i < _cap; i++)
                _new[i] = _entries.entries[i];
            
            _entries.entries = _new;
        }
        
        for (var i = 0; i < fake_entry_count; i++)
        {
            var _struct = 
            {
                name: choose("superawesomeminecraft64", "bruhbruihbruhrufhwefafweasdasd", "Vinny", "Miles", "buster", "bridget", "zig", "eddy", "wizard", "lance", "dennis", "jade", "snake", "jeckles"),
                score: irandom_range(0, 1000),
                userID: 76561198799283040,
                rank: -4
            };
            array_push(_entries.entries, _struct);
        }
        
        var _sort = function(arg0, arg1)
        {
            return arg0.rank - arg1.rank;
        };
        
        array_sort(_entries.entries, _sort);
        scores[leaderboard_selected] = _entries.entries;
        pfp[leaderboard_selected] = [];
        
        for (var i = 0; i < array_length(scores[leaderboard_selected]); i++)
            pfp[leaderboard_selected][i] = steam_get_user_avatar(scores[leaderboard_selected][i].userID, 2);
        
        array_foreach(scores[leaderboard_selected], function(arg0, arg1)
        {
            arg0.pfp = -1;
            
            if (struct_exists(arg0, "data"))
            {
                _data_base64 = arg0.data;
                _buffer = buffer_base64_decode(_data_base64);
                arg0.pfp = buffer_read(_buffer, buffer_s8);
                buffer_delete(_buffer);
            }
        });
        
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
                var _spr = sprite_create_from_surface(_l_surf, 0, 0, _l_dims[0], _l_dims[1], false, false, 0, 0);
                pfp[leaderboard_selected][i] = 
                {
                    spr: _spr
                };
                array_push(pfps_loaded[leaderboard_selected], _spr);
                surface_free(_l_surf);
                buffer_delete(_l_cols);
            }
            else
            {
                print(string("not loaded: {0}", i));
            }
        }
        
        if (opening)
        {
            event_load_leaderboard(10);
            opening = false;
        }
    }
}
