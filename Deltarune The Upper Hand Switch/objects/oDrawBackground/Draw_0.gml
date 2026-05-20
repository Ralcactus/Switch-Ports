if (op.camMode == "soul")
    des();

if (draw)
{
    ext(sBBG1, 0, 0, 0);
    
    if (!surface_exists(surf))
        surf = surface_create(640, 480);
    
    if (!surface_exists(surf2))
        surf2 = surface_create(640, 720);
    
    surface_set_target(surf);
    ext(sBBG1, 0, 0, 0);
    ext(sBBGrays, 0 + style, 320, 50, 0.4, 0.4, op.ty, undefined, 0.5);
    ext(sBBGrays, 0 + style, 320, 50, 0.4, 0.4, (3 * dsin(op.ty * 1.5)) + op.ty, undefined, 0.25);
    ext(sBBGrays, 0 + style, 320, 50, 0.4, 0.4, (-3 * dcos(op.ty * 1.5)) + op.ty, undefined, 0.25);
    
    if (style == 2)
    {
        ext(sBBGrays, 0 + style, 320, 50, 0.4, 0.4, op.ty + 45, undefined, 0.5);
        ext(sBBGrays, 0 + style, 320, 50, 0.4, 0.4, (3 * dsin(op.ty * 1.5)) + op.ty + 45, undefined, 0.25);
        ext(sBBGrays, 0 + style, 320, 50, 0.4, 0.4, (-3 * dcos(op.ty * 1.5)) + op.ty + 45, undefined, 0.25);
    }
    
    surface_reset_target();
    surface_set_target(surf2);
    draw_clear_alpha(c_white, 0);
    res_i();
    i1 = 16777215;
    i2 = 1;
    i3 = 1;
    
    repeat (4)
    {
        if (i > 1)
            i1 = 0;
        
        draw_sprite_tiled_ext(sClouds, i + (style * 4), op.ty * (i + 1) * i3, 0, 2, 2, i1, i2);
        i++;
        i3 *= -1;
    }
    
    surface_reset_target();
    ext(sBBG1, 3, 0, 0);
    ext(sDeb, 0, 500, 240);
    ext(sDeb, 1, 82, 138);
    ext(sDeb, 2, 600, 140);
    ext(sDeb, 3, 226, 98);
    ext(sDeb, 4, 168, 256);
    
    if (op.superMode)
        ext(sBBG1, 2, 0, 0);
    
    draw_surface_ext(surf, 0, 0, 1, 1, 0, c_white, 1);
    gpu_set_blendmode(bm_add);
    
    if (room != rSockTransformation)
        draw_surface_ext(surf2, 0, 240 - (240 * fogAlpha), 1, 1, 0, c_white, fogAlpha);
    
    gpu_set_blendmode(bm_normal);
    ext(sBBG1, 1 + (style * 6), 0, 0);
    surface_set_target(surf2);
    draw_clear_alpha(c_white, 0);
    ext(sPixel, 0, 0, 0, 999, 999, undefined, 0);
    res_i();
    i1 = 16777215;
    i2 = 1;
    i = 2;
    i3 = 1;
    
    repeat (2)
    {
        draw_sprite_tiled_ext(sClouds, i + (style * 4), op.ty * (i + 1) * i3, 0, 2, 2, i1, i2);
        i++;
        i3 *= -1;
    }
    
    surface_reset_target();
    
    if (room != rSockTransformation)
    {
        if (fogAlpha > 0)
        {
            gpu_set_blendmode(bm_subtract);
            draw_surface_ext(surf2, 0, 240 - (240 * fogAlpha), 1, 1, 0, c_fuchsia, fogAlpha);
            gpu_set_blendmode(bm_add);
            draw_surface_ext(surf2, 0, 240 - (240 * fogAlpha), 1, 1, 0, c_white, fogAlpha);
        }
        
        gpu_set_blendmode(bm_normal);
    }
    
    if (!op.superMode)
        ext(sBBG1, 2, 0, 0);
    
    ext(circles[style], op.ty / 4, 322, 50);
    ext(sDeltarune, 0 + (style * 6), 252 + (dsin(0 + (op.ty * 5)) * 3), 42 + (dsin(0 + (op.ty * 5)) * 4));
    ext(sDeltarune, 1 + (style * 6), 396 - (dsin(120 + (op.ty * 5)) * 3), 40 + (dsin(120 + (op.ty * 5)) * 4));
    ext(sDeltarune, 2 + (style * 6), 322, 66 + (dsin(240 + (op.ty * 5)) * 4));
    ext(sBBGtwinkle, op.ty / 10, 322, 50 + (dsin(240 + (op.ty * 5)) * 4));
    ext(sDeltarune, 3 + (style * 6), 302, 112 + (dsin(240 + (op.ty * 5)) * 4));
    ext(sDeltarune, 4 + (style * 6), 346, 120 + (dsin(120 + (op.ty * 5)) * 4));
    ext(sDeltarune, 5 + (style * 6), 324, 132 + (dsin(0 + (op.ty * 5)) * 4));
    
    if (op.alexMode)
        draw_sprite_tiled(sAlex_SpamtonMarioBG, 1, op.ty, op.ty);
}
