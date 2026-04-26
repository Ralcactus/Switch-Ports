obj_parent_player.state = UnknownEnum.Value_87;
instance_destroy();

with (instance_create(obj_parent_player.x, obj_parent_player.y, obj_poofeffect))
    color = 2;

obj_parent_player.sprite_index = spr_player_PZ_cotton_idle;
global.ComboFreeze = 30;
