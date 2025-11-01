play_impact();
screen_shake(4, 4);
var _spun = instance_create_layer(x, y, layer, obj_spun);
_spun.anim_sprite = sprite_spun;
_spun.facing = -facing;
_spun.hspd = -facing;
instance_destroy();
