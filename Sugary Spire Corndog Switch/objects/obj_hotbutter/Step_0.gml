mask_index = spr_juicepuddledone;

if (grounded && sprite_index != spr_juicepuddledone)
    sprite_index = spr_juicepuddlesplash;

if (animation_end() && sprite_index == spr_juicepuddlesplash)
    sprite_index = spr_juicepuddledone;

if (scr_solid(x, y))
    instance_destroy();
