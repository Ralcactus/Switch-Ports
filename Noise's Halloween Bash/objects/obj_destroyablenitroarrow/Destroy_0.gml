add_saveroom(string("{0}_ARROW", real(id)), global.respawnroom);
scr_fmod_soundeffectONESHOT("event:/sfx/misc/cratedestroy", x + (sprite_width / 2), y + (sprite_height / 2));
scr_fmod_soundeffectONESHOT("event:/sfx/misc/nitro", x + (sprite_width / 2), y + (sprite_height / 2));
crateeffect(#88A8C8);

with (instance_create_depth(x, y, z, obj_destroyablenitro))
{
    squish = 0.7;
    arrowid = other.id;
    image_xscale = other.image_xscale;
    image_yscale = other.image_yscale;
}
