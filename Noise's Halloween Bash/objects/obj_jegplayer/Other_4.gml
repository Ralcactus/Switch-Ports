walls = vertex_create_buffer();
vertex_begin(walls, global.vFormat);

with (obj_jegtile)
    build(other.walls);

with (obj_jegwall)
{
    build(other.walls);
    build(other.walls);
    build(other.walls);
    build(other.walls);
}

with (obj_jegdoor)
    build(other.walls);

vertex_end(walls);
vertex_freeze(walls);
