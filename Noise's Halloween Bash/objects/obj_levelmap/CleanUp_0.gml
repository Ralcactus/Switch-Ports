for (var _s = 0; _s < array_length(map_surf); _s++)
{
    if (surface_exists(map_surf[_s]))
        surface_free(map_surf[_s]);
}

if (surface_exists(main_surf))
    surface_free(main_surf);

array_foreach(vBuffMap, function(_vbuffs, _vbuff_index)
{
    if (array_get_undefined(vBuffMap, _vbuff_index) != undefined && vBuffMap[_vbuff_index] != -1)
        vertex_delete_buffer(vBuffMap[_vbuff_index]);
});
