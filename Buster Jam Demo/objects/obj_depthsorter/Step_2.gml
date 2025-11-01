objs = [];

for (var i = 0; i < instance_number(par_3d); i++)
{
    var _inst = instance_find(par_3d, i);
    
    if (_inst.ignore_render)
        continue;
    
    if (_inst.render_layer != render_layer)
        continue;
    
    array_push(objs, _inst);
    _inst.visible = false;
}

var _sort = function(arg0, arg1)
{
    if (!variable_instance_exists(arg0, "depth_pos"))
        show_message(object_get_name(arg0.object_index));
    
    return arg1.depth_pos - arg0.depth_pos;
};

array_sort(objs, _sort);
