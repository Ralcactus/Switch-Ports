var lay_id = layer_get_id("Tiles_1");
var map_id = layer_tilemap_get_id(lay_id);

for (var i = 0; i < image_xscale; i++)
{
    for (var j = 0; j < image_yscale; j++)
    {
        var mx = tilemap_get_cell_x_at_pixel(map_id, x + (64 * i), y + (64 * j));
        var my = tilemap_get_cell_y_at_pixel(map_id, x + (64 * i), y + (64 * j));
        var _index = tilemap_get(map_id, mx, my);
        
        if (_index > 0)
        {
            var _save = [i, j, _index];
            tilemap_set(map_id, 0, mx, my);
            array_push(tiles, _save);
        }
    }
}
