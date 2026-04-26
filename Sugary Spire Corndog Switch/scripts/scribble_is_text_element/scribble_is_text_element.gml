function scribble_is_text_element(arg0)
{
    return is_struct(arg0) && instanceof(arg0) == "__scribble_class_element";
}
