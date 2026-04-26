depth = -25;
sucrose_lighting = false;
sucrose_color = 0;
sucrose_color_array = [obj_parent_follower, obj_baddieSpawner, obj_parent_collect, obj_rocketdud, obj_dashpad, obj_gigacherrydead, obj_chocofrog, obj_parent_logicobjects, obj_confectibox, obj_eyescreammine, obj_boxofpizza];
dance_lighting = false;
dance_palette = 0;
sucroseSurface = -4;

drawPlayer = function(arg0 = id)
{
    with (arg0)
    {
        var my_color_array = myPalettes[paletteSelect][2];
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
};
