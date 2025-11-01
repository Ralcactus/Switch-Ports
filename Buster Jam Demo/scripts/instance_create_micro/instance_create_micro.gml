function instance_create_micro(arg0, arg1, arg2, arg3)
{
    var _inst = instance_create_layer(arg0, arg1, arg2, arg3);
    _inst.ID = ID;
    _inst.controller = controller;
    _inst.player = player;
    _inst.view = view;
    return _inst.id;
}
