function scrArrayContains(arg0, arg1)
{
    var array = arg0;
    var check = arg1;
    var i = 0;
    var j = array_length(array);
    
    while (i < j)
    {
        if (array[i] == check)
            return true;
        
        i++;
    }
}

function StringContains(arg0, arg1)
{
    if (arg0 != "")
    {
        var i1 = 0;
        var make = "";
        var makeAT = 1;
        
        while (string_length(arg0) != i1)
        {
            i1 += 1;
            
            if (make != arg1)
            {
                if (string_char_at(arg0, i1) == string_char_at(arg1, makeAT))
                {
                    make += string_char_at(arg0, i1);
                    makeAT += 1;
                }
                else
                {
                    makeAT = 1;
                    make = "";
                }
            }
        }
        
        if (make == arg1)
            return true;
    }
    else
    {
        return false;
    }
}
