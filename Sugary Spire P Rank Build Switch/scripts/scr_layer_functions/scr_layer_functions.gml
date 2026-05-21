/// @description Get Tilemap ID. 
/// @param layer The Layer name string
function layer_tilemap_get_id_fixed(arg0)
{
	if layer_exists(arg0)
	{
		var els = layer_get_all_elements(arg0);
		var n = array_length(els);
		
		for (var i = 0; i < n; i++) 
		{
			var el = els[i];
			
			if (layer_get_element_type(el) == layerelementtype_tilemap)
				return el;
		}
	}
	return -1;
}
/// @description Get Background ID.
/// @param layer The Layer name string
function layer_background_get_id_fixed(arg0)
{
	if layer_exists(arg0)
	{
		var els = layer_get_all_elements(arg0);
		var n = array_length(els);
		
		for (var i = 0; i < n; i++) 
		{
			var el = els[i];
			
			if (layer_get_element_type(el) == layerelementtype_background)
				return el;
		}
		return -1;
	}
	return -1;
}

function layer_asset_get_id_fixed(arg0)
{
	/// @description Get Background ID.
	/// @param layer The Layer name string
	if layer_exists(arg0)
	{
		var els = layer_get_all_elements(arg0);
		var n = array_length(els);
		
		for (var i = 0; i < n; i++) 
		{
			var el = els[i];
			
			if (layer_get_element_type(el) == layerelementtype_sprite)
				return el;
		}
		return -1;
	}
	return -1;
}
/// @description Changes Background sprite based on the original sprite
/// @function layer_change_background
function layer_change_background(original_sprite, new_sprite)
{
	if (original_sprite != new_sprite)
	{
		var a = layer_get_all();
		
		for (var i = 0; i < array_length(a); i++;)
		{
			var back_id = layer_background_get_id_fixed(a[i]);
			
			if (layer_background_get_sprite(back_id) == original_sprite)
				layer_background_sprite(back_id, new_sprite);	
		}
	}
}
/// @description Changes Tileset based on the original Tileset
function layer_change_tileset(original_ts, new_ts)
{
	if (original_ts != new_ts)
	{
		var a = layer_get_all();
		
		for (var i = 0; i < array_length(a); i++;)
		{
			var tile_id = layer_tilemap_get_id_fixed(a[i]);
			
			if (tilemap_get_tileset(tile_id) == original_ts)
				tilemap_tileset(tile_id, new_ts);				
		}
	}
}
function get_all_layer_type(layer_type = layerelementtype_undefined)
{
	/// @description Returns an array of a certain type of layer
	/// @function get_all_layer_type
	var layers, layernum = 0;
	var a = layer_get_all(), i = 0;
	
	for (var i = 0; i < array_length(a); i++) 
	{
		var els = layer_get_all_elements(a[i]);
		
		if (layer_get_element_type(els) == layer_type)
			layers[layernum++] = a[i];
	}
	//If no layers are found get out
	if (!layernum)
	    return noone;
	
	return layers;
}