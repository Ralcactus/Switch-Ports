function mbuff_create_flat_normals(arg0)
{
    var mBuff = arg0;
    
    if (!is_array(mBuff))
        mBuff = [mBuff];
    
    var bytesPerVert = 44;
    var bytesPerTri = bytesPerVert * 3;
    var modelNum = array_length(mBuff);
    
    for (var m = 0; m < modelNum; m++)
    {
        var buff = mBuff[m];
        var bufferSize = buffer_get_size(buff);
        
        for (var i = 0; i < bufferSize; i += bytesPerTri)
        {
            buffer_seek(buff, buffer_seek_start, i);
            var P0 = buffer_read(buff, buffer_f32);
            var P1 = buffer_read(buff, buffer_f32);
            var P2 = buffer_read(buff, buffer_f32);
            buffer_seek(buff, buffer_seek_start, i + bytesPerVert);
            var P3 = buffer_read(buff, buffer_f32);
            var P4 = buffer_read(buff, buffer_f32);
            var P5 = buffer_read(buff, buffer_f32);
            buffer_seek(buff, buffer_seek_start, i + (2 * bytesPerVert));
            var P6 = buffer_read(buff, buffer_f32);
            var P7 = buffer_read(buff, buffer_f32);
            var P8 = buffer_read(buff, buffer_f32);
            var x1 = P0 - P3;
            var y1 = P1 - P4;
            var z1 = P2 - P5;
            var x2 = P0 - P6;
            var y2 = P1 - P7;
            var z2 = P2 - P8;
            var Nx = (y1 * z2) - (y2 * z1);
            var Ny = (z1 * x2) - (z2 * x1);
            var Nz = (x1 * y2) - (x2 * y1);
            var l = sqrt(sqr(Nx) + sqr(Ny) + sqr(Nz));
            
            if (l <= 0)
                continue;
            
            l = 1 / l;
            Nx *= l;
            Ny *= l;
            Nz *= l;
            var j = i + 12;
            buffer_seek(buff, buffer_seek_start, j);
            buffer_write(buff, buffer_f32, Nx);
            buffer_write(buff, buffer_f32, Ny);
            buffer_write(buff, buffer_f32, Nz);
            buffer_seek(buff, buffer_seek_start, j + bytesPerVert);
            buffer_write(buff, buffer_f32, Nx);
            buffer_write(buff, buffer_f32, Ny);
            buffer_write(buff, buffer_f32, Nz);
            buffer_seek(buff, buffer_seek_start, j + (2 * bytesPerVert));
            buffer_write(buff, buffer_f32, Nx);
            buffer_write(buff, buffer_f32, Ny);
            buffer_write(buff, buffer_f32, Nz);
        }
    }
}
