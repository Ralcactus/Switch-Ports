function scr_switch_onoff(arg0, arg1)
{
    if (global.onoff != my_onoff)
    {
        if (state == 1)
        {
            scale = 1.2;
            image_alpha = 0.73;
        }
        
        mask_index = spr_nothing;
        image_alpha = lerp(image_alpha, 0.48, 0.3);
        state = 0;
    }
    else
    {
        mask_index = arg0;
        
        if (state == 0)
        {
            scale = 0.8;
            image_alpha = 0.35;
        }
        
        if (arg1 && state == 0 && place_meeting(x, y, par_physics))
        {
            var _list = ds_list_create();
            instance_place_list(x, y, par_physics, _list, true);
            
            for (var i = 0; i < ds_list_size(_list); i++)
            {
                with (ds_list_find_value(_list, i))
                    ds_list_add(list_ignore, other.id);
            }
            
            ds_list_destroy(_list);
        }
        
        state = 1;
        image_alpha = lerp(image_alpha, 1, 0.3);
    }
}
