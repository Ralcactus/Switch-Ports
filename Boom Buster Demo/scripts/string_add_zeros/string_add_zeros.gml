function string_add_zeros(arg0, arg1, arg2 = 0)
{
    return string_replace_all(string_format(arg0, arg1, arg2), " ", "0");
}
