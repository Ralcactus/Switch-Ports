function scr_tv_bridget()
{
    draw_sprite_gui(spr_tv_bg, tv_bg_ind, 1408, 0);
    draw_sprite_gui(spr_tv_bag, 0, 1408, 0);
    draw_sprite_gui(spr_tv_ground, tv_bg_ind, 1408, 0);
    draw_sprite_gui(bridget_sprite, bridget_sub, 1408, 0);
    
    if (bridget_sprite == spr_tv_brb_bridget)
        draw_sprite_gui_ext(spr_static, static_ind, 1408, 0, undefined, undefined, undefined, undefined, 0.2);
    
    if (exit_freeze())
        exit;
    
    bridget_sub += (sprite_get_speed(bridget_sprite) / 60);
    
    if (bridget_sub >= sprite_get_number(bridget_sprite))
        bridget_animend();
    
    static_ind += (sprite_get_speed(spr_static) / 60);
    
    if (static_ind >= sprite_get_number(spr_static))
        static_ind -= static_ind;
}
