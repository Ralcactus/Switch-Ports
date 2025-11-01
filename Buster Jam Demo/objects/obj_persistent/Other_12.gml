global.hmac_key = "the little bomb sorcerer having fun all day all night";

event_save_user = function()
{
    var _struct = 
    {
        highscore_endless: global.stats_highscore_endless,
        pfp: global.stats_pfp,
        pfp_uploaded: global.stats_pfp_uploaded
    };
    var _save_string = json_stringify(_struct);
    var _hmac_hash = sha1_string_utf8_hmac(global.hmac_key, _save_string);
    _save_string += string("#{0}#", _hmac_hash);
    _save_string = base64_encode(_save_string);
    var _file = file_text_open_write("data.dat");
    file_text_write_string(_file, _save_string);
    file_text_close(_file);
};

event_load_user = function()
{
    var _expected, _hashless_string;
    
    if (file_exists("data.dat"))
    {
        var _file = file_text_open_read("data.dat");
        var _save_string = file_text_read_string(_file);
        file_text_close(_file);
        _save_string = base64_decode(_save_string);
        var _expected_hash = string_copy(_save_string, string_length(_save_string) - 40, 40);
        _hashless_string = string_copy(_save_string, 1, string_length(_save_string) - 42);
        var _new_hash = sha1_string_utf8_hmac(global.hmac_key, _hashless_string);
        _expected = _expected_hash == _new_hash;
    }
    else
    {
        _expected = false;
    }
    
    var _data;
    
    if (_expected)
    {
        _data = json_parse(_hashless_string);
    }
    else
    {
        _data = 
        {
            pfp: 0,
            pfp_uploaded: 1,
            highscore_endless: 0
        };
        
        if (file_exists("data.dat"))
            file_delete("data.dat");
    }
    
    if (struct_exists(_data, "pfp_uploaded"))
        global.stats_pfp_uploaded = _data.pfp_uploaded;
    else
        global.stats_pfp_uploaded = true;
    
    if (struct_exists(_data, "pfp") && !global.stats_pfp_uploaded)
        global.stats_pfp = _data.pfp;
    else
        global.stats_pfp = 0;
    
    if (struct_exists(_data, "highscore_endless"))
        global.stats_highscore_endless = _data.highscore_endless;
    else
        global.stats_highscore_endless = 0;
    
    return _data;
};

event_load_user();
