function room_goto_fade(arg0)
{
    var _trans = instance_create_layer(0, 0, "Transition", obj_transition_fade);
    _trans.myRoom = arg0;
}
