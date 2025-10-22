function mbuff_tesselate_uvs(arg0)
{
    var mBuff = arg0;
    
    if (!is_array(mBuff))
        mBuff = [mBuff];
    
    var modelNum = array_length(mBuff);
    
    if (modelNum <= 0)
        return -1;
    
    var w = array_create(3);
    var corner = [array_create(11), array_create(11), array_create(11)];
    var pointGrid = ds_grid_create(1, 1);
    var bytesPerVert = 44;
    
    for (var m = 0; m < modelNum; m++)
    {
        var buff = mBuff[m];
        var buffSize = buffer_get_size(buff);
        var tempBuffer = buffer_create(buffSize, buffer_grow, 1);
        buffer_seek(tempBuffer, buffer_seek_start, 0);
        buffer_seek(buff, buffer_seek_start, 0);
        
        for (var i = 0; i < buffSize; i += bytesPerVert)
        {
            var j = (i div bytesPerVert) % 3;
            
            for (var k = 0; k < 11; k++)
                array_set(corner[j], k, buffer_read(buff, buffer_f32));
            
            if (j != 2)
                continue;
            
            var c1 = corner[0];
            var c2 = corner[1];
            var c3 = corner[2];
            var startU = floor(min(c1[6], c2[6], c3[6]));
            var startV = floor(min(c1[7], c2[7], c3[7]));
            var endU = ceil(max(c1[6], c2[6], c3[6]));
            var endV = ceil(max(c1[7], c2[7], c3[7]));
            var width = endU - startU;
            var height = endV - startV;
            
            if ((width <= 1 && height <= 1) || width > 100 || height > 100)
            {
                for (var k = 0; k < 3; k++)
                {
                    var c = corner[k];
                    
                    for (var l = 0; l < 11; l++)
                    {
                        var val = c[l];
                        
                        if (l == 6)
                            val -= startU;
                        
                        if (l == 7)
                            val -= startV;
                        
                        buffer_write(tempBuffer, buffer_f32, val);
                    }
                }
            }
            else
            {
                var clockwise = sign(((c2[7] - c1[7]) * (c3[6] - c1[6])) - ((c2[6] - c1[6]) * (c3[7] - c1[7])));
                ds_grid_clear(pointGrid, -1);
                ds_grid_resize(pointGrid, width + 1, height + 1);
                _mbuff_tesselate_add_point(pointGrid, [c1[6], c1[7]], startU, startV);
                _mbuff_tesselate_add_point(pointGrid, [c2[6], c2[7]], startU, startV);
                _mbuff_tesselate_add_point(pointGrid, [c3[6], c3[7]], startU, startV);
                
                for (var k = 0; k < 3; k++)
                {
                    var vert0 = corner[k];
                    var vert1 = corner[(k + 1) % 3];
                    var dU = vert1[6] - vert0[6];
                    var dV = vert1[7] - vert0[7];
                    
                    if (dU != 0)
                    {
                        dU = 1 / dU;
                        var start = ceil(min(vert0[6], vert1[6]));
                        var stop = ceil(max(vert0[6], vert1[6]));
                        
                        for (u = start; u < stop; u++)
                        {
                            var amount = (u - vert0[6]) * dU;
                            
                            if (amount < 0 || amount > 1)
                                continue;
                            
                            var v = lerp(vert0[7], vert1[7], amount);
                            _mbuff_tesselate_add_point(pointGrid, [u, v], startU, startV);
                        }
                    }
                    
                    if (dV != 0)
                    {
                        dV = 1 / dV;
                        var start = ceil(min(vert0[7], vert1[7]));
                        var stop = ceil(max(vert0[7], vert1[7]));
                        
                        for (var v = start; v < stop; v++)
                        {
                            var amount = (v - vert0[7]) * dV;
                            
                            if (amount < 0 || amount > 1)
                                continue;
                            
                            u = lerp(vert0[6], vert1[6], amount);
                            _mbuff_tesselate_add_point(pointGrid, [u, v], startU, startV);
                        }
                    }
                }
                
                var u = startU + 1;
                
                while (u < endU)
                {
                    var v = startV + 1;
                    
                    while (v < endV)
                    {
                        if (point_in_triangle(u, v, c1[6], c1[7], c2[6], c2[7], c3[6], c3[7]))
                            _mbuff_tesselate_add_point(pointGrid, [u, v], startU, startV);
                        
                        v++;
                    }
                    
                    u++;
                }
                
                for (u = startU; u < endU; u++)
                {
                    for (var v = startV; v < endV; v++)
                    {
                        var array = ds_grid_get(pointGrid, u - startU, v - startV);
                        
                        if (!is_array(array))
                            continue;
                        
                        var num = array_length(array);
                        
                        if (num <= 2)
                            continue;
                        
                        var middleX = 0;
                        var middleY = 0;
                        
                        for (var p = 0; p < num; p++)
                        {
                            middleX += array_get(array[p], 0);
                            middleY += array_get(array[p], 1);
                        }
                        
                        middleX /= num;
                        middleY /= num;
                        var pos = 0;
                        var sortedArray = array_create(num);
                        
                        while (pos < num)
                        {
                            var minAngle = 360;
                            var nextP = 0;
                            
                            for (var p = 0; p < (num - pos); p++)
                            {
                                var angle = clockwise * point_direction(middleX, middleY, array_get(array[p], 0), array_get(array[p], 1));
                                
                                if (angle < minAngle)
                                {
                                    minAngle = angle;
                                    nextP = p;
                                }
                            }
                            
                            sortedArray[pos++] = array[nextP];
                            array = _array_delete(array, nextP);
                        }
                        
                        w[0] = _mbuff_get_triangle_weights(c1[6], c1[7], c2[6], c2[7], c3[6], c3[7], array_get(sortedArray[0], 0), array_get(sortedArray[0], 1));
                        w[2] = _mbuff_get_triangle_weights(c1[6], c1[7], c2[6], c2[7], c3[6], c3[7], array_get(sortedArray[1], 0), array_get(sortedArray[1], 1));
                        
                        for (var p = 2; p < num; p++)
                        {
                            w[1] = w[2];
                            w[2] = _mbuff_get_triangle_weights(c1[6], c1[7], c2[6], c2[7], c3[6], c3[7], array_get(sortedArray[p], 0), array_get(sortedArray[p], 1));
                            
                            for (var k = 0; k < 3; k++)
                            {
                                var _w = w[k];
                                
                                for (var l = 0; l < 9; l++)
                                {
                                    var val = (c1[l] * _w[0]) + (c2[l] * _w[1]) + (c3[l] * _w[2]);
                                    
                                    if (l == 6)
                                        val -= u;
                                    
                                    if (l == 7)
                                        val -= v;
                                    
                                    buffer_write(tempBuffer, buffer_f32, val);
                                }
                                
                                var M = max(_w[0], _w[1], _w[2]);
                                buffer_write(tempBuffer, buffer_f32, (_w[0] == M) ? c1[9] : ((_w[1] == M) ? c2[9] : c3[9]));
                                buffer_write(tempBuffer, buffer_f32, (_w[0] == M) ? c1[10] : ((_w[1] == M) ? c2[10] : c3[10]));
                            }
                        }
                    }
                }
            }
        }
        
        buffSize = buffer_tell(tempBuffer);
        buffer_resize(buff, buffSize);
        buffer_copy(tempBuffer, 0, buffSize, buff, 0);
        buffer_delete(tempBuffer);
    }
    
    ds_grid_destroy(pointGrid);
}
