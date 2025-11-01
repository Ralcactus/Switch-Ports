show_message(room_get_name(room));
var _array = [];
var _ID = 0;
var _array_instances = [];

with (par_microgame)
{
    var _name = object_get_name(object_index);
    var _layername = layer_get_name(layer_start);
    var _struct = 
    {
        x: xstart,
        y: ystart,
        col: image_blend_start,
        angle: image_angle_start,
        alpha: image_alpha_start,
        ID: _ID,
        ind: image_index_start,
        layer: _layername,
        type: 0,
        asset: _name,
        xscale: image_xscale_start,
        yscale: image_yscale_start
    };
    _ID++;
    array_push(_array_instances, _struct);
}

var _array_sprites = [];
var _layers = ["_Over1", "_Over", "_Middle", "_Behind", "_Behind1"];

for (var i = 0; i < array_length(_layers); i++)
{
    var layer_id = layer_get_id(_layers[i]);
    var _elements = layer_get_all_elements(layer_id);
    var _layername = layer_get_name(layer_id);
    _layername = string_delete(_layername, 0, 1);
    
    for (var ii = 0; ii < array_length(_elements); ii++)
    {
        var _elem = _elements[ii];
        
        if (layer_get_element_type(_elem) == 4)
        {
            var _struct = 
            {
                x: layer_sprite_get_x(_elem),
                y: layer_sprite_get_y(_elem),
                col: layer_sprite_get_blend(_elem),
                angle: layer_sprite_get_angle(_elem),
                alpha: layer_sprite_get_alpha(_elem),
                ID: _ID,
                ind: layer_sprite_get_index(_elem),
                layer: _layername,
                type: 1,
                asset: sprite_get_name(layer_sprite_get_sprite(_elem)),
                xscale: layer_sprite_get_xscale(_elem),
                yscale: layer_sprite_get_yscale(_elem)
            };
            array_push(_array_sprites, _struct);
            _ID++;
        }
    }
}

_array = array_concat(_array_instances, _array_sprites);
var _map = 
{
    scale_res: global.scale_res,
    game_width: global.game_width,
    game_height: global.game_height,
    splash_text: global.splash_text,
    texture_group: global.texture_group,
    instances: _array,
    ID_TOTAL: _ID
};
var _str = json_stringify(_map);
clipboard_set_text(_str);
var _file = get_save_filename("|*.json", ".json");

if (_file != "")
{
    var _open = file_text_open_write(_file);
    file_text_write_string(_open, _str);
    file_text_close(_open);
    show_message("File Saved!");
}

game_end();
