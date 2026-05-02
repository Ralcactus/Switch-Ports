mask_index = spr_acidpuddle;

if (grounded && sprite_index != spr_acidpuddle)
    sprite_index = spr_juicepuddlesplash;

if (animation_end() && sprite_index == spr_juicepuddlesplash)
    sprite_index = spr_acidpuddle;

if (scr_solid(x, y))
    instance_destroy();
