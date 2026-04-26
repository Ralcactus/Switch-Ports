if (sprite_index == spr_acidpuddle)
    event_inherited();

if (sprite_index == spr_juicepuddledone && other.grounded)
    event_user(0);
