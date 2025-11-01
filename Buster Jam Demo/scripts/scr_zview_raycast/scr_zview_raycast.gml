function scr_zview_raycast()
{
    if (!instance_place_3d(x, y, z + 1, obj_solid))
    {
        var _zcheck = z;
        
        while (!instance_place_3d(x, y, z + _zcheck, obj_solid))
            _zcheck += 16;
        
        var _inst = instance_place_3d(x, y, z + _zcheck, obj_solid);
        z_view = _inst.z - _inst.height - 1;
    }
    else
    {
        z_view = z;
    }
}
