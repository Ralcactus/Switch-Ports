/// @desc Depecrated. Sets Tile layers for use with obj_secretwall.
/// @param {String,Id.Layer} tile_layer The tile layer to be set as a secret tile layer.
/// @param {String,Id.Layer} ... (Optional) Other tile layers.
function scr_secrettiles_add(tile_layer)
{
	// If the one calling this function is not the secret wall stop.
    if (object_index != obj_secretwall)
        return false;
    
    if (is_undefined(tile_layer))
        return false;
    // Loop Through Given layers and setup array.
    for (var i = 0; i < argument_count; i++)
    {
        var arg = argument[i];
        var layerid = layer_get_id(arg);
        layer_set_visible(layerid, false);
        array_push(layerArray, layerid);
    }
    // Sort Array
    var _f = function(elm1, elm2)
    {
        return -(layer_get_depth(elm1) - layer_get_depth(elm2));
    };
    
    array_sort(layerArray, _f);
    return true;
}

function add_secrettiles(tiles)
{
    for (var i = 0; i < array_length(global.secret_layers); i++)
    {
        var a = global.secret_layers[i];
        surface_free(a.surf);
    }
    global.secret_layers = [];
	
    // Loop Through Given layers and setup array.
    for (var i = 0; i < argument_count; i++)
    {
        var arg = argument[i];
        var layerid = layer_get_id(arg);
        layer_set_visible(layerid, false);
        var name = layer_get_name(layerid);
        array_push(global.secret_layers, 
        {
            nm: name,
            alpha: 1,
            surf: noone
        });
    }
    // Sort Array
    var _f = function(elm1, elm2)
    {
        return -(layer_get_depth(elm1.nm) - layer_get_depth(elm2.nm));
    };
    
    array_sort(global.secret_layers, _f);
    return true;
}
