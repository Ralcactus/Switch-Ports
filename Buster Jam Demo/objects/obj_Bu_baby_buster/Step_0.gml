if (!controller.win && controller.ended)
    anim_play(spr_Bu_baby_buster_rage);

anim_logic();

if (anim_sprite == spr_Bu_baby_buster_joy)
    anim_speed += 0.00755;
