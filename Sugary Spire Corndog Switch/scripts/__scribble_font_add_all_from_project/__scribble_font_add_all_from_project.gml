function __scribble_font_add_all_from_project()
{
    var _i = 0;
    
    repeat (1000)
    {
        if (!font_exists(_i))
            break;
        
        var _skip = false;
        var _tags = asset_get_tags(_i, 7);
        var _j = 0;
        
        repeat (array_length(_tags))
        {
            if (string_lower(_tags[_j]) == "scribble skip")
            {
                _skip = true;
                break;
            }
            
            _j++;
        }
        
        var _name = font_get_name(_i);
        
        if (string_copy(_name, 1, 9) == "__newfont")
            _skip = true;
        
        if (!_skip)
            __scribble_font_add_from_project(_i);
        
        _i++;
    }
    
    var _assets = [];
    var _array = tag_get_assets("Scribble MSDF");
    array_copy(_assets, array_length(_assets), _array, 0, array_length(_array));
    _array = tag_get_assets("scribble MSDF");
    array_copy(_assets, array_length(_assets), _array, 0, array_length(_array));
    _array = tag_get_assets("Scribble msdf");
    array_copy(_assets, array_length(_assets), _array, 0, array_length(_array));
    _array = tag_get_assets("scribble msdf");
    array_copy(_assets, array_length(_assets), _array, 0, array_length(_array));
    _array = tag_get_assets("scribblemsdf");
    array_copy(_assets, array_length(_assets), _array, 0, array_length(_array));
    _i = 0;
    
    repeat (array_length(_assets))
    {
        var _asset = _assets[_i];
        
        if (asset_get_type(_asset) != 1)
            __scribble_error("\"scribble msdf\" tag should only be applied to sprite assets (\"", _asset, "\" had the tag)");
        else
            __scribble_font_add_msdf_from_project(asset_get_index(_asset));
        
        _i++;
    }
}
