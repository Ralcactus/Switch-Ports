gpu_push_state();
gpu_set_cullmode(2);
var _objects = [obj_cratecounter, par_gem];
var _num = collision_circle_list(camX, camY, max(global.maxscreenwidth, global.maxscreenheight), _objects, false, true, global.instancelist, false);

for (var i = 0; i < _num; i++)
{
    with (global.instancelist[| i])
    {
        if (!visible)
            continue;
        
        event_user(0);
    }
}

ds_list_clear(global.instancelist);
gpu_pop_state();
var _prevtest = gpu_get_alphatestenable();
gpu_set_alphatestenable(false);
var _len = array_length(toshadow);

if (_len > 0)
{
    if (global.outlines && surface_exists(outlineSurf))
    {
        shader_set(shd_shadows);
        texture_set_stage(shadowMask, surface_get_texture(outlineSurf));
        shader_set_uniform_f(u_shadowLightLevel, globallight);
    }
    else
    {
        shader_set(shd_3dtiles);
        texture_set_stage(shadowMask, surface_get_texture(outlineSurf));
        shader_set_uniform_f(u_tileLightLevel, globallight);
    }
    
    for (var _i = 0; _i < _len && toshadow[_i] != noone; _i++)
    {
        var _shadow = toshadow[_i];
        matrix_set(2, matrix_build(_shadow.x, _shadow.y, _shadow.depth, 0, 180, _shadow.angle, -_shadow.size, -_shadow.size, _shadow.size / 2));
        vertex_submit(vBuffShadow, pr_trianglelist, shadowTex[_shadow.index]);
    }
    
    matrix_set(2, matrix_build_identity());
    shader_reset();
}

gpu_set_alphatestenable(_prevtest);

with (obj_dointro)
    event_user(0);
