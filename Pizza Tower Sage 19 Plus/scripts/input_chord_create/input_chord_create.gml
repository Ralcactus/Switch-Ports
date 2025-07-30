function input_chord_create(argument0, argument1 = 4)
{
    static _global = __input_global();
    
    __input_ensure_unique_verb_name(argument0);
    var _verb_array = array_create(argument_count - 2);
    var _i = 0;
    
    repeat (array_length(_verb_array))
    {
        _verb_array[_i] = argument[_i + 2];
        _i++;
    }
    
    var _chord_definition = new __input_class_chord_definition(argument0, argument1, _verb_array);
    variable_struct_set(_global.__all_verb_dict, argument0, true);
    array_push(_global.__all_verb_array, argument0);
    variable_struct_set(_global.__chord_verb_dict, argument0, _chord_definition);
    array_push(_global.__chord_verb_array, argument0);
    var _p = 0;
    
    repeat (1)
    {
        with (_global.__players[_p])
        {
            __add_chord_state(argument0, _chord_definition);
            __add_complex_verb(argument0, (1 << 0));
        }
        
        _p++;
    }
}
