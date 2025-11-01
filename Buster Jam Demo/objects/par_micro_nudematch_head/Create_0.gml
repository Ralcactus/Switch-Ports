eyes = 0;
nose = 1;
mouth = 2;

for (var i = 0; i < 3; i++)
{
    index[i] = 0;
    shake[i] = 0;
}

image_speed = 0;
row = eyes;
ready = false;
alarm[0] = 2;
spr = [spr_micro_nudematch_eyes, spr_micro_nudematch_noses, spr_micro_nudematch_mouths];
arrow_ind = 0;
arrow_leftoff = 0;
arrow_rightoff = 0;
