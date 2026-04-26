for (var i = 0; i < ds_list_size(collectSecretList); i++)
{
	var b = ds_list_find_value(collectSecretList, i)
	b.image_index += b.image_speed
	
	if (b.image_index >= b.image_number)
		b.image_index = frac(b.image_index)
	
	b.platformIndex += 0.35
}

if (global.DebugVisuals)
	show_debug_message(string("Collectible List Size: {0}", ds_list_size(collectSecretList)))
