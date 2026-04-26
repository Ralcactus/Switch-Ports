image_speed = 1
depth = 100
random_set_seed(global.RandomSeed + x + y)
escapeSprite = choose(spr_candle_lit, spr_candle_off)
random_set_seed(global.RandomSeed)
image_index = irandom_range(0, image_number - 1)
