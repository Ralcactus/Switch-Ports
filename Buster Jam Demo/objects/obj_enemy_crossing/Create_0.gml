event_inherited();
anim_init();
image_speed = 0;
mask_index = spr_map_enemy_crossing_masks;
ID = 0;
anim = [spr_map_ball_d, spr_map_lip_d, spr_map_rodger_d, spr_map_ball_d, spr_map_lip_d];
var _choose = irandom_range(0, array_length(anim) - 1);
anim_play(anim[_choose]);
height = 96;

if (_choose == spr_map_ball_d)
{
    image_index = 0;
}
else if (_choose == spr_map_lip_d)
{
    image_index = 1;
    height = 20;
}
else
{
    image_index = 2;
}

crosswalk_stop = false;
