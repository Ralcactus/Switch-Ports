for (var i = 0; i < ds_list_size(global.afterimage_list); i++)
{
    var b = ds_list_find_value(global.afterimage_list, i);
    
    with (b)
    {
        if (visible)
        {
            var override = false;
            
            if (color_choose != UnknownEnum.Value_0)
            {
                shader_set(shd_afterimage);
                var color_blend_1 = shader_get_uniform(shd_afterimage, "blendcolor1");
                var color_blend_2 = shader_get_uniform(shd_afterimage, "blendcolor2");
                shader_set_uniform_f(color_blend_1, color_get_red(obj_afterimagecontroller.color_arr[color_choose].light) / 255, color_get_green(obj_afterimagecontroller.color_arr[color_choose].light) / 255, color_get_blue(obj_afterimagecontroller.color_arr[color_choose].light) / 255);
                shader_set_uniform_f(color_blend_2, color_get_red(obj_afterimagecontroller.color_arr[color_choose].dark) / 255, color_get_green(obj_afterimagecontroller.color_arr[color_choose].dark) / 255, color_get_blue(obj_afterimagecontroller.color_arr[color_choose].dark) / 255);
            }
            else if (instance_exists(identity) && object_is_ancestor(identity.object_index, obj_parent_player))
            {
                draw_player_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, image_angle, 16777215, gonealpha * image_alpha);
                override = true;
            }
            else if (paletteSprite != -4 && paletteSelect != -4)
            {
                pal_swap_set(paletteSprite, paletteSelect, false);
            }
            
            if (!override)
                draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, image_angle, c_white, gonealpha * image_alpha);
            
            pal_swap_reset();
            shader_reset();
        }
    }
}
