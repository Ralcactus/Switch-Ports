function __input_csv_to_array(argument0)
{
    var _lines = string_split(argument0, "\n", true);
    var _array = [];
    var _i = 0;
    
    repeat (array_length(_lines))
    {
        array_push(_array, string_split(_lines[_i], ",", true));
        _i++;
    }
    
    return _array;
}
