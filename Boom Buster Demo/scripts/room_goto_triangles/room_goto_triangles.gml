function room_goto_triangles(arg0, arg1 = 30)
{
    var _trans = instance_create_layer(0, 0, "Transition", obj_transition_triangles);
    _trans.myRoom = arg0;
    _trans.wait = arg1;
    return _trans.id;
}
