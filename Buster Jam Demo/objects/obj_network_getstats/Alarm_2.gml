if (tries == 15)
{
    print("could not get steam profile picture");
    failed = true;
    exit;
}

get_pfp = steam_get_user_avatar(global.steam_userID, 2);

if (get_pfp > 0)
{
    var _l_dims = steam_image_get_size(get_pfp);
    var _buff_size = _l_dims[0] * _l_dims[1] * 4;
    var _l_cols = buffer_create(_buff_size, buffer_fixed, 1);
    var _l_ok = steam_image_get_rgba(get_pfp, _l_cols, _buff_size);
    
    if (!_l_ok)
    {
        buffer_delete(_l_cols);
        exit;
    }
    
    var _l_surf = surface_create(_l_dims[0], _l_dims[1]);
    buffer_set_surface(_l_cols, _l_surf, 0);
    global.steam_pfp = sprite_create_from_surface(_l_surf, 0, 0, _l_dims[0], _l_dims[1], false, false, 0, 0);
    surface_free(_l_surf);
    buffer_delete(_l_cols);
    done = true;
    global.network_available = true;
}
else
{
    alarm[2] = 20;
    tries++;
}
