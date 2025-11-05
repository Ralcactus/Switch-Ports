var _rad = tweenedrad;

with (obj_drawcontroller)
{
    var _sp = world_to_screen(obj_player.x, obj_player.y, obj_player.z, viewMat, projMat, true);
    
    if (_sp != undefined)
    {
        other.pos.x = _sp[0];
        other.pos.y = _sp[1];
    }
    
    gpu_push_state();
    gpu_set_zwriteenable(false);
    matrix_set(0, view2D);
    matrix_set(1, proj2D);
    
    if (_rad > 0)
    {
        shader_set(shd_holecutout);
        shader_set_uniform_f(other.u_playerpos, other.pos.x, other.pos.y);
        shader_set_uniform_f(other.u_radius, _rad);
    }
    
    draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, get_game_width(), get_game_height(), c_black, 1 - (other.radstep / other.radend));
    shader_reset();
    gpu_pop_state();
    camera_apply(camera);
    gpu_push_state();
    gpu_set_ztestenable(false);
    
    with (obj_player)
    {
        if (_rad < 64)
        {
            var _prevalpha = image_alpha;
            image_alpha = 1 - min(_rad / 64, 1);
            event_user(7);
            image_alpha = _prevalpha;
        }
    }
    
    gpu_pop_state();
}
