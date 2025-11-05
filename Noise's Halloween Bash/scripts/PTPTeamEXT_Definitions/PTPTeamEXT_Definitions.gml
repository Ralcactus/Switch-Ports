function window_is_rounded()
{
    var _result = _window_get_rounded(window_handle());
    trace("window_is_rounded: ", _result, ", ", _result != -1 && _result != 1);
    return _result != -1 && _result != 1;
}
