function mbuff_transform(arg0, arg1)
{
    var mBuff = arg0;
    var M = arg1;
    var epsilon = math_get_epsilon();
    var N = array_create(16, 0);
    array_copy(N, 0, M, 0, 11);
    
    if (!is_array(mBuff))
        mBuff = [mBuff];
    
    var modelNum = array_length(mBuff);
    var bytesPerVert = 44;
    
    for (var m = 0; m < modelNum; m++)
    {
        var buff = mBuff[m];
        var buffSize = buffer_get_size(buff);
        
        for (var i = 0; i < buffSize; i += bytesPerVert)
        {
            buffer_seek(buff, buffer_seek_start, i);
            var vx = buffer_read(buff, buffer_f32);
            var vy = buffer_read(buff, buffer_f32);
            var vz = buffer_read(buff, buffer_f32);
            var nx = buffer_read(buff, buffer_f32);
            var ny = buffer_read(buff, buffer_f32);
            var nz = buffer_read(buff, buffer_f32);
            var v = matrix_transform_vertex(M, vx, vy, vz);
            var n = matrix_transform_vertex(N, nx, ny, nz);
            var l = 1 / max(epsilon, sqrt(sqr(n[0]) + sqr(n[1]) + sqr(n[2])));
            buffer_seek(buff, buffer_seek_start, i);
            buffer_write(buff, buffer_f32, v[0]);
            buffer_write(buff, buffer_f32, v[1]);
            buffer_write(buff, buffer_f32, v[2]);
            buffer_write(buff, buffer_f32, n[0] * l);
            buffer_write(buff, buffer_f32, n[1] * l);
            buffer_write(buff, buffer_f32, n[2] * l);
        }
    }
}
