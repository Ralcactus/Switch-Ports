draw_sprite_ext(spr_micro_pistol_demon_cannon, 0, x + (cannon_xoff * 780), y, 1, 1, 0, c_white, 1);

if (laser_go)
    draw_sprite_ext(spr_micro_pistol_demon_laser, laser_ind, x + (cannon_xoff * 780), y, 1, 1, 0, c_white, 1);

draw_sprite_ext(anim_sprite, anim_index, x, y, 1, 1, 0, c_white, 1);
