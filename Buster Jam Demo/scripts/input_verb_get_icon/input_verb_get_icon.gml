function input_verb_get_icon(arg0, arg1 = 0, arg2 = 0, arg3 = undefined)
{
    return input_binding_get_icon(input_binding_get(arg0, arg1, arg2, arg3), arg1);
}
