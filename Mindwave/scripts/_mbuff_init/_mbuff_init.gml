function _mbuff_init()
{
    vertex_format_begin();
    vertex_format_add_position_3d();
    vertex_format_add_normal();
    vertex_format_add_texcoord();
    vertex_format_add_color();
    global.mBuffStdFormat = vertex_format_end();
    global.mBuffStdValues = 12;
    vertex_format_begin();
    vertex_format_add_position_3d();
    vertex_format_add_normal();
    vertex_format_add_texcoord();
    vertex_format_add_color();
    vertex_format_add_color();
    vertex_format_add_color();
    global.mBuffFormat = vertex_format_end();
    global.mBuffValues = 20;
    global.TexMapExternalSprite = ds_map_create();
}
