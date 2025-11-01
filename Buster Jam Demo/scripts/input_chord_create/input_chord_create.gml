function input_chord_create(arg0, arg1 = 4)
{
    static _global = __input_global();
    
    __input_ensure_unique_verb_name(arg0);
    var _verb_array = array_create(argument_count - 2);
    var _i = 0;
    
    repeat (array_length(_verb_array))
    {
        _verb_array[_i] = argument[_i + 2];
        _i++;
    }
    
    var _chord_definition = new __input_class_chord_definition(arg0, arg1, _verb_array);
    variable_struct_set(_global.__all_verb_dict, arg0, true);
    array_push(_global.__all_verb_array, arg0);
    variable_struct_set(_global.__chord_verb_dict, arg0, _chord_definition);
    array_push(_global.__chord_verb_array, arg0);
    var _p = 0;
    
    repeat (2)
    {
        with (_global.__players[_p])
        {
            __add_chord_state(arg0, _chord_definition);
            __add_complex_verb(arg0, (1 << 0));
        }
        
        _p++;
    }
}
