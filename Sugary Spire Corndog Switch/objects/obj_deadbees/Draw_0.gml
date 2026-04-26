for (var i = 0; i < beecount; i++)
{
    var beenum = (i % 1) + 1;
    draw_sprite_ext(asset_get_index("spr_ghostbee" + string(beenum)), -1, beepos[i][0], beepos[i][1] + beey[i], 1, 1, 0, c_white, image_alpha);
}
