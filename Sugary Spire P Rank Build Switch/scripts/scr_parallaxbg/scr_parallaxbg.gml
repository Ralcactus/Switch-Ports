//Init
global.bgSurfaceBuffer = -1;
function scr_parallaxbg_init()
{
    var layers, layernum = 0;
    //Loop through all layers to find if they are a background layer or an asset layer
	var a = layer_get_all();
    for (var i = 0; i < array_length(a); i++)
    {
        var back_id = layer_background_get_id_fixed(layer_get_name(a[i]));
        
        if (back_id != -1 && !layer_get_depth(a[i]) <= 0 && layer_get_visible(a[i]) == true)
            layers[layernum++] = a[i];
    }
	//If no layers are found get out
	if (!layernum)
	    return;
	//Sort Array
    var _f = function(elm1, elm2) 
	{
		return -(layer_get_depth(elm1) - layer_get_depth(elm2));
	}
	array_sort(layers, _f);
	
    var bottom_id = layers[0];
    var top_id = layers[layernum - 1];
    
    with (obj_parallax)
        depth = layer_get_depth(top_id) - 1;
    
    layer_script_begin(bottom_id, scr_parallaxbg_start);
    layer_script_end(top_id, scr_parallaxbg_end);
}
//Start
function scr_parallaxbg_start()
{
    if (!surface_exists(global.parallaxbg_surface))
        global.parallaxbg_surface = surface_create(1088, 668);
    
    if (event_type == ev_draw && event_number == 0)
    {
        surface_set_target(global.parallaxbg_surface);
        draw_clear_alpha(c_black, 0);
        var _cam_x = camx;
        var _cam_y = camy;
        var a = layer_get_all();
        
        for (var i = 0; i < array_length(a); i++)
        {
            var back_id = layer_background_get_id_fixed(layer_get_name(a[i]));
            
            if (back_id != -1 && !layer_get_depth(a[i]) <= 0 && layer_get_visible(a[i]) == true)
            {
                layer_x(a[i], (layer_get_x(a[i]) - _cam_x) + 64);
                layer_y(a[i], (layer_get_y(a[i]) - _cam_y) + 64);
            }
        }
    }
}
//End
function scr_parallaxbg_end()
{
    if (event_type == ev_draw && event_number == 0)
    {
        gpu_set_blendenable(0);
        gpu_set_colorwriteenable(0, 0, 0, 1);
        draw_rectangle(-192, -192, 1152, 732, 0);
        gpu_set_blendenable(1);
        gpu_set_colorwriteenable(1, 1, 1, 1);
        surface_reset_target();
    }
}
