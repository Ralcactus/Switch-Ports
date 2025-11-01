anim_sprite = spr_buster_backflip;
vspd = calculate_jump(5, 1.9);
get_cams();

if (x < (camx + (camw / 2)))
    hspd = 6 * facing;
