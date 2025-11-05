event_inherited();
scr_fmod_soundeffectONESHOT("event:/sfx/misc/cratedestroy", x + (sprite_width / 2), y + (sprite_height / 2));
crateeffect(#E03000);
combo();
instance_create_depth(x + (sprite_width / 2), y + (sprite_height / 2), z, obj_explosion);
