anim_init();
var _spr = instance_create_depth(x, y, layer_get_depth(layer) + 1, obj_spriteasset);
_spr.sprite_index = spr_pipeBGs;
_spr.image_index = 1;
_spr.image_speed = 0;
depth--;
