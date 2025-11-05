event_inherited();
destroy_sounds([loopsnd]);
instance_destroy(fireid);
scr_fmod_soundeffectONESHOT("event:/sfx/misc/cratedestroy", x + (sprite_width / 2), y + (sprite_height / 2));
crateeffect(#B03000);

with (instance_create_depth(x + (sprite_width / 2), y + (sprite_height / 2), z + 16, par_collect))
{
    image_speed = 0.35;
    value = 10;
    splitfactor = 10;
    splittime = 3;
    particlespr = [spr_collect1, spr_collect2, spr_collect3, spr_collect4, spr_collect5];
    canmagnetise = false;
    splitsound = "event:/sfx/player/collect";
    saveroom = false;
    event_user(0);
}

combo();
