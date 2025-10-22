function _mbuff_read_obj_face(arg0, arg1)
{
    var faceList = arg0;
    var str = arg1;
    str = string_delete(str, 1, string_pos(" ", str));
    
    if (string_char_at(str, string_length(str)) == " ")
        str = string_copy(str, 0, string_length(str) - 1);
    
    var triNum = string_count(" ", str);
    var vertString = array_create(triNum + 1);
    var i;
    
    for (i = 0; i < triNum; i++)
    {
        vertString[i] = string_copy(str, 1, string_pos(" ", str));
        str = string_delete(str, 1, string_pos(" ", str));
    }
    
    vertString[i--] = str;
    
    while (i--)
    {
        for (var j = 2; j >= 0; j--)
        {
            str = vertString[(i + j) * (j > 0)];
            var v = 1;
            var n = 1;
            var t = 1;
            
            if (string_count("/", str) == 2 && string_count("//", str) == 0)
            {
                v = real(string_copy(str, 1, string_pos("/", str) - 1));
                str = string_delete(str, 1, string_pos("/", str));
                t = real(string_copy(str, 1, string_pos("/", str) - 1));
                n = real(string_delete(str, 1, string_pos("/", str)));
            }
            else if (string_count("/", str) == 1)
            {
                v = real(string_copy(str, 1, string_pos("/", str) - 1));
                t = real(string_delete(str, 1, string_pos("/", str)));
            }
            else if (string_count("/", str) == 0)
            {
                v = real(str);
            }
            else if (string_count("//", str) == 1)
            {
                str = string_replace(str, "//", "/");
                v = real(string_copy(str, 1, string_pos("/", str) - 1));
                n = real(string_delete(str, 1, string_pos("/", str)));
            }
            
            if (v < 0)
                v = -v;
            
            if (n < 0)
                n = -n;
            
            if (t < 0)
                t = -t;
            
            ds_list_add(faceList, [v - 1, n - 1, t - 1]);
        }
    }
}
