function __input_snap_to_json()
{
    var _ds = argument[0];
    var _pretty = (argument_count > 1 && argument[1] != undefined) ? argument[1] : false;
    var _alphabetise = (argument_count > 2 && argument[2] != undefined) ? argument[2] : false;
    return new __input_snap_to_json_parser(_ds, _pretty, _alphabetise).__result;
}

function __input_snap_to_json_parser(argument0, argument1, argument2) constructor
{
    static __parse_struct = function(argument0)
    {
        var _names = variable_struct_get_names(argument0);
        var _count = array_length(_names);
        var _i = 0;
        
        if (__alphabetise)
        {
            var _list = ds_list_create();
            
            repeat (_count)
            {
                ds_list_set(_list, _i, _names[_i]);
                _i++;
            }
            
            ds_list_sort(_list, true);
            _i = 0;
            
            repeat (_count)
            {
                _names[_i] = ds_list_find_value(_list, _i);
                _i++;
            }
            
            ds_list_destroy(_list);
            _i = 0;
        }
        
        if (__pretty)
        {
            if (_count > 0)
            {
                buffer_write(__buffer, buffer_text, "{\n");
                __indent += "    ";
                var _written = false;
                
                repeat (_count)
                {
                    var _name = _names[_i];
                    __value = variable_struct_get(argument0, _name);
                    
                    if (!is_method(__value))
                    {
                        if (is_struct(_name) || is_array(_name))
                        {
                            show_error("Key type \"" + typeof(_name) + "\" not supported\n ", false);
                            _name = _string(ptr(_name));
                        }
                        
                        buffer_write(__buffer, buffer_text, __indent + "\"");
                        buffer_write(__buffer, buffer_text, _string(_name));
                        buffer_write(__buffer, buffer_text, "\" : ");
                        __write_value();
                        buffer_write(__buffer, buffer_text, ",\n");
                        _written = true;
                    }
                    
                    _i++;
                }
                
                __indent = string_copy(__indent, 1, string_length(__indent) - 4);
                
                if (_written)
                    buffer_seek(__buffer, buffer_seek_relative, -2);
                
                buffer_write(__buffer, buffer_text, "\n" + __indent + "}");
            }
            else
            {
                buffer_write(__buffer, buffer_text, "{}");
            }
        }
        else
        {
            buffer_write(__buffer, buffer_text, "{");
            var _written = false;
            
            repeat (_count)
            {
                var _name = _names[_i];
                __value = variable_struct_get(argument0, _name);
                
                if (!is_method(__value))
                {
                    if (is_struct(_name) || is_array(_name))
                    {
                        show_error("Key type \"" + typeof(_name) + "\" not supported\n ", false);
                        _name = _string(ptr(_name));
                    }
                    
                    buffer_write(__buffer, buffer_text, "\"");
                    buffer_write(__buffer, buffer_text, _string(_name));
                    buffer_write(__buffer, buffer_text, "\":");
                    __write_value();
                    buffer_write(__buffer, buffer_text, ",");
                    _written = true;
                }
                
                _i++;
            }
            
            if (_written)
                buffer_seek(__buffer, buffer_seek_relative, -1);
            
            buffer_write(__buffer, buffer_text, "}");
        }
    };
    
    static __parse_array = function(argument0)
    {
        var _count = array_length(argument0);
        var _i = 0;
        
        if (__pretty)
        {
            if (_count > 0)
            {
                buffer_write(__buffer, buffer_text, "[\n");
                __indent += "    ";
                
                repeat (_count)
                {
                    __value = argument0[_i];
                    buffer_write(__buffer, buffer_text, __indent);
                    __write_value();
                    buffer_write(__buffer, buffer_text, ",\n");
                    _i++;
                }
                
                __indent = string_copy(__indent, 1, string_length(__indent) - 4);
                buffer_seek(__buffer, buffer_seek_relative, -2);
                buffer_write(__buffer, buffer_text, "\n" + __indent + "]");
            }
            else
            {
                buffer_write(__buffer, buffer_text, "[]");
            }
        }
        else
        {
            buffer_write(__buffer, buffer_text, "[");
            
            repeat (_count)
            {
                __value = argument0[_i];
                __write_value();
                buffer_write(__buffer, buffer_text, ",");
                _i++;
            }
            
            if (_count > 0)
                buffer_seek(__buffer, buffer_seek_relative, -1);
            
            buffer_write(__buffer, buffer_text, "]");
        }
    };
    
    static __write_value = function()
    {
        if (is_struct(__value))
        {
            __parse_struct(__value);
        }
        else if (is_array(__value))
        {
            __parse_array(__value);
        }
        else if (is_string(__value))
        {
            __value = string_replace_all(__value, "\\", "\\\\");
            __value = string_replace_all(__value, "\n", "\\n");
            __value = string_replace_all(__value, "\r", "\\r");
            __value = string_replace_all(__value, "\t", "\\t");
            __value = string_replace_all(__value, "\"", "\\\"");
            buffer_write(__buffer, buffer_text, "\"");
            buffer_write(__buffer, buffer_text, __value);
            buffer_write(__buffer, buffer_text, "\"");
        }
        else if (is_undefined(__value))
        {
            buffer_write(__buffer, buffer_text, "null");
        }
        else if (is_bool(__value))
        {
            buffer_write(__buffer, buffer_text, __value ? "true" : "false");
        }
        else if (is_real(__value))
        {
            __value = string_format(__value, 0, 10);
            var _length = string_length(__value);
            var _i = _length;
            
            repeat (_length)
            {
                if (string_char_at(__value, _i) != "0")
                    break;
                
                _i--;
            }
            
            if (string_char_at(__value, _i) == ".")
                _i--;
            
            __value = string_delete(__value, _i + 1, _length - _i);
            buffer_write(__buffer, buffer_text, __value);
        }
        else if (is_method(__value))
        {
            buffer_write(__buffer, buffer_text, "null");
        }
        else
        {
            buffer_write(__buffer, buffer_text, _string(__value));
        }
    };
    
    __root = argument0;
    __pretty = argument1;
    __alphabetise = argument2;
    __result = "";
    __buffer = buffer_create(1024, buffer_grow, 1);
    __indent = "";
    
    if (is_struct(__root))
        __parse_struct(__root);
    else if (is_array(__root))
        __parse_array(__root);
    else
        show_error("__value not struct or array. Returning empty _string\n ", false);
    
    buffer_seek(__buffer, buffer_seek_start, 0);
    __result = buffer_read(__buffer, buffer_string);
    buffer_delete(__buffer);
}
