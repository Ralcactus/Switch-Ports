function string_is_swear(arg0)
{
    return array_contains(master.swears, string_trim(string_lower(arg0)));
}

function string_has_swear(arg0)
{
    var _tstart = current_time;
    
    for (var _anchor = 1; _anchor <= string_length(arg0); _anchor++)
    {
        var _max_len = string_length(arg0) - (_anchor - 1);
        
        for (var _len = _max_len; _len > 0; _len--)
        {
            var _substr = string_copy(arg0, _anchor, _len);
            
            if (string_is_swear(_substr))
                return true;
        }
    }
    
    show_debug_message("swear check elapsed time: " + string(current_time - _tstart) + "ms");
    return false;
}

function load_swears()
{
    with (master)
    {
        var _path = "loc/" + current_language + "/swears.txt";
        swears = [];
        var _file = file_text_open_read(_path);
        
        while (!file_text_eof(_file))
        {
            array_push(swears, file_text_read_string(_file));
            file_text_readln(_file);
        }
    }
}
