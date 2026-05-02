for (var i = 0; i < array_length(layerArray); i++)
{
	if (layerArray[i] != undefined)
	{
		with (layerArray[i])
		{
			x = xstart;
			y = ystart;
            
			var entry = ds_map_find_value(global.ParallaxMap, id);
			if (is_undefined(entry))
				entry = ds_map_find_value(global.ParallaxMap, layerName);
            
			if (!is_undefined(entry))
				script_execute_ext(entry.func, entry.args);

			if (isBackground && (hspeed != 0 || vspeed != 0))
			{
				xScroll += hspeed;
				yScroll += vspeed;
				x += xScroll;
				y += yScroll;
			}
            
			layer_x(id, x);
			layer_y(id, y);
		}
	}
}