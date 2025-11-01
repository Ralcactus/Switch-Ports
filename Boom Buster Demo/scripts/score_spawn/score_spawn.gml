function score_spawn(arg0 = x, arg1 = y, arg2, arg3 = obj_persistent.font_dollars, arg4 = true)
{
    var _inst = instance_create_layer(arg0, arg1, "GUI", obj_score);
    _inst.amount = arg2;
    _inst.drawfont = arg3;
    
    if (arg4)
        score_add(arg2);
    
    return _inst.id;
}
