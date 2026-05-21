for (var i = 0; i < array_length(global.secret_layers); i++)
{
    var a = global.secret_layers[i];
    
    if (layer_exists(global.secret_layers[i].nm))
    {
        if (!surface_exists(a.surf))
            a.surf = surface_create(960, 540);
        else
        {
            surface_set_target(a.surf);
            draw_clear_alpha(c_white, 0);
            var tilemap = layer_tilemap_get_id(global.secret_layers[i].nm);
            draw_tilemap(tilemap, -camx, -camy);
            surface_reset_target();
            draw_surface_ext(a.surf, camx, camy, 1, 1, 0, c_white, a.alpha);
        }
    }
}
