event_inherited();
my_solid = instance_create_layer(x, y, layer, obj_solid);
my_solid.sprite_index = mask_index;
my_solid.height = 768;
my_solid.z = z;

event_break = function()
{
    audio_play_sound(snd_crate, 0, false);
    instance_destroy();
};

anim_init();
