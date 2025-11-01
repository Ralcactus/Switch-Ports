if (created)
    exit;

var _choice = choose("A", "B", "C");
var _str = struct_get(global.microgames_data, string("coin{0}", _choice));
var _data = json_load(_str, false);

for (var i = 0; i < array_length(_data.instances); i++)
{
    var _x = (_data.instances[i].x - 165) + 17;
    var _y = (_data.instances[i].y - 102) + 6;
    var _layer = _data.instances[i].layer;
    var _type = _data.instances[i].type;
    
    if (_type == 0)
    {
        var _asset = asset_get_index(_data.instances[i].asset);
        var _inst = instance_create_layer(_x, _y, _layer, _asset);
        _inst.ID = ID;
        _inst.controller = controller;
        _inst.visible = false;
    }
}

created = true;
