function _array_get_array_index(arg0, arg1)
{
    var source = arg0;
    var subarray = arg1;
    var i = array_length(source) - 1;
    
    while (i >= 0)
    {
        if (array_equals(subarray, source[i]))
            return i;
        
        i--;
    }
    
    return -1;
}
