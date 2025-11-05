event_inherited();
scr_fmod_soundeffectONESHOT("event:/sfx/misc/cratedestroy", x + (sprite_width / 2), y + (sprite_height / 2));
crateeffect(#B03000);

with (instance_create_depth(x + (sprite_width / 2), y + (sprite_height / 2), z + 16 + random_range(-3, 3), par_collect))
{
    image_speed = 0.35;
    value = 1;
    sprite_index = choose(spr_collect1, spr_collect2, spr_collect3, spr_collect4, spr_collect5);
    hasphysics = true;
    vsp = random_range(-2, -4);
    collectonland = true;
    saveroom = false;
}

combo();
