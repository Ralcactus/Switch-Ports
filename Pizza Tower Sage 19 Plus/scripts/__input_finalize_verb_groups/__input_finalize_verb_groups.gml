function __input_finalize_verb_groups()
{
    static _global = __input_global();
    
    _global.__group_to_verbs_dict = __input_config_verb_groups();
    
    if (!is_struct(_global.__group_to_verbs_dict))
        __input_error("__input_config_verb_groups() must contain a struct (was ", typeof(_global.__group_to_verbs_dict), ")\nDocumentation on __input_config_verb_groups() can be found offline in __input_config_verbs()\nOnline documentation can be found at https://jujuadams.github.io/Input");
    
    _global.__verb_group_array = variable_struct_get_names(_global.__group_to_verbs_dict);
    var _i = 0;
    
    repeat (array_length(_global.__verb_group_array))
    {
        var _group_name = _global.__verb_group_array[_i];
        var _group_array = variable_struct_get(_global.__group_to_verbs_dict, _group_name);
        _global.__default_player.__verb_group_ensure(_group_name);
        var _p = 0;
        
        repeat (1)
        {
            _global.__players[_p].__verb_group_ensure(_group_name);
            _p++;
        }
        
        var _j = 0;
        
        repeat (array_length(_group_array))
        {
            var _verb = _group_array[_j];
            
            if (!variable_struct_exists(_global.__basic_verb_dict, _verb))
                __input_error("Verb \"", _verb, "\" doesn't exist\nPlease check __input_config_verb_groups() matches __input_config_verbs()");
            
            if (variable_struct_exists(_global.__verb_to_group_dict, _verb))
                __input_error("Verb \"", _verb, "\" already has a group (", _group_name, ")");
            
            variable_struct_set(_global.__verb_to_group_dict, _verb, _group_name);
            _j++;
        }
        
        _i++;
    }
}
