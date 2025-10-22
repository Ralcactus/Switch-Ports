function _mbuff_read_obj_line(arg0)
{
    var str = string_delete(arg0, 1, string_pos(" ", arg0));
    var retNum = string_count(" ", str) + 1;
    var ret = array_create(retNum);
    
    for (var i = 0; i < retNum; i++)
    {
        var pos = string_pos(" ", str);
        
        if (pos == 0)
        {
            pos = string_length(str);
            ret[i] = real(string_copy(str, 1, pos));
            break;
        }
        
        ret[i] = real(string_copy(str, 1, pos));
        str = string_delete(str, 1, pos);
    }
    
    return ret;
}
