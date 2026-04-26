event_inherited()
sprite_index = spr_bigbreak
random_set_seed(global.RandomSeed + x + y)
image_index = irandom_range(0, image_number - 1)
hard_covering_index = irandom_range(0, sprite_get_number(spr_bigbreakhard_overlay) - 1)
random_set_seed(global.RandomSeed)
image_speed = 0
event_inherited()
