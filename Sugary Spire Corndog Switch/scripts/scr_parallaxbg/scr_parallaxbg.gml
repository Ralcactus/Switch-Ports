global.bgSurfaceBuffer = -1;

function scr_parallaxbg_init()
{
    var layernum = 0;
    var a = layer_get_all();
    var layers;
    
    for (var i = 0; i < array_length(a); i++)
    {
        var back_id = layer_background_get_id_fixed(layer_get_name(a[i]));
        
        if (back_id != -1 && layer_get_depth(a[i]) >= 1000 && layer_get_visible(a[i]) == true)
            layers[layernum++] = a[i];
    }
    
    if (!layernum)
        exit;
    
    var _f = function(arg0, arg1)
    {
        return layer_get_depth(arg1) - layer_get_depth(arg0);
    };
    
    array_sort(layers, _f);
    var bottom_id = layers[0];
    var top_id = layers[layernum - 1];
    
    with (obj_parallax)
        depth = layer_get_depth(top_id) - 1;
    
    layer_script_begin(bottom_id, scr_parallaxbg_start);
    layer_script_end(top_id, scr_parallaxbg_end);
}

function scr_parallaxbg_start()
{
    if (event_type == ev_draw && event_number == 0)
    {
        shader_set(shd_panicbg);
        var panic_id = shader_get_uniform(shd_panicbg, "panic");
        shader_set_uniform_f(panic_id, 1);
        var time_id = shader_get_uniform(shd_panicbg, "time");
        shader_set_uniform_f(time_id, current_time / 1000);
        var fade = shader_get_uniform(shd_panicbg, "fade");
        shader_set_uniform_f(fade, global.greyscalefade / 0.6);
    }
}

function scr_parallaxbg_end()
{
    if (event_type == ev_draw && event_number == 0)
        shader_reset();
}
