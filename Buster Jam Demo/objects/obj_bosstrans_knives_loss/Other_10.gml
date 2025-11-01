testvariablenothing = false;
draw_sprite_ext(spr_bosstrans_knives_lose_bg, lose_bg_ind, 0, 0, 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_bosstrans_knives_lose_bg_overlay, lose_bg_ind, 0, bg_overlay_y, 1, 1, 0, c_white, 1);
draw_sprite_ext(anim_sprite, anim_index, 0, 0, 1, 1, 0, c_white, 1);
scr_draw_transition_gui();
