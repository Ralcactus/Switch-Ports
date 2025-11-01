function scr_bg_sewer()
{
    get_cams();
    draw_sprite(bgr_sewer_wall, 0, camx * 0.95, camy * 0.95);
    draw_bg_overlay(9737, 0.24705882352941178);
    draw_sprite(bgr_sewer_pipes, 0, camx * 0.8, camy * 0.8);
    draw_bg_overlay(9737, 0.396078431372549);
    draw_sprite(bgr_sewer_ground, 0, camx * 0.6, 240 + (camy * 0.6));
    draw_bg_overlay(9737, 0.25098039215686274);
    draw_sprite(bgr_sewer_water, 0, (camx * 0.6) + water_x, room_height - sprite_get_height(bgr_sewer_water));
    draw_sprite(bgr_sewer_water, 0, ((camx * 0.6) + water_x) - sprite_get_width(bgr_sewer_water), room_height - sprite_get_height(bgr_sewer_water));
    draw_sprite(bgr_sewer_pipehookups, 0, 222 + (camx * 0.6), 298 + (camy * 0.6));
    draw_bg_overlay(9737, 0.12549019607843137);
    
    if (!exit_freeze())
        water_x += 0.25;
    
    if (water_x >= sprite_get_width(bgr_sewer_water))
        water_x -= water_x;
    
    draw_sprite(bgr_sewer_mushroom, 6, 345 + (camx * 0.5), (camy * 0.5) + 36);
    draw_sprite(bgr_sewer_mushroom2, 6, 875 + (camx * 0.5), (camy * 0.5) + 36);
    draw_bg_overlay(2307, 0.27450980392156865);
}
