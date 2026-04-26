var _unicode_source_array = ["‘", "’", "“", "”", "(", ")", "{", "}", "=", "।", "?", "-", "µ", "॰", ",", ".", "०", "१", "२", "३", "४", "५", "६", "७", "८", "९", "x", "फ़्", "क़", "ख़", "ग़", "ज़्", "ज़", "ड़", "ढ़", "फ़", "य़", "ऱ", "ऩ", "त्त्", "त्त", "क्त", "दृ", "कृ", "ह्न", "ह्य", "हृ", "ह्म", "ह्र", "ह्", "द्द", "क्ष्", "क्ष", "त्र्", "त्र", "ज्ञ", "छ्य", "ट्य", "ठ्य", "ड्य", "ढ्य", "द्य", "द्व", "श्र", "ट्र", "ड्र", "ढ्र", "छ्र", "क्र", "फ्र", "द्र", "प्र", "ग्र", "रु", "रू", "्र", "ओ", "औ", "आ", "अ", "ई", "इ", "उ", "ऊ", "ऐ", "ए", "ऋ", "क्", "क", "क्क", "ख्", "ख", "ग्", "ग", "घ्", "घ", "ङ", "चै", "च्", "च", "छ", "ज्", "ज", "झ्", "झ", "ञ", "ट्ट", "ट्ठ", "ट", "ठ", "ड्ड", "ड्ढ", "ड", "ढ", "ण्", "ण", "त्", "त", "थ्", "थ", "द्ध", "द", "ध्", "ध", "न्", "न", "प्", "प", "फ्", "फ", "ब्", "ब", "भ्", "भ", "म्", "म", "य्", "य", "र", "ल्", "ल", "ळ", "व्", "व", "श्", "श", "ष्", "ष", "स्", "स", "ह", "ऑ", "ॉ", "ो", "ौ", "ा", "ी", "ु", "ू", "ृ", "े", "ै", "ं", "ँ", "ः", "ॅ", "ऽ", "्"];
var _krutidev_source_array = ["^", "*", "Þ", "ß", "¼", "½", "¿", "À", "¾", "A", "\\", "&", "&", "Œ", "]", "-", "å", "ƒ", "„", "…", "†", "‡", "ˆ", "‰", "Š", "‹", "Û", "¶", "d", "[k", "x", "T", "t", "M+", "<+", "Q", ";", "j", "u", "Ù", "Ùk", "Dr", "–", "—", "à", "á", "â", "ã", "ºz", "º", "í", "{", "{k", "«", "=", "K", "Nî", "Vî", "Bî", "Mî", "<î", "|", "}", "J", "Vª", "Mª", "<ªª", "Nª", "Ø", "Ý", "æ", "ç", "xz", "#", ":", "z", "vks", "vkS", "vk", "v", "bZ", "b", "m", "Å", ",s", ",", "_", "D", "d", "ô", "[", "[k", "X", "x", "?", "?k", "³", "pkS", "P", "p", "N", "T", "t", "÷", ">", "¥", "ê", "ë", "V", "B", "ì", "ï", "M", "<", ".", ".k", "R", "r", "F", "Fk", ")", "n", "/", "/k", "U", "u", "I", "i", "¶", "Q", "C", "c", "H", "Hk", "E", "e", "¸", ";", "j", "Y", "y", "G", "O", "o", "'", "'k", "\"", "\"k", "L", "l", "g", "v‚", "‚", "ks", "kS", "k", "h", "q", "w", "`", "s", "S", "a", "¡", "%", "W", "·", "~"];
global.__scribble_krutidev_lookup_map = ds_map_create();
var _i = 0;

repeat (array_length(_unicode_source_array))
{
    var _string = _unicode_source_array[_i];
    var _searchInteger = 0;
    var _j = string_length(_string);
    
    repeat (_j)
    {
        _searchInteger = (_searchInteger << 16) | ord(string_char_at(_string, _j));
        _j--;
    }
    
    _string = _krutidev_source_array[_i];
    var _writeArray = [];
    _j = 1;
    
    repeat (string_length(_string))
    {
        array_push(_writeArray, ord(string_char_at(_string, _j)));
        _j++;
    }
    
    ds_map_set(global.__scribble_krutidev_lookup_map, _searchInteger, _writeArray);
    _i++;
}

global.__scribble_krutidev_matra_lookup_map = ds_map_create();
ds_map_set(global.__scribble_krutidev_matra_lookup_map, 58, true);
ds_map_set(global.__scribble_krutidev_matra_lookup_map, 2305, true);
ds_map_set(global.__scribble_krutidev_matra_lookup_map, 2306, true);
ds_map_set(global.__scribble_krutidev_matra_lookup_map, 2366, true);
ds_map_set(global.__scribble_krutidev_matra_lookup_map, 2367, true);
ds_map_set(global.__scribble_krutidev_matra_lookup_map, 2368, true);
ds_map_set(global.__scribble_krutidev_matra_lookup_map, 2369, true);
ds_map_set(global.__scribble_krutidev_matra_lookup_map, 2370, true);
ds_map_set(global.__scribble_krutidev_matra_lookup_map, 2371, true);
ds_map_set(global.__scribble_krutidev_matra_lookup_map, 2373, true);
ds_map_set(global.__scribble_krutidev_matra_lookup_map, 2375, true);
ds_map_set(global.__scribble_krutidev_matra_lookup_map, 2376, true);
ds_map_set(global.__scribble_krutidev_matra_lookup_map, 2379, true);
ds_map_set(global.__scribble_krutidev_matra_lookup_map, 2380, true);

function __scribble_gen_3_devanagari()
{
    if (!__has_devanagari)
        exit;
    
    var _glyph_grid = global.__scribble_glyph_grid;
    var _control_grid = global.__scribble_control_grid;
    var _temp_grid = global.__scribble_temp2_grid;
    var _glyph_count = global.__scribble_generator_state.__glyph_count;
    _glyph_count--;
    ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_0, 65535);
    ds_grid_set(_glyph_grid, _glyph_count + 1, UnknownEnum.Value_0, 65535);
    ds_grid_set(_glyph_grid, _glyph_count + 2, UnknownEnum.Value_0, 65535);
    ds_grid_set(_glyph_grid, _glyph_count + 3, UnknownEnum.Value_0, 65535);
    var _in_single_quote = false;
    var _in_double_quote = false;
    var _i = 0;
    
    repeat (_glyph_count)
    {
        switch (ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_0))
        {
            case 39:
                _in_single_quote = !_in_single_quote;
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_0, 65535 + (_in_single_quote ? 94 : 42));
                break;
            
            case 34:
                _in_double_quote = !_in_double_quote;
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_0, 65535 + (_in_double_quote ? 223 : 222));
                break;
            
            case 2345:
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_0, 2344);
                ds_grid_set_grid_region(_temp_grid, _glyph_grid, _i + 1, 0, _glyph_count + 3, UnknownEnum.Value_22, 0, 0);
                ds_grid_set_grid_region(_glyph_grid, _temp_grid, 0, 0, (_glyph_count + 3) - _i, UnknownEnum.Value_22, _i + 2, 0);
                _i++;
                _glyph_count++;
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_0, 2364);
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_17, ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_17));
                break;
            
            case 2353:
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_0, 2352);
                ds_grid_set_grid_region(_temp_grid, _glyph_grid, _i + 1, 0, _glyph_count + 3, UnknownEnum.Value_22, 0, 0);
                ds_grid_set_grid_region(_glyph_grid, _temp_grid, 0, 0, (_glyph_count + 3) - _i, UnknownEnum.Value_22, _i + 2, 0);
                _i++;
                _glyph_count++;
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_0, 2364);
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_17, ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_17));
                break;
            
            case 2392:
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_0, 2325);
                ds_grid_set_grid_region(_temp_grid, _glyph_grid, _i + 1, 0, _glyph_count + 3, UnknownEnum.Value_22, 0, 0);
                ds_grid_set_grid_region(_glyph_grid, _temp_grid, 0, 0, (_glyph_count + 3) - _i, UnknownEnum.Value_22, _i + 2, 0);
                _i++;
                _glyph_count++;
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_0, 2364);
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_17, ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_17));
                break;
            
            case 2393:
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_0, 2326);
                ds_grid_set_grid_region(_temp_grid, _glyph_grid, _i + 1, 0, _glyph_count + 3, UnknownEnum.Value_22, 0, 0);
                ds_grid_set_grid_region(_glyph_grid, _temp_grid, 0, 0, (_glyph_count + 3) - _i, UnknownEnum.Value_22, _i + 2, 0);
                _i++;
                _glyph_count++;
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_0, 2364);
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_17, ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_17));
                break;
            
            case 2394:
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_0, 2327);
                ds_grid_set_grid_region(_temp_grid, _glyph_grid, _i + 1, 0, _glyph_count + 3, UnknownEnum.Value_22, 0, 0);
                ds_grid_set_grid_region(_glyph_grid, _temp_grid, 0, 0, (_glyph_count + 3) - _i, UnknownEnum.Value_22, _i + 2, 0);
                _i++;
                _glyph_count++;
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_0, 2364);
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_17, ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_17));
                break;
            
            case 2395:
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_0, 2332);
                ds_grid_set_grid_region(_temp_grid, _glyph_grid, _i + 1, 0, _glyph_count + 3, UnknownEnum.Value_22, 0, 0);
                ds_grid_set_grid_region(_glyph_grid, _temp_grid, 0, 0, (_glyph_count + 3) - _i, UnknownEnum.Value_22, _i + 2, 0);
                _i++;
                _glyph_count++;
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_0, 2364);
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_17, ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_17));
                break;
            
            case 2396:
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_0, 2337);
                ds_grid_set_grid_region(_temp_grid, _glyph_grid, _i + 1, 0, _glyph_count + 3, UnknownEnum.Value_22, 0, 0);
                ds_grid_set_grid_region(_glyph_grid, _temp_grid, 0, 0, (_glyph_count + 3) - _i, UnknownEnum.Value_22, _i + 2, 0);
                _i++;
                _glyph_count++;
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_0, 2364);
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_17, ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_17));
                break;
            
            case 2397:
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_0, 2338);
                ds_grid_set_grid_region(_temp_grid, _glyph_grid, _i + 1, 0, _glyph_count + 3, UnknownEnum.Value_22, 0, 0);
                ds_grid_set_grid_region(_glyph_grid, _temp_grid, 0, 0, (_glyph_count + 3) - _i, UnknownEnum.Value_22, _i + 2, 0);
                _i++;
                _glyph_count++;
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_0, 2364);
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_17, ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_17));
                break;
            
            case 2398:
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_0, 2347);
                ds_grid_set_grid_region(_temp_grid, _glyph_grid, _i + 1, 0, _glyph_count + 3, UnknownEnum.Value_22, 0, 0);
                ds_grid_set_grid_region(_glyph_grid, _temp_grid, 0, 0, (_glyph_count + 3) - _i, UnknownEnum.Value_22, _i + 2, 0);
                _i++;
                _glyph_count++;
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_0, 2364);
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_17, ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_17));
                break;
            
            case 2399:
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_0, 2351);
                ds_grid_set_grid_region(_temp_grid, _glyph_grid, _i + 1, 0, _glyph_count + 3, UnknownEnum.Value_22, 0, 0);
                ds_grid_set_grid_region(_glyph_grid, _temp_grid, 0, 0, (_glyph_count + 3) - _i, UnknownEnum.Value_22, _i + 2, 0);
                _i++;
                _glyph_count++;
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_0, 2364);
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_17, ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_17));
                break;
        }
        
        _i++;
    }
    
    _i = 1;
    
    repeat (_glyph_count - 1)
    {
        var _char = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_0);
        
        if (_char == 2367)
        {
            var _j = _i - 1;
            
            while (_j >= 0 && ds_grid_get(_glyph_grid, _j, UnknownEnum.Value_0) == 2381)
                _j -= 2;
            
            ds_grid_set_grid_region(_temp_grid, _glyph_grid, _j, 0, _i - 1, UnknownEnum.Value_22, 0, 0);
            ds_grid_set_grid_region(_glyph_grid, _temp_grid, 0, 0, _i - 1 - _j, UnknownEnum.Value_22, _j + 1, 0);
            ds_grid_set(_glyph_grid, _j, UnknownEnum.Value_0, 65637);
            ds_grid_set(_glyph_grid, _j, UnknownEnum.Value_17, ds_grid_get(_glyph_grid, _j + 1, UnknownEnum.Value_17));
        }
        
        _i++;
    }
    
    var _matraLookupMap = global.__scribble_krutidev_matra_lookup_map;
    
    for (_i = 0; _i < _glyph_count; _i++)
    {
        if (ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_0) == 2352 && ds_grid_get(_glyph_grid, _i + 1, UnknownEnum.Value_0) == 2381)
        {
            var _newPosition = _i + 2;
            var _charRight = ds_grid_get(_glyph_grid, _newPosition + 1, UnknownEnum.Value_0);
            
            while (ds_map_exists(_matraLookupMap, _charRight))
            {
                _newPosition++;
                _charRight = ds_grid_get(_glyph_grid, _newPosition + 1, UnknownEnum.Value_0);
            }
            
            var _copyCount = (1 + _newPosition) - (_i + 2);
            ds_grid_set_grid_region(_temp_grid, _glyph_grid, _i + 2, 0, (_glyph_count - 1) + 4, UnknownEnum.Value_22, _i + 2, 0);
            ds_grid_set_grid_region(_glyph_grid, _temp_grid, _i + 2, 0, _newPosition, UnknownEnum.Value_22, _i, 0);
            ds_grid_set(_glyph_grid, _i + _copyCount, UnknownEnum.Value_0, 65625);
            ds_grid_set(_glyph_grid, _i + _copyCount, UnknownEnum.Value_17, ds_grid_get(_glyph_grid, _copyCount - 1, UnknownEnum.Value_17));
            ds_grid_set_grid_region(_glyph_grid, _temp_grid, _newPosition + 1, 0, _glyph_count + 3, UnknownEnum.Value_22, _i + _copyCount + 1, 0);
            _glyph_count--;
        }
    }
    
    var _lookupMap = global.__scribble_krutidev_lookup_map;
    var _oneChar = 0;
    var _twoChar = (ds_grid_get(_glyph_grid, 0, UnknownEnum.Value_0) & 65535) << 16;
    var _threeChar = _twoChar | ((ds_grid_get(_glyph_grid, 1, UnknownEnum.Value_0) & 65535) << 32);
    var _fourChar = _threeChar | ((ds_grid_get(_glyph_grid, 2, UnknownEnum.Value_0) & 65535) << 48);
    
    for (_i = 0; _i < _glyph_count; _i++)
    {
        _oneChar = _twoChar >> 16;
        _twoChar = _threeChar >> 16;
        _threeChar = (_fourChar & 9223372036854775807) >> 16;
        _fourChar = _threeChar | ((ds_grid_get(_glyph_grid, _i + 3, UnknownEnum.Value_0) & 65535) << 48);
        var _foundLength = 4;
        var _replacementArray = ds_map_find_value(_lookupMap, _fourChar);
        
        if (_replacementArray == undefined)
        {
            _foundLength = 3;
            _replacementArray = ds_map_find_value(_lookupMap, _threeChar);
            
            if (_replacementArray == undefined)
            {
                _foundLength = 2;
                _replacementArray = ds_map_find_value(_lookupMap, _twoChar);
                
                if (_replacementArray == undefined)
                {
                    _foundLength = 1;
                    _replacementArray = ds_map_find_value(_lookupMap, _oneChar);
                }
            }
        }
        
        if (_replacementArray != undefined)
        {
            var _replacementLength = array_length(_replacementArray);
            
            if (_foundLength == 1 && _replacementLength == 1)
            {
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_0, 65535 + _replacementArray[0]);
            }
            else
            {
                var _copyCount = min(_foundLength, _replacementLength);
                var _j = 0;
                
                repeat (_copyCount)
                {
                    ds_grid_set(_glyph_grid, _i + _j, UnknownEnum.Value_0, 65535 + _replacementArray[_j]);
                    _j++;
                }
                
                if (_foundLength > _replacementLength)
                {
                    var _copyStart = (_i + _copyCount + _foundLength) - _replacementLength;
                    var _copyLength = _glyph_count - _copyStart;
                    ds_grid_set_grid_region(_temp_grid, _glyph_grid, _copyStart, 0, _glyph_count, UnknownEnum.Value_22, 0, 0);
                    ds_grid_set_grid_region(_glyph_grid, _temp_grid, 0, 0, _copyLength, UnknownEnum.Value_22, _i + _copyCount, 0);
                }
                else if (_foundLength < _replacementLength)
                {
                    var _insertPos = _i + _copyCount;
                    ds_grid_set_grid_region(_temp_grid, _glyph_grid, _insertPos, 0, _glyph_count, UnknownEnum.Value_22, 0, 0);
                    ds_grid_set_grid_region(_glyph_grid, _temp_grid, 0, 0, _glyph_count - _insertPos, UnknownEnum.Value_22, _insertPos + 1, 0);
                    
                    if ((_replacementLength - _foundLength) == 1)
                    {
                        ds_grid_set(_glyph_grid, _insertPos, UnknownEnum.Value_0, 65535 + _replacementArray[_replacementLength - 1]);
                        ds_grid_set(_glyph_grid, _insertPos, UnknownEnum.Value_17, ds_grid_get(_glyph_grid, _insertPos - 1, UnknownEnum.Value_17));
                    }
                    else if ((_replacementLength - _foundLength) == 2)
                    {
                        ds_grid_set(_glyph_grid, _insertPos, UnknownEnum.Value_0, 65535 + _replacementArray[_replacementLength - 2]);
                        ds_grid_set(_glyph_grid, _insertPos, UnknownEnum.Value_17, ds_grid_get(_glyph_grid, _insertPos - 1, UnknownEnum.Value_17));
                        ds_grid_set(_glyph_grid, _insertPos + 1, UnknownEnum.Value_0, 65535 + _replacementArray[_replacementLength - 1]);
                        ds_grid_set(_glyph_grid, _insertPos + 1, UnknownEnum.Value_17, ds_grid_get(_glyph_grid, _insertPos - 1, UnknownEnum.Value_17));
                    }
                    else
                    {
                        __scribble_error("Devanagari substring insertion length > 2. Please report this error");
                    }
                }
                
                _i += (_replacementLength - 1);
                _glyph_count += (_replacementLength - _foundLength);
                _twoChar = (ds_grid_get(_glyph_grid, _i + 1, UnknownEnum.Value_0) & 65535) << 16;
                _threeChar = _twoChar | ((ds_grid_get(_glyph_grid, _i + 2, UnknownEnum.Value_0) & 65535) << 32);
                _fourChar = _threeChar | ((ds_grid_get(_glyph_grid, _i + 3, UnknownEnum.Value_0) & 65535) << 48);
            }
        }
    }
    
    var _control_index = 0;
    var _font_name = undefined;
    var _font_glyphs_map = undefined;
    var _font_glyph_data_grid = undefined;
    _i = 0;
    
    repeat (_glyph_count)
    {
        var _control_delta = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_17) - _control_index;
        
        repeat (_control_delta)
        {
            if (ds_grid_get(_control_grid, _control_index, UnknownEnum.Value_0) == UnknownEnum.Value_6)
            {
                _font_name = ds_grid_get(_control_grid, _control_index, UnknownEnum.Value_1);
                var _font_data = __scribble_get_font_data(_font_name);
                _font_glyph_data_grid = _font_data.__glyph_data_grid;
                _font_glyphs_map = _font_data.__glyphs_map;
            }
            
            _control_index++;
        }
        
        var _found_glyph = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_0);
        
        if (_found_glyph > 0)
        {
            var _glyph_write = _found_glyph;
            var _data_index = ds_map_find_value(_font_glyphs_map, _glyph_write);
            
            if (_data_index == undefined)
            {
                __scribble_trace("Couldn't find glyph data for character code " + string(_found_glyph) + " (" + chr(_found_glyph) + ") in font \"" + string(_font_name) + "\"");
                _glyph_write = 63;
                _data_index = ds_map_find_value(_font_glyphs_map, _glyph_write);
            }
            
            if (_data_index == undefined)
                __scribble_trace("Couldn't find glyph data for character code " + string(_glyph_write) + " (" + chr(_glyph_write) + ") in font \"" + string(_font_name) + "\"");
            else
                ds_grid_set_grid_region(_glyph_grid, _font_glyph_data_grid, _data_index, UnknownEnum.Value_1, _data_index, UnknownEnum.Value_17, _i, UnknownEnum.Value_0);
        }
        
        _i++;
    }
    
    ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_0, 0);
    ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_1, UnknownEnum.Value_2);
    ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_2, 0);
    ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_3, 0);
    ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_4, 0);
    ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_5, 0);
    ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_6, 0);
    ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_7, 0);
    ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_17, ds_grid_get(_glyph_grid, _glyph_count - 1, UnknownEnum.Value_17));
    global.__scribble_generator_state.__glyph_count = _glyph_count + 1;
}
