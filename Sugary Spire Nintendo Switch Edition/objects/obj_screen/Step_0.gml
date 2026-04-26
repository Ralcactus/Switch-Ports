for (var i = 0; i < ds_list_size(bgSpriteOld); i++)
{
	with (ds_list_find_value(bgSpriteOld, i))
	{
		image_alpha = approach(image_alpha, 0, 0.25)
		
		if (image_alpha <= 0)
			ds_list_delete(other.bgSpriteOld, i)
	}
}
