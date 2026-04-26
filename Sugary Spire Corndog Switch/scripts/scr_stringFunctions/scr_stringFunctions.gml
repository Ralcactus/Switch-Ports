function string_contains(arg0, arg1)
{
    return (string_length(arg1) > string_length(arg0)) ? false : (string_pos(arg1, arg0) != 0);
}
