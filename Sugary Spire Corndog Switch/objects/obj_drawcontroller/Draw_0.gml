var c = view_camera[0];
var dist = 32;

with (obj_parent_baddie)
{
    if (visible && bbox_in_camera(id, c, dist))
    {
        drawBaddieSprite();
        
        if (global.DebugMode)
        {
            draw_set_font(font_dev);
            draw_text(x, y - 50, string("State: {0}", state));
            draw_text(x, y - 150, string("hsp: {0}, vsp: {1}, Movespeed: {2}", hsp, vsp, movespeed));
            draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
        }
    }
}

with (obj_creamThief)
{
    if (visible && bbox_in_camera(id, c, dist))
        draw_self();
}

with (obj_parent_player)
{
    if (visible && bbox_in_camera(id, c, dist))
    {
        var my_color_array = myPalettes[paletteSelect];
        scr_player_palsurf_setup(my_color_array);
        draw_player_sprite_ext(sprite_index, image_index, x, y, xscale * scale, yscale * scale, draw_angle, 16777215, image_alpha);
        
        if (flash)
            draw_sprite_ext_flash(sprite_index, image_index, x, y, xscale * scale, yscale * scale, draw_angle, 16777215, image_alpha);
        
        if (isInSecretPortal)
            draw_sprite_ext_flash(sprite_index, image_index, x, y, xscale * scale, yscale * scale, draw_angle, 9251145, image_alpha * (1.5 - scale));
        
        if (global.DebugMode)
        {
            draw_set_font(font_dev);
            draw_set_halign(fa_center);
            draw_set_color(c_white);
            draw_text(x, y - 50, string("State: {0}.{1} Statename: {2}", state, substate, stateName));
            draw_text(x, y - 100, string("Hsp: {0}", hsp));
            draw_text(x, y - 150, string("Vsp: {0}", round(vsp)));
            draw_text(x, y - 200, string("Is grounded: {0}", grounded ? "True" : "False"));
            draw_text(x, y - 220, string("Angle: {0}", angle));
            draw_text(x + 50, y - 220, string("BaddiegrabbedID: {0}", baddieGrabbedID));
            draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
            draw_set_halign(fa_left);
        }
    }
}

with (obj_baddieDead)
{
    if (paletteSprite != -4)
    {
        pal_swap_set(paletteSprite, paletteSelect, false);
        draw_sprite_ext(sprite_index, -1, drawx, drawy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        shader_reset();
    }
    else
    {
        draw_sprite_ext(sprite_index, -1, drawx, drawy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    }
}
