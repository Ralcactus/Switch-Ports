function mbuff_create_smooth_normals(arg0)
{
    var mBuff = arg0;
    
    if (!is_array(mBuff))
        mBuff = [mBuff];
    
    var bytesPerVert = 44;
    var bytesPerTri = bytesPerVert * 3;
    var modelNum = array_length(mBuff);
    var normalMap = ds_map_create();
    
    for (var m = 0; m < modelNum; m++)
    {
        var buff = mBuff[m];
        var bufferSize = buffer_get_size(buff);
        var i = 0;
        
        while (i < bufferSize)
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
            var Nx = (y1 * z2) - (z1 * y2);
            var Ny = (z1 * x2) - (x1 * z2);
            var Nz = (x1 * y2) - (y1 * x2);
            var l = sqrt(sqr(Nx) + sqr(Ny) + sqr(Nz));
            
            if (l <= 0)
            {
            }
            else
            {
                l = 1 / l;
                Nx *= l;
                Ny *= l;
                Nz *= l;
                var key = string(P0) + "," + string(P1) + "," + string(P2);
                var N = ds_map_find_value(normalMap, key);
                
                if (is_undefined(N))
                {
                    ds_map_set(normalMap, key, [Nx, Ny, Nz]);
                }
                else
                {
                    N[0] += Nx;
                    N[1] += Ny;
                    N[2] += Nz;
                }
                
                key = string(P3) + "," + string(P4) + "," + string(P5);
                N = ds_map_find_value(normalMap, key);
                
                if (is_undefined(N))
                {
                    ds_map_set(normalMap, key, [Nx, Ny, Nz]);
                }
                else
                {
                    N[0] += Nx;
                    N[1] += Ny;
                    N[2] += Nz;
                }
                
                key = string(P6) + "," + string(P7) + "," + string(P8);
                N = ds_map_find_value(normalMap, key);
                
                if (is_undefined(N))
                {
                    ds_map_set(normalMap, key, [Nx, Ny, Nz]);
                }
                else
                {
                    N[0] += Nx;
                    N[1] += Ny;
                    N[2] += Nz;
                }
            }
            
            i += (3 * bytesPerVert);
        }
    }
    
    for (var m = 0; m < modelNum; m++)
    {
        var buff = mBuff[m];
        var bufferSize = buffer_get_size(buff);
        
        for (var i = 0; i < bufferSize; i += bytesPerVert)
        {
            buffer_seek(buff, buffer_seek_start, i);
            var P0 = buffer_read(buff, buffer_f32);
            var P1 = buffer_read(buff, buffer_f32);
            var P2 = buffer_read(buff, buffer_f32);
            var key = string(P0) + "," + string(P1) + "," + string(P2);
            var N = ds_map_find_value(normalMap, key);
            
            if (is_undefined(N))
                continue;
            
            var l = sqr(N[0]) + sqr(N[1]) + sqr(N[2]);
            
            if (l <= 0)
                continue;
            
            l = 1 / sqrt(l);
            buffer_write(buff, buffer_f32, N[0] * l);
            buffer_write(buff, buffer_f32, N[1] * l);
            buffer_write(buff, buffer_f32, N[2] * l);
        }
    }
    
    ds_map_destroy(normalMap);
}
