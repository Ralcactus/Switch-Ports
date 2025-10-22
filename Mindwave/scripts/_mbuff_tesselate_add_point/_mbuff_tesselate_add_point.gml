function _mbuff_tesselate_add_point(arg0, arg1, arg2, arg3)
{
    var pointGrid = arg0;
    var vert = arg1;
    var startU = arg2;
    var startV = arg3;
    var xx = floor(vert[0]) - startU;
    var yy = floor(vert[1]) - startV;
    var dx = frac(vert[0]);
    var dy = frac(vert[1]);
    var array = ds_grid_get(pointGrid, xx, yy);
    
    if (!is_array(array))
    {
        array = [];
        ds_grid_set(pointGrid, xx, yy, array);
    }
    
    if (_array_get_array_index(array, vert) < 0)
        array[array_length(array)] = vert;
    
    if (dx == 0 && xx > 0)
    {
        array = ds_grid_get(pointGrid, xx - 1, yy);
        
        if (!is_array(array))
        {
            array = [];
            ds_grid_set(pointGrid, xx - 1, yy, array);
        }
        
        if (_array_get_array_index(array, vert) < 0)
            array[array_length(array)] = vert;
    }
    
    if (dy == 0 && yy > 0)
    {
        array = ds_grid_get(pointGrid, xx, yy - 1);
        
        if (!is_array(array))
        {
            array = [];
            ds_grid_set(pointGrid, xx, yy - 1, array);
        }
        
        if (_array_get_array_index(array, vert) < 0)
            array[array_length(array)] = vert;
    }
    
    if (dx == 0 && dy == 0 && xx > 0 && yy > 0)
    {
        array = ds_grid_get(pointGrid, xx - 1, yy - 1);
        
        if (!is_array(array))
        {
            array = [];
            ds_grid_set(pointGrid, xx - 1, yy - 1, array);
        }
        
        if (_array_get_array_index(array, vert) < 0)
            array[array_length(array)] = vert;
    }
}
