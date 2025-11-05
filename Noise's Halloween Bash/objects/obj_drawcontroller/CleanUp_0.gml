if (surface_exists(guisurf))
    surface_free(guisurf);

if (surface_exists(finalsurf))
    surface_free(finalsurf);

if (surface_exists(hudcratesurf))
    surface_free(hudcratesurf);

if (surface_exists(hudgemsurf))
    surface_free(hudgemsurf);

if (surface_exists(scoresurf))
    surface_free(scoresurf);

if (surface_exists(piesurf))
    surface_free(piesurf);

if (surface_exists(bgsurf))
    surface_free(bgsurf);

if (surface_exists(outlineSurf))
    surface_free(outlineSurf);

ds_list_destroy(billboardlist);

array_foreach(vBuffTiles, function(_vbuffs, _vbuff_index)
{
    if (!is_undefined(array_get_undefined(vBuffTiles, _vbuff_index)) && vBuffTiles[_vbuff_index] != -1)
        vertex_delete_buffer(vBuffTiles[_vbuff_index]);
});
