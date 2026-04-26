event_inherited()
image_alpha = 0.35
escape = 1
image_speed = 0.35
sprite_index = spr_collectescape
use_palette = false
random_set_seed(global.RandomSeed + x + y)
image_index = irandom_range(0, image_number - 1)
random_set_seed(global.RandomSeed)
