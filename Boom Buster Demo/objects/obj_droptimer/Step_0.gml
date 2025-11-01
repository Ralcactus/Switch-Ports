if (!exit_freeze())
    timer--;

if (timer == 0)
{
    if (item != -4)
    {
        var _item = instance_create_layer(x, 0, "Instances_Over", item);
        _item.col = ind;
        _item.wings = wings;
        
        if (landYobj == -4)
            _item.landY = y;
        else
            _item.landYobj = landYobj;
        
        if (mypath != -4)
        {
            _item.mypath = mypath;
            _item.path_pos = path_pos;
            _item.x = path_get_x(mypath, path_pos);
            _item.landY = path_get_y(mypath, path_pos);
        }
    }
    
    instance_destroy();
}
