camera_apply(camera);
update_cam(true, false);
gpu_set_blendenable(false);
gpu_set_zwriteenable(false);

if (room == Titlescreen || room == Jeg || array_find_pos(global.levelrooms, room) != -1)
    draw_background();

gpu_set_zwriteenable(true);
gpu_set_blendenable(true);
update_cam(false, true);

if (global.outlines)
{
    var _gW = get_game_width();
    var _gH = get_game_height();
    
    if (!surface_exists(outlineSurf))
        outlineSurf = surface_create(_gW, _gH, 6);
    else if (surface_get_width(outlineSurf) != _gW || surface_get_height(outlineSurf) != _gH)
        surface_resize(outlineSurf, _gW, _gH);
    
    var _mask = surface_get_texture(outlineSurf);
    var _uvs = sprite_get_uvs(spr_1x1, 0);
    var _cW = camera_get_view_width(camera);
    var _cH = camera_get_view_height(camera);
    var _tW = texture_get_texel_width(_mask);
    var _tH = texture_get_texel_width(_mask);
    gpu_push_state();
    gpu_set_zwriteenable(true);
    gpu_set_ztestenable(true);
    gpu_set_blendenable(false);
    gpu_set_cullmode(2);
    surface_set_target(outlineSurf);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
    surface_set_target(outlineSurf);
    camera_apply(camera);
    shader_set(shd_3dassets);
    draw_assets();
    global.outlineDrawing = true;
    draw_tiles();
    draw_models();
    
    with (obj_cratecounter)
        event_user(0);
    
    with (par_gem)
        event_user(0);
    
    global.outlineDrawing = false;
    surface_reset_target();
    draw_assets();
    draw_tiles();
    draw_models();
    gpu_set_zwriteenable(false);
    gpu_set_ztestenable(false);
    gpu_set_blendenable(true);
    matrix_set(0, view2D);
    matrix_set(1, proj2D);
    shader_set(shd_3doutline);
    texture_set_stage(outlineMask, _mask);
    shader_set_uniform_f(outlineTexel, _tW, _tH);
    shader_set_uniform_f(outlineUVs, _uvs[0], _uvs[1], _uvs[2], _uvs[3]);
    draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, _cW, _cH, c_black, 1);
    shader_reset();
    camera_apply(camera);
    gpu_pop_state();
}
else
{
    if (surface_exists(outlineSurf))
        surface_free(outlineSurf);
    
    gpu_push_state();
    gpu_set_blendenable(false);
    gpu_set_cullmode(2);
    draw_assets();
    draw_tiles();
    draw_models();
    gpu_pop_state();
}
