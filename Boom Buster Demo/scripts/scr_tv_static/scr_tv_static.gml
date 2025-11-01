function scr_tv_static()
{
    draw_sprite_gui(spr_static, static_ind, 1408, 0);
    
    if (exit_freeze() && !tv_override)
        exit;
    
    static_ind += (sprite_get_speed(spr_static) / 60);
    
    if (static_ind >= sprite_get_number(spr_static))
        static_ind -= static_ind;
}
