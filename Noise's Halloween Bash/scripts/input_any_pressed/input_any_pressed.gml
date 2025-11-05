// Feather disable all
/// @desc    Checks if the any key or button is newly activated this frame.
function input_any_pressed()
{
    __INPUT_GLOBAL_STATIC_LOCAL  //Set static _global
    
    if (_global.__cleared)
        return false;
    
    return input_source_detect_input(-3, false);
}
