testvariablenothing = false;
draw_sprite_ext(spr_bosstrans_knives_opening_bg, bg_ind, (x * 0.6) + bg_xoff, 0, 1, 1, 0, c_white, 1);

if (anim_sprite == spr_bosstrans_knives_opening_buster)
    draw_sprite_ext(spr_bosstrans_knives_opening_bridget, anim_index, x * 0.75, 0, 1, 1, 0, c_white, 1);

draw_sprite_ext(anim_sprite, anim_index, x, 0, 1, 1, 0, c_white, 1);
scr_draw_transition_gui();
