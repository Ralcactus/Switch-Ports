function mbuff_combine_ext(arg0, arg1, arg2)
{
    var trg = arg0;
    var src = arg1;
    var M = arg2;
    var N = array_create(16, 0);
    array_copy(N, 0, M, 0, 16);
    N[12] = 0;
    N[13] = 0;
    N[14] = 0;
    var bytesPerVert = 44;
    var bytesPerTri = 3 * bytesPerVert;
    var srcSize = bytesPerTri * (buffer_get_size(src) div bytesPerTri);
    var trgSize = bytesPerTri * (buffer_get_size(trg) div bytesPerTri);
    buffer_resize(trg, srcSize + trgSize);
    buffer_seek(trg, buffer_seek_start, trgSize);
    
    for (var i = 0; i < srcSize; i += bytesPerVert)
    {
        buffer_seek(src, buffer_seek_start, i);
        var vx = buffer_read(src, buffer_f32);
        var vy = buffer_read(src, buffer_f32);
        var vz = buffer_read(src, buffer_f32);
        var nx = buffer_read(src, buffer_f32);
        var ny = buffer_read(src, buffer_f32);
        var nz = buffer_read(src, buffer_f32);
        var v = matrix_transform_vertex(M, vx, vy, vz);
        var n = matrix_transform_vertex(N, nx, ny, nz);
        buffer_copy(src, i, bytesPerVert, trg, buffer_tell(trg));
        buffer_write(trg, buffer_f32, v[0]);
        buffer_write(trg, buffer_f32, v[1]);
        buffer_write(trg, buffer_f32, v[2]);
        buffer_write(trg, buffer_f32, n[0]);
        buffer_write(trg, buffer_f32, n[1]);
        buffer_write(trg, buffer_f32, n[2]);
        buffer_seek(trg, buffer_seek_relative, bytesPerVert);
    }
}
