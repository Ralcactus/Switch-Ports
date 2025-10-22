function mbuff_get_boundingbox(arg0)
{
    var mBuff = arg0;
    
    if (!is_array(mBuff))
        mBuff = [mBuff];
    
    var bytesPerVert = 44;
    var h = 999999;
    var minX = h;
    var minY = h;
    var minZ = h;
    var maxX = -h;
    var maxY = -h;
    var maxZ = -h;
    var modelNum = array_length(mBuff);
    
    for (var m = 0; m < modelNum; m++)
    {
        var buff = mBuff[m];
        var buffSize = buffer_get_size(buff);
        var i = 3 * bytesPerVert;
        
        while (i < buffSize)
        {
            buffer_seek(buff, buffer_seek_start, i);
            var v = buffer_read(buff, buffer_f32);
            minX = min(minX, v);
            maxX = max(maxX, v);
            v = buffer_read(buff, buffer_f32);
            minY = min(minY, v);
            maxY = max(maxY, v);
            v = buffer_read(buff, buffer_f32);
            minZ = min(minZ, v);
            maxZ = max(maxZ, v);
            i += bytesPerVert;
        }
    }
    
    return [minX, minY, minZ, maxX, maxY, maxZ];
}
