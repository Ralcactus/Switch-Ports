y -= z;
var _obj = obj_coin_ring_3d;

for (var i = 0; i < amnt; i++)
{
    var _dir = (360 / amnt) * i;
    var _x = x + lengthdir_x(len, _dir);
    var _y = y + lengthdir_y(len, _dir);
    var _inst = instance_create_layer(_x, _y, layer, _obj);
    _inst.z = z - 48;
    _inst.rotate_spd = rotate_spd;
    _inst.dir = _dir;
    _inst.len = len;
    _inst.spawner_x = x;
    _inst.spawner_y = y + 48;
}

instance_destroy();
