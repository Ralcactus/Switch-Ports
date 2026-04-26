var target_object = (ds_list_find_index(global.KeyFollowerList, id) <= 0) ? get_nearestPlayer(x, y) : ds_list_find_value(global.KeyFollowerList, ds_list_find_index(global.KeyFollowerList, id) - 1);
var tgtX = target_object.x + (sign(target_object.image_xscale) * -((ds_list_find_index(global.KeyFollowerList, id) <= 0) ? 30 : 10));
var tgtY = (ds_list_find_index(global.KeyFollowerList, id) <= 0) ? (target_object.y - 40) : (target_object.y - 3);
var tgtMVSP = distance_to_point(tgtX, tgtY) / 200;
var _d = point_direction(x, y, tgtX, tgtY);
var hsp = lengthdir_x((18 * tgtMVSP) + 0.5, _d);
var vsp = lengthdir_y((18 * tgtMVSP) + 0.5, _d);
x = approach(x, tgtX, hsp);
y = approach(y, tgtY, vsp);

if (x != target_object.x)
    image_xscale = getFacingDirection(x, target_object.x);

if (x == xprevious)
    sprite_index = spr_spookey;
else
    sprite_index = spr_spookey_move;
