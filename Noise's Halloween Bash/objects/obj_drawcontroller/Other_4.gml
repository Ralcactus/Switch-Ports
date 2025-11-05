var _layers = layer_get_all();
tileLayers = [];
assetLayers = [];

for (var i = 0; i < array_length(_layers); i++)
{
    var _layer = _layers[i];
    
    if (!layer_get_visible(_layer))
        continue;
    
    var _name = layer_get_name(_layer);
    
    if (string_starts_with(_name, "Assets"))
    {
        var _elements = layer_get_all_elements(_layer);
        var _elementarr = [];
        
        for (var b = 0; b < array_length(_elements); b++)
        {
            if (layer_get_element_type(_elements[b]) == 4)
            {
                var _colour = layer_sprite_get_blend(_elements[b]);
                array_push(_elementarr, 
                {
                    element: _elements[b],
                    sprite: layer_sprite_get_sprite(_elements[b]),
                    image: layer_sprite_get_index(_elements[b]),
                    x: layer_sprite_get_x(_elements[b]),
                    y: layer_sprite_get_y(_elements[b]),
                    xscale: layer_sprite_get_xscale(_elements[b]),
                    yscale: layer_sprite_get_yscale(_elements[b]),
                    angle: layer_sprite_get_angle(_elements[b]),
                    colour: [colour_get_red(_colour), colour_get_blue(_colour), colour_get_green(_colour)],
                    alpha: layer_sprite_get_alpha(_elements[b])
                });
            }
        }
        
        array_push(assetLayers, 
        {
            id: _layer,
            depth: layer_get_depth(_layer),
            elements: _elementarr
        });
    }
    else
    {
        var _map = layer_tilemap_get_id(_layer);
        
        if (!layer_tilemap_exists(_layer, _map))
            continue;
    }
    
    layer_set_visible(_layer, false);
}

tileLayers = array_reverse(tileLayers);
assetLayers = array_reverse(assetLayers);
update_cam();
