function mbuff_create_flat_tangents(arg0)
{
    var mBuff = arg0;
    
    if (!is_array(mBuff))
        mBuff = [mBuff];
    
    var bytesPerVert = 44;
    var bytesPerTri = bytesPerVert * 3;
    var epsilon = math_get_epsilon();
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
            var N0 = buffer_read(buff, buffer_f32);
            var N1 = buffer_read(buff, buffer_f32);
            var N2 = buffer_read(buff, buffer_f32);
            var T0 = buffer_read(buff, buffer_f32);
            var T1 = buffer_read(buff, buffer_f32);
            buffer_seek(buff, buffer_seek_start, i + bytesPerVert);
            var P3 = buffer_read(buff, buffer_f32);
            var P4 = buffer_read(buff, buffer_f32);
            var P5 = buffer_read(buff, buffer_f32);
            var N3 = buffer_read(buff, buffer_f32);
            var N4 = buffer_read(buff, buffer_f32);
            var N5 = buffer_read(buff, buffer_f32);
            var T2 = buffer_read(buff, buffer_f32);
            var T3 = buffer_read(buff, buffer_f32);
            buffer_seek(buff, buffer_seek_start, i + (2 * bytesPerVert));
            var P6 = buffer_read(buff, buffer_f32);
            var P7 = buffer_read(buff, buffer_f32);
            var P8 = buffer_read(buff, buffer_f32);
            var N6 = buffer_read(buff, buffer_f32);
            var N7 = buffer_read(buff, buffer_f32);
            var N8 = buffer_read(buff, buffer_f32);
            var T4 = buffer_read(buff, buffer_f32);
            var T5 = buffer_read(buff, buffer_f32);
            var p1x = P3 - P0;
            var p1y = P4 - P1;
            var p1z = P5 - P2;
            var p2x = P6 - P0;
            var p2y = P7 - P1;
            var p2z = P8 - P2;
            var s1 = T2 - T0;
            var s2 = T4 - T0;
            var t1 = T3 - T1;
            var t2 = T5 - T1;
            var r = 1 / max(epsilon, (s1 * t2) - (s2 * t1));
            var sdx = ((t2 * p1x) - (t1 * p2x)) * r;
            var sdy = ((t2 * p1y) - (t1 * p2y)) * r;
            var sdz = ((t2 * p1z) - (t1 * p2z)) * r;
            var tdx = ((s1 * p2x) - (s2 * p1x)) * r;
            var tdy = ((s1 * p2y) - (s2 * p1y)) * r;
            var tdz = ((s1 * p2z) - (s2 * p1z)) * r;
            var dp = (N0 * sdx) + (N1 * sdy) + (N2 * sdz);
            var Tx = sdx - (N0 * dp);
            var Ty = sdy - (N1 * dp);
            var Tz = sdz - (N2 * dp);
            var l = point_distance_3d(0, 0, 0, Tx, Ty, Tz);
            
            if (l != 0)
            {
                Tx /= l;
                Ty /= l;
                Tz /= l;
            }
            
            var Th = sign((tdx * ((Ty * N2) - (Tz * N1))) + (tdy * ((Tz * N0) - (Tx * N2))) + (tdz * ((Tx * N1) - (Ty * N0))));
            buffer_seek(buff, buffer_seek_start, i + 32);
            buffer_write(buff, buffer_u8, (Tx + 1) * 127);
            buffer_write(buff, buffer_u8, (Ty + 1) * 127);
            buffer_write(buff, buffer_u8, (Tz + 1) * 127);
            buffer_write(buff, buffer_u8, (Th + 1) * 127);
            dp = (N3 * sdx) + (N4 * sdy) + (N5 * sdz);
            Tx = sdx - (N3 * dp);
            Ty = sdy - (N4 * dp);
            Tz = sdz - (N5 * dp);
            l = point_distance_3d(0, 0, 0, Tx, Ty, Tz);
            
            if (l != 0)
            {
                Tx /= l;
                Ty /= l;
                Tz /= l;
            }
            
            Th = sign((tdx * ((Ty * N5) - (Tz * N4))) + (tdy * ((Tz * N3) - (Tx * N5))) + (tdz * ((Tx * N4) - (Ty * N3))));
            buffer_seek(buff, buffer_seek_start, i + bytesPerVert + 32);
            buffer_write(buff, buffer_u8, (Tx + 1) * 127);
            buffer_write(buff, buffer_u8, (Ty + 1) * 127);
            buffer_write(buff, buffer_u8, (Tz + 1) * 127);
            buffer_write(buff, buffer_u8, (Th + 1) * 127);
            dp = (N6 * sdx) + (N7 * sdy) + (N8 * sdz);
            Tx = sdx - (N6 * dp);
            Ty = sdy - (N7 * dp);
            Tz = sdz - (N8 * dp);
            l = point_distance_3d(0, 0, 0, Tx, Ty, Tz);
            
            if (l != 0)
            {
                Tx /= l;
                Ty /= l;
                Tz /= l;
            }
            
            Th = sign((tdx * ((Ty * N8) - (Tz * N7))) + (tdy * ((Tz * N6) - (Tx * N8))) + (tdz * ((Tx * N7) - (Ty * N6))));
            buffer_seek(buff, buffer_seek_start, i + (2 * bytesPerVert) + 32);
            buffer_write(buff, buffer_u8, (Tx + 1) * 127);
            buffer_write(buff, buffer_u8, (Ty + 1) * 127);
            buffer_write(buff, buffer_u8, (Tz + 1) * 127);
            buffer_write(buff, buffer_u8, (Th + 1) * 127);
        }
    }
}
