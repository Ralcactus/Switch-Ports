function scrDIA(arg0, arg1)
{
    var array = arg0;
    var check = arg1;
    var i = 0;
    var j = array_length(array);
    
    while (i < j)
    {
        if (array[i] == check)
            return i;
        
        i++;
    }
}
