collectvanish = false;
collectboxid = -4;
in_the_void = false;
depth = 2;
global.collected = 0;
global.collectsound = 0;
random_set_seed(global.RandomSeed + x + y);
image_index = irandom_range(0, image_number - 1);

switch (obj_parent_player.character)
{
    case UnknownEnum.Value_0:
        sprite_index = choose(spr_bigcollect1P, spr_bigcollect2P, spr_bigcollect3P, spr_bigcollect4P, spr_bigcollect5P, spr_bigcollect6P);
        break;
    
    case UnknownEnum.Value_1:
        sprite_index = choose(spr_bigcollect1N, spr_bigcollect2N, spr_bigcollect3N);
        break;
}

random_set_seed(global.RandomSeed);
image_speed = 0.35;
gotowardsPlayer = false;
