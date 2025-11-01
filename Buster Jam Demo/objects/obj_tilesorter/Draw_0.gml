var _width = sprite_get_width(spr_tileset) / 64;

for (var i = 0; i < array_length(tiles); i++)
{
    var _index = tiles[i][2];
    var _left = (_index % _width) * 64;
    var _top = (_index div _width) * 64;
    var _x = x + (tiles[i][0] * 64);
    var _y = y + (tiles[i][1] * 64);
    draw_sprite_part(spr_tileset, 0, _left, _top, 64, 64, _x, _y + z);
}
