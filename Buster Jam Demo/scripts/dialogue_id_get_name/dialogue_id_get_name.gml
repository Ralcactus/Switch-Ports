function dialogue_id_get_name(arg0)
{
    if (name == -4)
        return "";
    
    if (arg0 >= array_length(global.char_data))
        return "undefined";
    
    return global.char_data[arg0].name;
}
