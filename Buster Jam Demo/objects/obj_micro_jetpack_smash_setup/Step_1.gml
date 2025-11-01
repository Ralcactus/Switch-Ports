if (instance_exists(obj_microscanner_setup))
    exit;

if (created)
    exit;

var _choice = choose("A", "B");
var _str = struct_get(global.microgames_data, string("jetpack_smash{0}", _choice));
var _data = json_load(_str, false);

for (var i = 0; i < array_length(_data.instances); i++)
{
    var _inst = _data.instances[i];
    var _asset = asset_get_index(_inst.asset);
    var _type = _inst.type;
    var _x = _inst.x;
    var _y = _inst.y;
    var _ind = _inst.ind;
    var _xscale = _inst.xscale;
    var _yscale = _inst.yscale;
    var _layer = layer_get_id(_inst.layer);
    var _new;
    
    if (_type == 0)
    {
        _new = instance_create_micro(_x, _y, _layer, _asset);
    }
    else if (_type == 1)
    {
        _new = instance_create_layer(_x, _y, _layer, obj_spriteasset_microgame);
        _new.sprite_index = _assetinstance_create_micro;
    }
    
    _new.image_index = _ind;
    _new.image_xscale = _xscale;
    _new.image_yscale = _yscale;
    _new.visible = false;
}

created = true;
