global.langstruct = {};

function strings_read(_str_file)
{
    var _stringsfile = buffer_load(_str_file);
    var _strings = buffer_read(_stringsfile, buffer_string);
    global.langstruct = json_parse(_strings);
    buffer_delete(_stringsfile);
}

function string_get(_str)
{
    var _vars = string_split(_str, "/");
    var _prevvar = global.langstruct;
    
    for (var i = 0; i < array_length(_vars); i++)
        _prevvar = variable_struct_get(_prevvar, _vars[i]);
    
    if (is_undefined(_prevvar))
        return "UNDEFINED STRING";
    else
        _prevvar = variable_clone(_prevvar);
    
    for (var p = 1; p < argument_count; p++)
    {
        var _replace = argument[p];
        var _isdirectory = true;
        var _aroot;
        
        if (is_string(_replace))
        {
            var _adir = string_split(_replace, "/");
            _aroot = global.langstruct;
            
            for (var l = 0; l < array_length(_adir); l++)
            {
                var _founddir = variable_struct_get(_aroot, _adir[l]);
                
                if (is_undefined(_founddir))
                {
                    _isdirectory = false;
                    break;
                }
                else
                    _aroot = _founddir;
            }
        }
        else
            _isdirectory = false;
        
        _replace = _isdirectory ? _aroot : string(_replace);
        
        if (is_array(_prevvar))
        {
            for (var i = 0; i < array_length(_prevvar); i++)
                _prevvar[i] = string_replace(_prevvar[i], string("{{0}}", p - 1), _replace);
        }
        else
            _prevvar = string_replace(_prevvar, string("{{0}}", p - 1), _replace);
    }
    
    return _prevvar;
}
