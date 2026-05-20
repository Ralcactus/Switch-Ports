surf = -1;
step = 0;

function chaseMask(arg0, arg1, arg2 = 0, arg3 = 0, arg4 = 2, arg5 = 2)
{
    if (!surface_exists(surf))
        surf = surface_create(640, 960);
    
    if (arg0 != sRisinghands_BackLayer && arg0 != sRisinghands_FrontLayer)
        arg3 += (dsin((op.ty * 5) + ((step * 360) / 6)) * 10);
    
    surface_set_target(surf);
    draw_clear_alpha(c_white, 0);
    ext(arg1, round(step / 3.25) + (op.ty / 10), arg2, arg3, arg4, arg5);
    gpu_set_colorwriteenable(1, 1, 1, 0);
    ext(sSpaceM2, 0, 0, op.camY - y);
    ext(sSpaceM2, 0, 0, (960 + op.camY) - y, undefined, -2);
    gpu_set_colorwriteenable(1, 1, 1, 1);
    ext(arg0, round(step / 3.25) + (op.ty / 10), arg2, arg3, arg4, arg5);
    surface_reset_target();
    draw_surface_ext(surf, x, y, 1, 1, 0, c_white, 1);
    step += 3.25;
}
